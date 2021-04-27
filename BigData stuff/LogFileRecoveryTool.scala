package com.aironman.spark.clarity

import java.io.File
import java.nio.charset.Charset

import com.google.common.io.Files

import org.apache.spark.{SparkConf, SparkContext}
import org.apache.spark.broadcast.Broadcast
import org.apache.spark.rdd.RDD
import org.apache.spark.streaming.{Seconds, StreamingContext, Time}
import org.apache.spark.util.{IntParam, LongAccumulator}

/**
 * Recovering log file in text encoded with UTF8 received from the network every second.
 *
 * Usage: LogFileRecoveryTool <hostname> <port> <checkpoint-directory> <output-file>
 *   <hostname> and <port> describe the TCP server that Spark Streaming would connect to receive
 *   data. 
 *  <checkpoint-directory> directory to HDFS-compatible file system which checkpoint data
 *  <output-file> file to which the log data file will be appended
 *
 * <checkpoint-directory> and <output-file> must be absolute paths
 *
 * To run this on your local machine, you need to first run a Netcat server. 
 * NetCat will be used as a simulation of an external server, so once you launch
 * the process, I will copy log lines simulating the creation of lines in an external file system.
 *
 *      `$ nc -lk 9999`
 *
 * and run the example as
 *
 *      `$ spark-submit com.aironman.spark.clarity.LogFileRecoveryTool localhost 9999 your-checkpoint-directory your-output-file`
 *
 * If the directory your-checkpoint-directory does not exist (e.g. running for the first time), it will create
 * a new StreamingContext (will print "Creating new context" to the console). Otherwise, if
 * checkpoint data exists in your-checkpoint-directory, then it will create StreamingContext from
 * the checkpoint data.
 *
 */
object LogFileRecoveryTool {

  def createContext(ip: String, port: Int, outputPath: String, checkpointDirectory: String)
    : StreamingContext = {

    // If you do not see this printed, that means the StreamingContext has been loaded
    // from the new checkpoint
    println("Creating new context")
    val outputFile = new File(outputPath)
    if (outputFile.exists()) outputFile.delete()
    val sparkConf = new SparkConf().setAppName("LogFileRecoveryTool")
    // Create the context with a 1 second batch size
    val ssc = new StreamingContext(sparkConf, Seconds(1))
    ssc.checkpoint(checkpointDirectory)

    // Create a socket stream on target ip:port and simply recovering data in input stream of \n delimited text (eg. generated by 'nc')
    val lines = ssc.socketTextStream(ip, port)
    println(s"Appending to ${outputFile.getAbsolutePath}")
    Files.append(lines + "\n", outputFile, Charset.defaultCharset())
    }
    ssc
  }

  def main(args: Array[String]): Unit = {
    if (args.length != 4) {
      System.err.println(s"Your arguments were ${args.mkString("[", ", ", "]")}")
      System.err.println(
        """
          |Usage: LogFileRecoveryTool <hostname> <port> <checkpoint-directory>
          |     <output-file>. <hostname> and <port> describe the TCP server that Spark
          |     Streaming would connect to receive data. <checkpoint-directory> directory to
          |     HDFS-compatible file system which checkpoint data <output-file> file to which the
          |     word counts will be appended
          |
          |In local mode, <master> should be 'local[n]' with n > 1
          |Both <checkpoint-directory> and <output-file> must be absolute paths
        """.stripMargin
      )
      System.exit(1)
    }
    val Array(ip, IntParam(port), checkpointDirectory, outputPath) = args
    val ssc = StreamingContext.getOrCreate(checkpointDirectory,
      () => createContext(ip, port, outputPath, checkpointDirectory))
    ssc.start()
    ssc.awaitTermination()
  }
}
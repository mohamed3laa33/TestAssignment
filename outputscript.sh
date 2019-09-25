#! /bin/sh 
zip windowsoutput_$BUILD_NUMBER.zip HelloWorldSolution/windows windowsbuildlogfile.txt
zip ubuntuoutput_$BUILD_NUMBER.zip  HelloWorldSolution/ubuntu ubuntubuildlogfile.txt 

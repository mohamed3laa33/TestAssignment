#! /bin/sh
echo "Adding Windows output"
zip windowsoutput_$BUILD_NUMBER.zip HelloWorldSolution/windows windowsbuildlogfile.txt lint_checker_output.txt
echo "Adding Ubunu output"
zip ubuntuoutput_$BUILD_NUMBER.zip  HelloWorldSolution/ubuntu ubuntubuildlogfile.txt lint_checker_output.txt 

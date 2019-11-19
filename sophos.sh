#! /bin/bash

echo "executing command"
output="$(~/.caa/bin/caa -d)"
echo "Output: $output"

if [ "$output" == "" ]
then
    echo "Not running"
    output="$(~/.caa/bin/caa -d)"
    pid=$(pgrep caa)
    echo "Restarted with PID: $pid"
    #	echo $output
else
    echo "Running"
    pid=$(pgrep caa)
    echo "Process ID: $pid"
    kill $pid
    echo "Killed PID: $pid"
    echo "Restarting..."
    output="$(~/.caa/bin/caa -d)"
    echo $output
    pid=$(pgrep caa)
    echo "New PID: $pid"
fi


#substring=${output:4:7}
#echo $substring
#keyword="already"
#if [ $substring == $keyword ]
#then
#	echo "running"
#	pid=$(pgrep caa)
#	echo $pid
#	kill $pid
#	echo "killed"
#	output="$(~/.caa/bin/caa)"
#	echo $output
#else
#	echo "NOT running"
#	output=$("~/.caa/bin/caa -d")
#fi

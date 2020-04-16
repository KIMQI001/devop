#!/bin/bash

PID=$1
LOG="./memwatch.log"
rm "$LOG"
while [ "$PID"!="" ]
do
    cat /proc/$PID/status | grep RSS  >> "$LOG"
    cat /proc/$PID/status | grep Swap  >> "$LOG"
    sleep 2
done

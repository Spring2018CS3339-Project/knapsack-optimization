#!/bin/bash

# Accept exactly 3 arguments
if [ $# -ne 3 ]; then
   exit 1
fi

exc=$1
input=$2
flags=$3

top -b -n1 > top-output.dat

echo "access time,date,top(users shared),knapsack files,flags,real time,user time,sys time" > spreadsheet.dat
# Read the file line by line.
# Use each flag to compile the program.
cat $flags | while read flag
do
   # Compile with optimization
   g++ -$flag -o $exc knapsack.cpp
   # Run the experiment and store the results
   new_line="$(date +'%T'),$(date),TBD,knapsack.cpp,$flag"
   counter=0
   (time ./$exc $input) > exc.dat 2> time_data.dat
   cat time_data.dat| while read line
   do
      val=$(echo $line | awk '{print $2}')
      # Skip if the val is blank
      if [ ! -z $val ]; then
         # Want to grab 3 time stamps per line
         new_line="$new_line,$val"
         counter=$((counter+1))
      fi

      # Print the completed line to the file
      if [ $counter -eq 3 ]; then
         echo $new_line >> spreadsheet.dat
      fi
   done
done

exit 0

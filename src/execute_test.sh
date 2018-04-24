#!/bin/bash

# Accept exactly 3 arguments
if [ $# -ne 3 ]; then
   exit 1
fi

exc=$1
input=$2
flags=$3
ts=$(date +'%s')
spreadsheet="data_run_$ts.csv"
topdata="top_output_$ts.out"
file="optimized_knapsack.cpp"
timeout="time_data.dat"
stdout="exc.dat"

echo "" > results.dat

top -b -n 1 | head -n 5 > "$topdata"

echo "access time,date,knapsack files,flags,real time,user time,sys time" > "$spreadsheet"
# Read the file line by line.
# Use each flag to compile the program.
cat $flags | while read flag
do
   printf "Compiling and running %s with optimization(s): %s\n" "$file" "$flag"
   # Compile with optimization
   g++ $flag -o $exc "$file" -fopenmp
   # Run the experiment and store the results
   new_line="$(date +'%T'),$(date),$file,$flag"
   counter=0
   (time ./$exc $input) > "$stdout" 2> "$timeout"
   cat "$timeout" | while read line
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
         echo $new_line >> "$spreadsheet"
      fi
   done
done

rm "$exc"

exit 0

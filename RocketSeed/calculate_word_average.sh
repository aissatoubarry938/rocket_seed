
#!/bin/bash

# Check if an argument is provided
if [ $# -eq 0 ]; then
  echo "Please provide a directory name as an argument."
  exit 1
fi

# Store the directory name from the argument
directory=$1

# Check if the directory exists
if [ ! -d "$directory" ]; then
  echo "Directory not found."
  exit 1
fi

highest_average=0
highest_file=""

# Recursively find all .txt files in the directory
find "$directory" -type f -name "*.txt" | while read -r file; do
  # Check if the file is empty
  if [ ! -s "$file" ]; then
    echo "File: $file (Empty)"
    continue
  fi
 
  line_count=$(wc -l < "$file")  # Count the number of lines in the file
  word_count=$(wc -w < "$file")  # Count the total number of words in the file
  average=$((word_count / line_count))  # Calculate the average number of words per line
 
  # Display the file name and average
  echo "File: $file (Average: $average)"
 
  # Check if the current average is higher than the highest average
  if [ "$average" -gt "$highest_average" ]; then
    highest_average=$average
    highest_file=$file
  fi
done

# Display the file with the highest average word count
if [ -n "$highest_file" ]; then
  echo "File with Highest Average: $highest_file (Average: $highest_average)"
else
  echo "No .txt files found in the directory."
fi



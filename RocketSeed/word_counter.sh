#!/bin/bash

# Define the common English words to exclude
common_words=("the" "and" "in")

# Check if an argument is provided
if [ $# -eq 0 ]; then
  echo "Please provide a file name as an argument."
  exit 1
fi

# Store the file name from the argument
file_name=$1

# Check if the file exists
if [ ! -f "$file_name" ]; then
  echo "File not found."
  exit 1
fi

# Read the file and count word occurrences
word_count=$(tr -cs '[:alpha:]' '\n' < "$file_name" | tr '[:upper:]' '[:lower:]' | grep -v -wF "${common_words[*]}" | sort | uniq -c | sort -nr)

# Display the word count in descending order
echo "$word_count"



#!/bin/bash

# Check if an argument is provided
if [ $# -eq 0 ]; then
  echo "Please provide a file name as an argument."
  exit 1
fi

# Store the file name from the argument
file_name=$1

# Check if the file exists
if [ -e "$file_name" ]; then
  echo "File exists."
else
  echo "File not found."
fi



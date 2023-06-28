#!/bin/bash

# Prompt the user for database credentials
echo "Enter the PostgreSQL host:"
read host

echo "Enter the PostgreSQL port:"
read port

echo "Enter the PostgreSQL database name:"
read dbname

echo "Enter the PostgreSQL username:"
read username

echo "Enter the PostgreSQL password:"
read -s password
echo

# Execute the query to retrieve data from the users table
query="SELECT * FROM users"
result=$(PGPASSWORD="$password" psql -h "$host" -p "$port" -U "$username" -d "$dbname" -t -c "$query")

# Format the query results as CSV
csv_result=$(echo "$result" | sed 's/|/,/g')

# Prompt the user for email details
echo "Enter the sender's email address:"
read sender

echo "Enter the recipient's email address:"
read recipient

echo "Enter the email subject:"
read subject

echo "Enter an optional message:"
read message

# Compose the email with the query results as the content
email_content="Subject: $subject\nFrom: $sender\nTo: $recipient\n\n$message\n\n$query\n\n$csv_result"

# Send the email using the configured email client (e.g., sendmail)
echo -e "$email_content" | sendmail -t

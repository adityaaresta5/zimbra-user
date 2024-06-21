#!/bin/bash

# 1. List usernames (replace with command to retrieve usernames)
usernames=$(<user_list.txt)

for username in $usernames; do
  # 2. Search user mailbox
  results=$(zmmailbox -z -m $username s -t message "content:report")

  # 3. Process results (optional)
  # ...

  echo "---- Search results for user: $username ----"
  echo "$results"
  echo "-----------------------------------------"
done

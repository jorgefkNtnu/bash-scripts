#!/bin/bash

read -p "Enter a password:" password;

length=${#password}

if [ $length -lt 12 ]; then
echo "Your password is too short. It needs to be at least 12 characters." >&2
exit 1
fi

N=$(echo "$password" | grep -o . | sort -u | wc -l)

entropy=$(awk "BEGIN {print int(log($N) / log(2) * $length)}")

if [ "$entropy" -lt 80 ]; then
echo "Warning: Your password doesn't pass the entropy requirements." >&2
fi

echo "Checking password against rockyou.txt. This may take a while. Please wait..."

while IFS= read -r line; do
if [ "$password" == "$line" ]; then
echo "Password can be found in rock.txt" >&2
exit 2
fi
done < rockyou.txt

echo "Password is accepted. Exiting by default..."

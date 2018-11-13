#!/bin/bash
#Author: kovaku
#Description: Shell script practicing

echo "Running script..."

#accessing command line arguments
echo "Received command line arguments as array: $@"
echo "The number of received arguments are: $#"
echo "The zero argument is the command itself: $0"
echo "The first argument is: $1"

#variables
DOLLAR_PRICE="250"
echo "The price of \$1 in HUF: $DOLLAR_PRICE"
echo "The price of a dollar in HUF: ${DOLLAR_PRICE}"

#arrays
weekdays_array=(monday tuesday wednesday thursday friday)
spider_man_array=(peter "mary jane" "uncle ben" "aunt may")
echo "The length of the weekdays array: ${#weekdays_array[@]}"
echo "The first element of the weekdays array: ${weekdays_array[0]}"
echo "The last but one element of the weekdays array: ${weekdays_array[${#weekdays_array[@]}-2]}"
full_week_array=("${weekdays_array[@]}" saturday sunday)
full_week_array[7]="8th day"
echo "The days of the full week array: ${full_week_array[@]}"

#conditions
if [ "$1" = "skip" ]; then
  echo "The first argument was: skip"
fi

if [ "$1" = "sum" ]; then
  total=$(($2 + $3))
  echo "The sum of the values is $total"
else
  echo "No sum calculation for this time."
fi

if [[ "$1" = "square" && "$2" = "perimeter" ]]; then
  echo "The perimeter of the square is $((4 * $3))"
elif [[ "$1" = "square" && "$2" = "area" ]]; then
  echo "The area of the square is $(($3 * $3))"
else
    echo "No geometric calculation for this time."
fi

case $1 in
    skip) echo "You selected skip";;
    sum) echo "You selected sum";;
    square) echo "You selected square";;
    exit) echo "You selected exit!" & exit;;
    *) echo "Unrecognized command";;
esac

#loop on an array
iterator=0
echo "The elements of the week array:"
for day in ${full_week_array[@]}; do
  iterator=$((iterator + 1))
  echo "$iterator. $day"
done

# loop on command output results
echo "The commands of the bin folder:"
for f in $( ls /bin/. ) ; do
  echo "File: $f"
done

# do while
COUNT=4
while [[ ${COUNT} > 0 ]]; do
  echo "While - Value of count is: $COUNT"
  COUNT=$(($COUNT - 1))
done

# do until
COUNT=4
until [[ ${COUNT} = 0 ]]; do
  echo "Until - Value of count is: $COUNT"
  COUNT=$(($COUNT - 1))
done

#echo and user input
#read -p "Username: " USERNAME
#read -s -p "Password: "
#echo "Welcome $USERNAME with password of $REPLY"






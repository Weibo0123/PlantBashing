#!/bin/bash
echo "Welcome to the PlantBashing game!!!"

echo "What is your name?"
read name

echo "Hello, $name! Nice to meet you"

sleep 5

while true; do
echo "Do you want to plant a new seed? (yes/no)"
read choice

if [ "$choice" == "yes" ]; then
    # If the user chooses 'yes', let them know they have planted a seed
    echo "You have dug a hole and planted a small seed the size of a grain of rice."
    sleep 3
    echo "In the Computer's digital world, the ime moves mush faster than it does outside in the reality.Do you want to wait for one day?"
    read wait

    if [ "$wait" == "yes" ]; then
        echo "wait for one days"
        sleep 3
        echo "Nothing Happen, do you want to wait for one more days?"
        read wait2
        if [[ "$wait2" == "yes" ]]; then
            echo "The seed germinated over night!"
        else 
            break
        fi
    elif [ "$wait" == "no" ]; then
    echo "You chose not to wait. Exiting in 3 seconds..."
    sleep 3
    break
fi

    break
elif [ "$choice" == "no" ]; then
    echo "You chose not to plant a seed. Exiting in 3 seconds..."
    sleep 3
    break
else
	echo "You can only anwser yes or no"
fi
done

echo "Goodbye"
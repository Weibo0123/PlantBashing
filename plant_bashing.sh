#!/bin/bash
echo "Welcome to the PlantBashing game!!!"

echo "What is your name?"
read name

echo "Hello, $name! Nice to meet you"

#sleep 1

ex=false
while [ "$ex" = false ]
do
echo "Do you want to plant a new seed? (yes/no)"
read choice

if [ "$choice" = "yes" ]; then
    # If the user chooses 'yes', let them know they have planted a seed
    echo "Day 1: You have dug a hole and planted a small seed the size of a grain of rice."
    #sleep 1
    echo "In the Computer's digital world, the time moves mush faster than it does outside in the reality.Do you want to wait for one day?"
    read wait

    if [ "$wait" = "yes" ]; then
        echo "wait for one days"
        #sleep 1
        echo "Day 2: Nothing Happen, do you want to wait for one more days?"
        read wait2
        if [ "$wait2" = "yes" ]; then
            echo "Day 3: The seed germinated over night!"
            #sleep 1
            echo "Do you want wait for sapling"
            read wait3
            if [ "$wait3" = "yes" ]; then
                echo "Day 4: Nothing Happen, do you want to wait for one more days?"
                read wait4
                if [ "$wait4" = "yes" ]; then
                    echo "Day 5: Nothing Happen, do you want to wait for one more days?"
                    read wait5
                    if [ "$wait5" = "yes" ]; then
                        echo "Day 6: The plant grew over night into a sapling!"
                        wait6=true
                        day=6
                        height=4
                        while [ "$wait6" = true ] 
                        do
                            echo "Do you want to wait?"
                            read wa
                            if [[ "$wa" = "yes" && "$height" -le 34 ]]; then
                                day=$((day + 1))
                                height=$((height + 2))
                                echo "Day $day: The plant grows 2cm and 2 leaves, the current height is $height and there are $height leaves now."
                            elif [ "$height" -ge 34 ]; then
                                echo "Your plant is mature, the Final height is 34cm and the total leaf is 34."
                                echo "Thank you for your playing"
                                wait6=false
                            fi
                        done
                            else
                            echo "You chose not to wait. Exiting in 3 seconds..."
                            #sleep 3
                            wait6=false
                            fi
                    else
                    echo "You chose not to wait. Exiting in 3 seconds..."
                    #sleep 3
                    ex=true
                    fi
                else
                echo "You chose not to wait. Exiting in 3 seconds..."
                #sleep 3
                ex=true
                fi      
            else
            echo "You chose not to wait. Exiting in 3 seconds..."
            #sleep 3
            ex=true
            fi
    elif [ "$wait" = "no" ]; then
    echo "You chose not to wait. Exiting in 3 seconds..."
    #sleep 3
    ex=true
fi
elif [ "$choice" = "no" ]; then
    echo "You chose not to plant a seed. Exiting in 3 seconds..."
    #sleep 3
    ex=true
else
	echo "You can only answer yes or no"
fi
done

echo "Goodbye"
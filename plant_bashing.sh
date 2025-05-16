#!/bin/bash

echo "Welcome to the PlantBashing game!!!"

echo "What is your name?"
read name

echo "Hello, $name! Nice to meet you"

# Variables initialization
exit=true
plant_names=("Morpheus" "Analies" "Izzy")
play_times=0
Morpheus=0
Analies=0
Izzy=0

choose_weathers()
{
    weathers=( "Rainy" "Sunny" "Cloudy" "Overcast" "Windstorm" "Rainy" "Foggy" )
    random_index=$(( RANDOM % ${#weathers[@]} ))
    echo "${weathers[$random_index]}"
}

while $exit
do
    echo "Do you want to plant a new seed? (yes/no)"
    read choice

    if [ "$choice" = "yes" ]; then
        # If the user chooses 'yes', let them know they have planted a seed
        echo "Day 1: You have dug a hole and planted a small seed the size of a grain of rice."

        if [ "$play_times" -lt 1 ]; then
            echo "Do you want to name the plant?"
        else
            echo "Do you want to change the plant's name?"
        fi
        
        read answer
        
        if [ "$answer" = "yes" ]; then
            echo "What do you want to name it?"
            read plant_name
            echo "Your plant's name is $plant_name!"
        else
            # Check if all names have been used
            if [ "$Morpheus" -eq 1 ] && [ "$Analies" -eq 1 ] && [ "$Izzy" -eq 1 ]; then
                # Reset all names after all have been used
                Morpheus=0
                Analies=0
                Izzy=0
            fi

            # Assign next available plant name
            if [ "$Morpheus" -eq 0 ]; then
                plant_name="${plant_names[0]}"
                Morpheus=1
            elif [ "$Analies" -eq 0 ]; then
                plant_name="${plant_names[1]}"
                Analies=1
            elif [ "$Izzy" -eq 0 ]; then
                plant_name="${plant_names[2]}"
                Izzy=1
            fi

            echo "Your plant's name is $plant_name!"
        fi

        # Proceed with waiting for the plant's growth
        echo "In the Computer's digital world, time moves much faster than it does outside. Do you want to wait for one day?"
        read wait
        if [ "$wait" = "yes" ]; then
            echo "Waiting for one day..."
            echo "Day 2"
            choose_weathers
            echo "Nothing happened, do you want to wait for one more day?"
            read wait
            if [ "$wait" = "yes" ]; then
                echo "Day 3"
                echo "The seed germinated overnight!"
                choose_weathers
                echo "Do you want to wait for the sapling?"

                read wait
                if [ "$wait" = "yes" ]; then
                    echo "Day 4: Nothing happened, do you want to wait for one more day?"
                    choose_weathers
                    read wait
                    if [ "$wait" = "yes" ]; then
                        echo "Day 5: Nothing happened, do you want to wait for one more day?"
                        choose_weathers
                        read wait
                        if [ "$wait" = "yes" ]; then
                            echo "Day 6: The plant grew overnight into a sapling!"
                            choose_weathers
                            wait=true
                            day=6
                            height=4
                            while [ "$wait" = true ]; do
                                echo "Do you want to wait for the plant to grow?"
                                read wa
                                if [ "$wa" = "yes" ] && [ "$height" -lt 32 ]; then
                                    day=$((day + 1))
                                    height=$((height + 2))
                                    echo "Day $day: The plant grows 2cm and 2 leaves. Current height: $height cm, total leaves: $height."
                                    choose_weathers                                
                                elif [ "$height" -ge 32 ]; then
                                    echo "Your plant is mature! Final height: 34cm, total leaves: 34."
                                    echo "Thank you for playing!"
                                   wait=false
                                    ((play_times=play_times+1))
                                else
                                    echo "You chose not to wait. Exiting in 3 seconds..."
                                    wait=false
                                fi
                            done
                        else
                            echo "You chose not to wait. Exiting in 3 seconds..."
                            wait=false
                        fi
                    else
                        echo "You chose not to wait. Exiting in 3 seconds..."
                        exit=false
                    fi
                else
                    echo "You chose not to wait. Exiting in 3 seconds..."
                    exit=false
                fi
            else
                echo "You chose not to wait. Exiting in 3 seconds..."
                exit=false
            fi
        elif [ "$wait" = "no" ]; then
            echo "You chose not to wait. Exiting in 3 seconds..."
            exit=false
        fi
    elif [ "$choice" = "no" ]; then
        echo "You chose not to plant a seed. Exiting in 3 seconds..."
        exit=false
    else
        echo "You can only answer yes or no!"
    fi
done
echo "Goodbye!"



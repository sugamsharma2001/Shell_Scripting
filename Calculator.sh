
#!/bin/bash

# Dynamic Calculator

echo "=============================="
echo "       BASH CALCULATOR"
echo "=============================="

while true
do
    echo ""
    echo "Choose an operation:"
    echo "1. Addition (+)"
    echo "2. Subtraction (-)"
    echo "3. Multiplication (*)"
    echo "4. Division (/)"
    echo "5. Modulus (%)"
    echo "6. Exponentiation (**)"
    echo "7. Exit"

    read -p "Enter your choice: " choice

    if [[ "$choice" == "7" ]]
    then
        echo "Calculator closed. Goodbye!"
        break
    fi

    case $choice in
        1) operator="+" ;;
        2) operator="-" ;;
        3) operator="*" ;;
        4) operator="/" ;;
        5) operator="%" ;;
        6) operator="**" ;;
        *)
            echo "Invalid choice!"
            continue
            ;;
    esac

    read -p "How many numbers do you want to enter? " count

    if ! [[ "$count" =~ ^[1-9][0-9]*$ ]]
    then
        echo "Please enter a valid positive integer."
        continue
    fi

    echo "Enter number 1:"
    read result

    valid=true

    for (( i=2; i<=count; i++ ))
    do
        read -p "Enter number $i: " num

        case $operator in
            "+") result=$((result + num)) ;;
            "-") result=$((result - num)) ;;
            "*") result=$((result * num)) ;;
            "/")
                if (( num == 0 ))
                then
                    echo "Error: Division by zero!"
                    valid=false
                    break
                fi
                result=$((result / num))
                ;;
            "%")
                if (( num == 0 ))
                then
                    echo "Error: Modulus by zero!"
                    valid=false
                    break
                fi
                result=$((result % num))
                ;;
            "**") result=$((result ** num)) ;;
        esac
    done

    if [[ "$valid" == true ]]
    then
        echo "=============================="
        echo "Result: $result"
        echo "=============================="
    fi

done



#!/bin/bash

# Dynamic Mathematical Calculator

# Check whether bc is installed
if ! command -v bc &> /dev/null
then
    echo "bc is not installed."
    echo "Install it using: sudo apt install bc"
    exit 1
fi

while true
do
    echo ""
    echo "================================"
    echo "       DYNAMIC CALCULATOR"
    echo "================================"

    read -p "Enter first number: " first

    # Validate first number
    if ! [[ "$first" =~ ^-?([0-9]+([.][0-9]*)?|[.][0-9]+)$ ]]
    then
        echo "Invalid number!"
        continue
    fi

    # Store complete mathematical expression
    expression="$first"

    while true
    do
        echo ""
        echo "Current Expression: $expression"

        read -p "Enter operator (+, -, *, /, %, ^, =): " operator

        # Finish calculation
        if [[ "$operator" == "=" ]]
        then
            break
        fi

        # Validate operator
        case "$operator" in
            "+"|"-"|"*"|"/"|"%"|"^")
                ;;
            *)
                echo "Invalid operator!"
                continue
                ;;
        esac

        read -p "Enter next number: " num

        # Validate number
        if ! [[ "$num" =~ ^-?([0-9]+([.][0-9]*)?|[.][0-9]+)$ ]]
        then
            echo "Invalid number!"
            continue
        fi

        # Prevent division and modulus by zero
        if [[ "$operator" == "/" || "$operator" == "%" ]]
        then
            if [[ "$num" =~ ^-?0+([.]0*)?$ || "$num" =~ ^-?[.]0+$ ]]
            then
                echo "Error: Cannot divide by zero!"
                continue
            fi
        fi

        # Modulus requires integer operands
        if [[ "$operator" == "%" ]]
        then
            if [[ "$expression" =~ [.] || "$num" =~ [.] ]]
            then
                echo "Modulus supports integers only!"
                continue
            fi
        fi

        # Append operator and number
        expression="$expression $operator $num"

    done

    # Calculate complete expression
    result=$(echo "scale=10; $expression" | bc -l)

    echo ""
    echo "================================"
    echo "Expression: $expression"
    echo "Result: $result"
    echo "================================"

    read -p "Do you want another calculation? (y/n): " again

    if [[ "$again" != "y" && "$again" != "Y" ]]
    then
        echo "Calculator closed. Goodbye!"
        break
    fi

done


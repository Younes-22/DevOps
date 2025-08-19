#!/bin/bash

 validate_age(){
    local age=$1
    if [[ ! $age =~ ^[0-9]+$ ]]; then
        echo "Invalid age. Please enter a valid number."
        return 1
    fi
    if (( age < 18 )); then
        echo "Sorry, you must be at least 18 years old."
        return 1
    fi

    echo "You are eligible to vote."
    return 0
 }
echo "Enter your age:"
read user_age
validate_age "$user_age"
exit_code=$?
if (( exit_code != 0 )); then
    echo "Input validation failed"
fi

# greet(){
#     local name
#     if [ $# -eq 0 ]; then
#         echo "What is your name?"
#         read name
#     else
#         name="$1"
#     fi
#     echo "Hello, $name!"
# }
# greet "younes"

# greet_user(){
#     echo "What is your name?"
#     read name
#     echo "Hello, $name!"
# }

# greet_user


# print_args(){
#     echo "Number of arguements: $#"
#     echo "Script name: $0"
#     echo "First argument: $1"
#     echo "Second argument: $2"
#     echo "All arguments: $@"
# }

# print_args "Younes" "Tom"


# hello_world(){
#     echo "Hello, World!"
# }

# greet_person(){
#     local name="$1"
#     echo "Hello, $name!"
# }

# greet_person "Younes"
# greet_person "Tom"
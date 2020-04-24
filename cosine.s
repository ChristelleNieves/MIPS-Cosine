# Name: Christelle Nieves
# Assignment Name: Assignment 7 (MIPS Cosine)
# Program Description: Calculates the cosine of a floating point number (0.0 - 6.28318531 inclusive)
# Date: March 24, 2020

.data
    prompt: .asciiz "Please enter a floating point number: "
    invalidWarning: .asciiz "Invalid number, re-enter\n"
    cosineMssgPartOne: .asciiz "The cosine of: "
    cosineMssgPartTwo: .asciiz " is = "
    zeroFloat: .float 0.0
    upperBound: .float 6.28318531
    one: .float 1.0

.globl main
.text
main:

# Function name: cosine
# 1. Calls the getInput function to get a fp number from the user
# 2. Calculates the equation cos(x) = 1 - x^2/2! + x^4/4! - x^6/6! + x^8/8! ... up to x^12
# 3. Has a total of 6 intermediate operations that are performed back to back
# 4. The result of each intermediate operation is then added/subtracted from the cosine running sum
# 4. The running sum & resulting cosine value is stored in the $f8 register
cosine:
    # First Step: Get a float from the user & make sure its within bounds.
    jal getInput        # Call the getInput function to get the float from the user

    mov.s $f6, $f12     # Move the user input into $f6

    lwc1 $f8, one # Initialize $f8 to 1.0, this will hold the running sum of the cosine equation

    # Calculate intermediate result for x^2
    addi $sp, $sp, -4   # Get space from the stack
    li $a0, 1           # Load the number 1 to $a0 as a parameter to the function. (1 for x^2)
    jal raiseToPower    # Call the function
    addi $sp, $sp, 4    # Return space to the stack

    mov.s $f7. $f12     # Move the power result from the function into f7

    mov.s $f12, $f6     # Move the original user input back into f12

    addi $sp, $sp, -4   # Get space from the stack
    li $a0, 2           # Load 2 into a0, we will be finding the factorial of this integer
    jal factorial       # Calculate the factorial of 2
    addi $sp $sp, 4     # Return space to the stack

    div.s $f7, $f7, $f12    # f7 = x^2/2!

    mov.s $f12, $f6      # Move the original float back into f12

    sub.s $f8, $f8, $f7     # cosine = cosine - x^2/2!

    # Calculate intermediate result for x^4
    addi $sp, $sp, -4   # Get space from the stack
    li $a0, 3           # Load the number 3 to $a0 as a parameter to the function. (3 for x^4)
    jal raiseToPower    # Call the function
    addi $sp, $sp, 4    # Return space to the stack

    mov.s $f7. $f12     # Move the power result into f7

    mov.s $f12, $f6     # Move the original float into f12

    addi $sp, $sp, -4   # Get space from the stack
    li $a0, 4           # Load 4 as a parameter for the function
    jal factorial       # Find the factorial value of 4
    addi $sp $sp, 4     # Return space to the stack

    div.s $f7, $f7, $f12    # f7 = x^4/4!

    mov.s $f12, $f6      # Move the original float into f12

    add.s $f8, $f8, $f7     # cosine = cosine + x^4/4!

    # Calculate intermediate result for x^6
    addi $sp, $sp, -4   # Get space from the stack
    li $a0, 5           # Load the number 5 to $a0 as a parameter to the function. (5 for x^6)
    jal raiseToPower    # Call the function
    addi $sp, $sp, 4    # Return space to the stack

    mov.s $f7. $f12     # Move the power result into f7

    mov.s $f12, $f6     # Move the original float into f12

    addi $sp, $sp, -4   # Get space from the stack
    li $a0, 6           # Load 6 as the parameter to the factorial function
    jal factorial       # Calculate the factorial value of 6
    addi $sp $sp, 4     # Return space to the stack

    div.s $f7, $f7, $f12    # f7 = x^6/6!

    mov.s $f12, $f6      # Move the original float into f12

    sub.s $f8, $f8, $f7     # cosine = cosine - x^6/6!

    # Calculate intermediate result for x^8
    addi $sp, $sp, -4   # Get space from the stack
    li $a0, 7           # Load the number 7 to $a0 as a parameter to the function. (7 for x^8)
    jal raiseToPower    # Call the function
    addi $sp, $sp, 4    # Return space to the stack

    mov.s $f7. $f12     # Move the power result into f7

    mov.s $f12, $f6     # Move the original float into f12

    addi $sp, $sp, -4   # Get space from the stack
    li $a0, 8           # Load 8 as the parameter to the factorial function
    jal factorial       # Calculate the factorial value of 8
    addi $sp $sp, 4     # Return space to the stack

    div.s $f7, $f7, $f12    # f7 = x^8/8!

    mov.s $f12, $f6      # Move the original float into f12

    add.s $f8, $f8, $f7     # cosine = cosine + x^8/8!

    # Calculate intermediate result for x^10
    addi $sp, $sp, -4   # Get space from the stack
    li $a0, 9           # Load the number 9 to $a0 as a parameter to the function. (9 for x^10)
    jal raiseToPower    # Call the function
    addi $sp, $sp, 4    # Return space to the stack

    mov.s $f7. $f12     # Move the power result into f7

    mov.s $f12, $f6     # Move the original float into f12

    addi $sp, $sp, -4   # Get space from the stack
    li $a0, 10          # Load 10 as the parameter for the factorial function
    jal factorial       # Calculate the factorial value of 10
    addi $sp $sp, 4     # Return space to the stack

    div.s $f7, $f7, $f12    # f7 = x^10/10!

    mov.s $f12, $f6      # Move the original float into f12

    sub.s $f8, $f8, $f7     # cosine = cosine - x^10/10!

    # Calculate intermediate result for x^12
    addi $sp, $sp, -4   # Get space from the stack
    li $a0, 11           # Load the number 11 to $a0 as a parameter to the function. (11 for x^12)
    jal raiseToPower    # Call the function
    addi $sp, $sp, 4    # Return space to the stack

    mov.s $f7. $f12     # Move the power result into f7

    mov.s $f12, $f6     # Move the original float into f12

    addi $sp, $sp, -4   # Get space from the stack
    li $a0, 12          # Load 12 as the parameter for the factorial function
    jal factorial       # Calculate the factorial value of 12
    addi $sp $sp, 4     # Return space to the stack

    div.s $f7, $f7, $f12    # f7 = x^12/12!

    mov.s $f12, $f6      # Move the original float into f12

    add.s $f8, $f8, $f7     # cosine = cosine + x^12/12!

printCosine:
    li $v0, 4                   # Prepare to print a string
    la $a0, cosineMssgPartOne   # Print "The cosine of: "                  
    syscall

    li $v0, 2                   # Prepare to print a float
    mov.s $f12, $f6             # Print the float
    syscall

    li $v0, 4                   # Prepare to print a string
    la $a0, cosineMssgPartTwo   # Print " is = "
    syscall

    li $v0, 2           # Prepare to print a float
    mov.s $f12, $f8     # Move the result into f12 for printing
    syscall             # Print the resulting cosine value

    j exit              # Exit the program

# Function name: getInput
# 1. Ask user to input a floating point number
# 2. Checks if the input is negative
# 3. Checks if the input is greater than 6.28318531
#  -- jumps to invalidInput function if number is invalid, then jumps back to getInput
# 4. Returns the fp number via the $f12 fp register
getInput:
    lwc1 $f4, zeroFloat     # Store 0.0 in $f4
    lwc1 $f5, upperBound    # Store 6.28318531 in $f5

    li $v0, 4           # Prepare to print the prompt message
    la $a0, prompt      # Print the prompt message to get input from the user.
    syscall

    li $v0, 6           # Prepare to read a float
    syscall             # Get the float from the user, will be stored in $f0

    c.lt.s $f0, $f4     # Check if the input is < 0... aka: check if $f0 < $f4
    bc1t invalidInput   # If the input is < 0, branch to the invalidInput function

    c.lt.s $f5, $f0     # Check if the input is greater than the upper bound.
    bc1t invalidInput   # If the input is greater than the upper bound, branch to the invalidInput function

    mov.s $f12, $f0     # Move the return value into $f12

    j $ra               # Return from the getInput function 
invalidInput:
    li $v0, 4           # Prepare to print the invalid warning message
    la $a0, invalidWarning  # Print the invalid warning message
    syscall

    j getInput          # Jump back to the getInput function to get another float from the user

# Function name: raiseToPower
# 1. Takes in a fp number in $f12 and an integer in $a0
# 2. Raises the floating point to the power of the integer
# 3. Returns the resulting float via the $f12 fp register
raiseToPower:
    mov.s $f1, $f12     # Move the float to $f1
    move $t0, $a0       # Move the exponent to $t0
    mov.s $f2, $f12     # Also move the float into $f12, we will use this to store the result
powerLoop:
    ble $t0, 0, endPowerLoop    # Branch if the exponent counter is <= 0
    mul.s $f2, $f2, $f1         # Multiply the float by itself and store it in $f2
    addi $t0, -1                # Decrement the exponent counter

    mov.s $f12, $f2             # Move the result into $f12

    j powerLoop                 # Jump back to the beginning of the powerLoop function
endPowerLoop:
    j $ra               # Return from the raiseToPower function

# Function name: factorial
# Takes in an integer in $a0
# Returns the factorial of that integer as a float in $f12
factorial:
    move $t0, $a0       # Move the integer to $t0
    li $t1, 0           # $t1 will hold the result
    move $t2, $a0       # $t2 will hold the counter (the number to multiply by)
factorialLoop:
    ble $t2, 1, endFactorial
    addi $t2, -1        # We will start at x-1
    mul $t0, $t0, $t2   # $t0 = x * (x-1)

    mtc1 $t0, $f3       # Move the result into fp register $f3
    cvt.s.w $f3, $f3    # Convert $f3 from an integer to a floating point number

    mov.s $f12, $f3     # Return the factorial result in $f12

    j factorialLoop     # Jump back to the beginning of the factorial loop
endFactorial:
    j $ra               # Return from the factorial function

# Exit the program
exit:
    li $v0, 10          # Tell the system to stop the program
    syscall
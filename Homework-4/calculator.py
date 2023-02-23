# Write a Calculator program with the following functionality:
# - The user chooses the operation 
# - add, subtract, multiply, divide   = check whether the choice is valid   = every operation should be a separate function 
# - The user enters the numbers for the operation   = check for valid inputs 
# - only numbers allowed 
# - The user is presented with the result from the operation or an error message   = division by zero error handling   = try different formatting for the floating point numbers (1,2,3,4 numbers after the decimal) 
# - The user can choose whether to proceed with a new calculation or exit the program 
# Example: Select operation. 
# 1.Add 
# 2.Subtract 
# 3.Multiply 
# 4.Divide 
# Enter choice: (1/2/3/4): 3 
# Enter first number: 15 
# Enter second number: 14 15.0 * 14.0 = 210.0
#  Would you like to do a new calculation? 
#  (yes/no): no 

from ascii import *
import os

operators = ['+', '-', '/', '*', '%', 'M']

#Sanitize input

def check_input(x):
  if "." in x :
    return float(x)
  else:
    return int(x)

def check_operator(x): 
  if x not in operators:
     print("Please select PROPER operation")
  else: return x

def input_variables():
  print("Please input value for A")
  a = check_input(input())
  print("Please input value for B")
  b = check_input(input())
  return a,b

def add():
  a,b = input_variables()
  return a+b

def sub():
  a,b = input_variables()
  return a-b

def div():
  a,b = input_variables()
  return a/b

def mult():
  a,b = input_variables()
  return a*b

def mod():
  a,b = input_variables()
  return a%b

print("Please select operation")
while True:
  operator = check_operator(input())
  print(operator)
  if operator in operators:
    break







#print(type(x))

#switch={
#
#}

#
#def sub(a):
#  return a-b
#
#def multi():
#  return a*b
#
#def div():
#  return a/b
#  
#def mod():
#  return a%b
##def read_history():
##
##def clear_history():
##  
#Use at your OWN risk

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
operators = ['+', '-', '/', '*', '%', 'H', 'p', 'q']
choice = None
precision = 3
choices = ['no','n']


#Sanitize input

def check_input(x):
  try:
    if "." in x :
      return float(x)
    else:
      return int(x)
  except:
    print("Invalid number")    #Better error handling

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
  try:
    return a/b
  except ZeroDivisionError:
    return f"!{a}/0!"

def mult():
  a,b = input_variables()
  return a*b

def mod():
  a,b = input_variables()
  return a%b

def change_precision():
    global precision
    precision = check_input(input())
   


def history():
  history = open("history.txt", "w")


def operation_select(x):
  match x:
    case 'p':
      print("Enter new floating point precission")
      change_precision()
    case '+':
      print("addition selected")
      return add()
    case '-':
      print("substraction selected")
      return sub()
    case '/':
      print("division selected")
      return div()
    case '*':
      print("multiplication selected")
      return mult()
    case '%':
      print("modulus selected")
      return mod()
    case 'H':
      print("Please subscribe to this feature for $3.99 / month")
      return
    case 'q':
        quit()
    



while choice not in choices:
  
  print(calc_1)
  print("Please select operation: ")
  print(f"""
  + for Addition
  - for Substraction
  * for Multiplication
  / for Division
  % for Modulo 
  H for Check history 
  p for Changing pricision, current precision is {precision}
  q for Quit""")
  

  while True:
    operator = check_operator(input()) 
    if operator in operators:
      os.system('clear')
      break

  result = operation_select(operator)
  if result is not None:
    if isinstance(result, float):
      os.system('clear')
      print(f'{calc_2}| |    {result:>20.{precision}f}| |{calc_3}')
    else: print(f'{calc_2}| |    {result:>20}| |{calc_3}') 
  print("Would you like to do a new calculation? [yes/no] ")
  choice = input()

  

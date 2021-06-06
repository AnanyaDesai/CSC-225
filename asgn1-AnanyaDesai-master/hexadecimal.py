# Implements operations on hexadecimal numbers.
# CSC 225, Assignment 1
# Given code, Winter '20
import math

def binary_to_hex(number):
    """
    Convert a 16-bit binary number to hexadecimal.
    TODO: Implement this function.

    :param number: A bitstring representing the number to convert
    :return: A hexadecimal string, the converted number
    """
    """
    lst =[]
    output = ""
    for i in range(0, 16, 4):
        lst.append(number[i:i+4])
        print(lst)
    for char in lst:
        if binary_to_hex_helper(char)<=9:
            output+=str(binary_to_hex_helper(char))
        elif binary_to_hex_helper(char)==10:
            output+='A'
        elif binary_to_hex_helper(char)==11:
            output+='B'
        elif binary_to_hex_helper(char)==12:
            output+='C'
        elif binary_to_hex_helper(char)==13:
            output+='D'
        elif binary_to_hex_helper(char)==14:
            output+='E'
        elif binary_to_hex_helper(char)==15:
            output+='F'
    fin_output=output[::-1]+'x0'
    return fin_output[::-1]
    """
    hex_valid = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]
    output = ""
    for i in range(4):
        index = 0
        for j in range(4):
            if number[15 - ((4 * i) + j)] == '1':
                index = index + (2 ** j)
        output = hex_valid[index] + output
    return '0x' + output

def hex_to_binary(number):
    """
    Convert a hexadecimal number to 16-bit binary.
    TODO: Implement this function.

    :param number: A hexadecimal string, the number to convert
    :return: A bitstring representing the converted number
    """
    hex_valid = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]
    output = ""
    for i in range(4):
        num = hex_valid.index(number[2 + i])
        for j in range(4):
            if num >= (2 ** (3 - j)):
                output += "1"
                num = num - (2 ** (3 - j))
            else:
                output += "0"
    return output







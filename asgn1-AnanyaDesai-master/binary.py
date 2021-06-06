# Implements operations on binary numbers.
# CSC 225, Assignment 1
# Given code, Winter '20


def add(addend_a, addend_b):
    """
    Add two 8-bit, two's complement binary numbers; ignore carries/overflows.
    TODO: Implement this function. Do *not* convert the numbers to decimal.

    :param addend_a: A bitstring representing the first number
    :param addend_b: A bitstring representing the second number
    :return: A bitstring representing the sum
    """
    carry = '0'
    output = ''
    """
    if len(addend_a) > len(addend_b):
        maximum = addend_a
        minimum = addend_b
    elif len(addend_b) > len(addend_a):
        maximum = addend_b
        minimum = addend_a
    else:
        minimum = addend_a
    """
    for i in range(len(addend_a), 0, -1):

        if addend_a[i - 1] == '0' and addend_b[i - 1] == '0':
            if carry == '0':
                output += '0'
            elif carry == '1':
                output += '1'
            carry = '0'
        if (addend_a[i - 1] == '0' and addend_b[i - 1] == '1') or (addend_a[i - 1] == '1' and addend_b[i - 1] == '0'):
            if carry == '0':
                output += '1'
                carry = '0'
            elif carry == '1':
                output += '0'
                carry = '1'
        if addend_a[i - 1] == '1' and addend_b[i - 1] == '1':
            if carry == '0':
                output += '0'
                carry = '1'
            elif carry == '1':
                output += '1'
                carry = '1'
    """
    if carry == '1':
        output += carry
    """
    return (output[::-1])


def negate(number):
    """
    Negate an 8-bit, two's complement binary number.
    TODO: Implement this function. Do *not* convert the number to decimal.

    :param number: A bitstring representing the number to negate
    :return: A bistring representing the negated number
    """
    twoscomp=""
    """
    n=0
    for char in number[::-1]:
        if char !='1':
            twoscomp+=char
            n+=1
        else:
            break
    twoscomp+=number[n]
    for i in range(n+1, len(number)):
        if number[i]=='0':
            twoscomp+='1'
        elif number[i]=='1':
            twoscomp+='0'
    return twoscomp
    """
    for char in number:
        if char=='0':
            twoscomp+='1'
        elif char=='1':
            twoscomp+='0'
    return add(twoscomp, '00000001')


def subtract(minuend, subtrahend):
    """
    Subtract one 8-bit, two's complement binary number from another.
    TODO: Implement this function. Do *not* convert the numbers to decimal.

    :param minuend: A bitstring representing the number from which to subtract
    :param subtrahend: A bitstring representing the number to subtract
    :return: A bitstring representing the difference
    """
    new_subtrahend=negate(subtrahend)
    return add(minuend, new_subtrahend)


def binary_to_decimal(number):
    """
    Convert an 8-bit, two's complement binary number to decimal.
    TODO: Implement this function.

    :param number: A bitstring representing the number to convert
    :return: An integer, the converted number
    """

    output = 0
    for i in range(0, len(number)-1):
        if number[::-1][i]=='1':
            output+=2**i
    return output

    """
    output = 0
    n = 0
    for char in number[::-1]:
        if char==1:
            output+=2**int(numbebr[n])
        n+=1
    return output
    """


def decimal_to_binary(number):
    """
    Convert a decimal number to 8-bit, two's complement binary.
    TODO: Implement this function.

    :param number: An integer, the number to convert
    :return: A bitstring representing the converted number
    :raise OverflowError: If the number cannot be represented with 8 bits
    """
    """
    if number == 0:
        return '00000000'
    output = number % 2 + 10 *decimal_to_binary(number // 2)
    new = str(output)
    if len(str(output)) > 8:
        raise OverflowError
    new1 = new[::-1]
    new1 = new1+((8-len(str(output)))*'0')
    return new1[::-1]
    """
    """
    output = ""
    i = 0
    if number == 0:
        return '0000'
    while number > 0:
        output += str(number % 2)
        number = number // 2
        i += 1
    fin_output = ((8 - i) * '0') + output[::-1]
    return fin_output
    """
    if number < -(2 ** 7) or number > (2 ** 7) - 1:
        raise OverflowError
    output = ""
    if number>=0:
        output += '0'
        for i in range(7):
            if number >= 2 ** (6 - i):
                output += '1'
                number = number - (2 ** (6 - i))
            else:
                output += '0'
    return output


/*
 * Recursively computes greatest common divisors.
 * CSC 225, Assignment 6
 * Given code, Spring '21
 * TODO: Complete this file.
 */
 
 #include <stdio.h>
 #include "gcd.h"

 int main(void) {
     int x, y;
     printf("Enter two positive integers: ");
     scanf("%d %d", &x, &y);
     printf("gcd(%d, %d) = %d\n", x, y, gcd(x, y));
     return 0;
 }

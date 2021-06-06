/*
 * Defines functions for computing greatest common divisors.
 * CSC 225, Assignment 6
 * Given code, Spring '21
 * NOTE: Do not alter this file.
 */

/* gcd: Computes the greatest common divisor of positive a and b. */
int gcd(int a, int b) {
    int tmp;

    if (a == b) {
        tmp = a;
    }
    else if (a < b) {
        tmp = gcd(a, b - a);
    }
    else {
        tmp = gcd(a - b, b);
    }

    return tmp;
}

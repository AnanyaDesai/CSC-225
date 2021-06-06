/*
 * Defines functions for manipulating square integer matrices.
 * CSC 225, Assignment 7
 * Given code, Fall '20
 */

#include "matrix.h"

/* matscl: Multiplies each element of a matrix by a scalar. */
void matscl(int *mat, unsigned int n, int c) {
    /* TODO: Complete this function, given:
     *  mat - A pointer to the first element in a multidimensional array
     *  n   - The height and width of the matrix
     *  c   - The constant scalar
     * ...multiply each element in "mat" by "c". */
    
    int row, column;
    
    for (row = 0; row<n; row++) {
        for (column = 0; column<n; column++) {
            mat[row*n + column] = (mat[row*n + column]) * c;
        }
    }
}

/* matpscl: Multiplies each element of a matrix by a scalar. */
void matpscl(int **mat, unsigned int n, int c) {
    /* TODO: Complete this function, given:
     *  mat - An array of pointers to arrays of integers
     *  n   - The height and width of the matrix
     *  c   - The constant scalar
     * ...multiply each element in "mat" by "c". */
    
    int row, column;
    
    for (row = 0; row<n; row++) {
        for (column = 0; column<n; column++) {
            mat[row][column] = (mat[row][column]) * c;
        }
    }
}

/* mattrn: Transposes a matrix about its diagonal, in-place. */
void mattrn(int *mat, unsigned int n) {
    /* TODO: Complete this function, given:
     *  mat - A pointer to the first element in a multidimensional array
     *  n   - The height and width of the matrix
     * ...transpose "mat" about its diagonal. */
    
    int row, column;
    
    for (row = 0; row<n; row++) {
        for (column = 0; column<row; column++) {
            int x = mat[row*n + column];
            mat[row*n + column] = mat[column*n + row];
            mat[column*n + row] = x;
        }
    }
}

/* matptrn: Transposes a matrix about its diagonal, in-place. */
void matptrn(int **mat, unsigned int n) {
    /* TODO: Complete this function, given:
     *  mat - An array of pointers to arrays of integers
     *  n   - The height and width of the matrix
     * ...transpose "mat" about its diagonal. */
    
    int row, column;
    
    for (row = 0; row<n; row++) {
        for (column = 0; column<row; column++) {
            int x = mat[row][column];
            mat[row][column] = mat[column][row];
            mat[column][row] = x;
        }
    }
}

/* matadd: Adds two matrices, placing their sum into a third. */
void matadd(int *mata, int *matb, int *matc, unsigned int n) {
    /* TODO: Complete this function, given:
     *  mata - A pointer to the first element in a multidimensional array
     *  matb - A pointer to the first element in a multidimensional array
     *  matc - A pointer to the first element in a multidimensional array
     *  n    - The height and width of the matrices
     * ...compute "matc = mata + matb". */
    
    int i, j;
    
    for (i = 0; i<n; i++) {
        for (j = 0; j<n; j++) {
            matc[i*n + j] = mata[i*n + j] + matb[i*n + j];
        }
    }
}

/* matpadd: Adds two matrices, placing their sum into a third. */
void matpadd(int **mata, int **matb, int **matc, unsigned int n) {
    /* TODO: Complete this function, given:
     *  mata - An array of pointers to arrays of integers
     *  matb - An array of pointers to arrays of integers
     *  matc - An array of pointers to arrays of integers
     *  n    - The height and width of the matrices
     * ...compute "matc = mata + matb". */
    
    int i, j;
    
    for (i = 0; i<n; i++) {
        for (j = 0; j<n; j++) {
            matc[i][j] = mata[i][j] + matb[i][j];
        }
    }
}

/* matmul: Multiplies two matrices, placing their product into a third. */
void matmul(int *mata, int *matb, int *matc, unsigned int n) {
    /* TODO: Complete this function, given:
     *  mata - A pointer to the first element in a multidimensional array
     *  matb - A pointer to the first element in a multidimensional array
     *  matc - A pointer to the first element in a multidimensional array
     *  n    - The height and width of the matrices
     * ...compute "matc = mata * matb". */
    
    int i, j, k;
    
    for (i = 0; i<n; i++) {
        for (j = 0; j<n; j++) {
            matc[i*n + j] = 0;
            for (k = 0; k<n; k++) {
                matc[i*n + j] += mata[i*n + k] * matb[k*n + j];
            }
        }
    }
}

/* matpmul: Multiplies two matrices, placing their product into a third. */
void matpmul(int **mata, int **matb, int **matc, unsigned int n) {
    /* TODO: Complete this function, given:
     *  mata - An array of pointers to arrays of integers
     *  matb - An array of pointers to arrays of integers
     *  matc - An array of pointers to arrays of integers
     *  n    - The height and width of the matrices
     * ...compute "matc = mata * matb". */
    
    int i, j, k;
    
    for (i = 0; i<n; i++) {
        for (j = 0; j<n; j++) {
            matc[i][j] = 0;
            for (k = 0; k<n; k++) {
                matc[i][j] += mata[i][k] * matb[k][j];
            }
        }
    }
}

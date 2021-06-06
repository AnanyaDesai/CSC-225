; Defines functions for computing greatest common divisors.
; CSC 225, Assignment 6
; Given code, Spring '21
; TODO: Complete this file.

            .ORIG x4000

; int gcd(int, int)
; int gcd(int, int)
GCDFN   ;callee setup
        ADD R6, R6, #-1
        ADD R6, R6, #-1
        STR R7, R6, #0
        ADD R6, R6, #-1
        STR R5, R6, #0
        ADD R5, R6, #-1
        ADD R6, R5, #0
        
        LDR R0, R5, #4
        LDR R1, R5, #5
        NOT R2, R1
        ADD R2, R2, #1
        ADD R3, R0, R2      ; a-b
        BRnp EQUAL
        STR R0, R5, #0
        BRnzp FIN
        
EQUAL   BRzp NEG
        NOT R3, R3          ; b-a
        ADD R3, R3, #1
        ADD R6, R6, #-1
        STR R3, R6, #0
        ADD R6, R6, #-1
        STR R0, R6, #0
        JSR GCDFN
        LDR R1, R6, #0
        ADD R6, R6, #1
        ADD R6, R6, #1
        ADD R6, R6, #1
        STR R1, R5, #0
        BRnzp FIN
        
NEG     BRnz LABEL
        ADD R6, R6, #-1
        STR R1, R6, #0
        ADD R6, R6, #-1
        STR R3, R6, #0
        JSR GCDFN
        LDR R1, R6, #0
        ADD R6, R6, #1
        ADD R6, R6, #1
        ADD R6, R6, #1
        STR R1, R5, #0
        
LABEL

FIN     LDR R0, R5, #0
        STR R0, R5, #3
        ADD R6, R6, #1
        LDR R5, R6, #0
        ADD R6, R6, #1
        LDR R7, R6, #0
        ADD R6, R6, #1
        RET

       
        .END
; Recursively computes greatest common divisors.
; CSC 225, Assignment 6
; Given code, Spring '21
; NOTE: Do not alter this file.

        .ORIG x3000

; int main(void)
MAINFN  LD  R6, INITSP  ; Init. the stack pointer.
        ADD R5, R6, #-1 ; Init. the frame pointer.
        ADD R6, R6, #-2 ; Push space for "a" and "b".

        LD  R1, INTNEG  ; Print the prompt.
        LEA R0, PROMPT
        PUTS

        GETC            ; Read an integer.
        OUT
        ADD R0, R0, R1
        STR R0, R5, #0  ; Assign the integer to "a".
        GETC            ; Consume the space.
        OUT

        GETC            ; Read an integer.
        OUT
        ADD R0, R0, R1
        STR R0, R5, #-1 ; Assign the integer to "b".
        GETC            ; Consume the newline.
        OUT

        LDR R0, R5, #-1 ; Push "b".
        ADD R6, R6, #-1
        STR R0, R6, #0
        LDR R0, R5, #0  ; Push "a".
        ADD R6, R6, #-1
        STR R0, R6, #0
        LD  R7, GCDFN
        JSRR R7         ; Call "gcd(a, b)".
        LDR R1, R6, #0  ; Pop the return value.
        ADD R6, R6, #1
        ADD R6, R6, #1  ; Pop "a".
        ADD R6, R6, #1  ; Pop "b".

        LD  R2, INTPOS  ; Print the result.
        LEA R0, RES1
        PUTS
        LDR R0, R5, #0
        ADD R0, R0, R2
        OUT

        LEA R0, RES2
        PUTS
        LDR R0, R5, #-1
        ADD R0, R0, R2
        OUT

        LEA R0, RES3
        PUTS
        ADD R0, R1, R2
        OUT
        LD  R0, NEWLINE
        OUT

        ADD R6, R6, #2  ; Pop "b" and "a".
        HALT

INITSP  .FILL xFE00
PROMPT  .STRINGZ "Enter two positive integers: "
RES1    .STRINGZ "gcd("
RES2    .STRINGZ ", "
RES3    .STRINGZ ") = "
INTPOS  .FILL x30
INTNEG  .FILL x-30
NEWLINE .FILL x0A
GCDFN   .FILL x4000

        .END

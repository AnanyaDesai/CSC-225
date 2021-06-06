; Implements integer I/O utilities.
; CSC 225, Assignment 4
; Given code, Winter '20

        .ORIG x5000     ; NOTE: Do not alter these addresses. They are
        .FILL GETI      ;       hardcoded within "calculator.asm", since the
        .FILL OUTI      ;       assembler cannot resolve cross-file labels.

; Reads one integer in the range {-9, ..., 9}.
;  Takes no arguments.
;  Returns the read integer in R0.
;  TODO: Implement this subroutine.
GETI    GETC
        ST R1, SAVER1
        LD R1, HCHECK
        ADD R0, R0, R1
        BRnp POS
        GETC
        LD R1, CONV
        ADD R0, R0, R1
        NOT R0, R0
        ADD R0, R0, #1
        BRnzp NEG
POS     ADD R0, R0, #-3
NEG     LD R1, SAVER1
        RET

; Prints one integer in the range {-9, ..., 9}.
;  Takes the integer in R0.
;  Returns no values.
;  TODO: Implement this subroutine.
OUTI    ADD R0, R0, #0
        ST R0, VALUE
        ST R2, SAVER2
        BRzp POS2
        ST R1, SAVER1
        NOT R1, R0
        ADD R1, R1, #1
        AND R0, R0, #0
        LD R2, HYPH
        ADD R0, R0, R2
        OUT
        AND R0, R0, #0
        ADD R0, R1, #0
        LD R1, SAVER1
POS2    LD R2, CONV2
        ADD R0, R0, R2
        OUT
        LD R2, SAVER2
        LD, R0, VALUE
        RET
SAVER1  .FILL x00
SAVER2  .FILL x00
HYPH    .FILL x2D
HCHECK  .FILL x-2D
CONV    .FILL x-30
CONV2   .FILL x30
VALUE   .FILL x00

        .END
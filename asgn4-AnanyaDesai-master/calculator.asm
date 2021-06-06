; Performs stack-based arithmetic.
; CSC 225, Assignment 4
; Given code, Winter '20

        .ORIG x3000

MAIN    LEA R1, STACK   ; Initialize R1, the stack pointer.

LOOP    LEA R0, PROMPT  ; Print the prompt.
        PUTS
        GETC            ; Read the command into R0.
        OUT

        ; If the command is an 'a'...
IFP     LD  R3, ASCIIA
        ADD R3, R0, R3
        BRnp ELIFM
        ; TODO: Complete this case.
        ST R2, SAVER2
        ST R7, SAVER7
        ST R4, SAVER4
        JSR POP
        ADD R4, R2, #0
        JSR POP
        ADD R2, R2, R4
        JSR PUSH
        LD R2, SAVER2
        LD R7, SAVER7
        LD R4, SAVER4
        BRnzp ENDIF

        ; Else if the command is an 's'...
ELIFM   LD  R3, ASCIIS
        ADD R3, R0, R3
        BRnp ELIFN
        ; TODO: Complete this case.
        ST R2, SAVER2
        ST R7, SAVER7
        ST R4, SAVER4
        JSR POP
        NOT R4, R2
        ADD R4, R4, #1
        JSR POP
        ADD R2, R2, R4
        JSR PUSH
        LD R2, SAVER2
        LD R7, SAVER7
        LD R4, SAVER4
        BRnzp ENDIF

        ; Else if the command is an 'n'...
ELIFN   LD  R3, ASCIIN
        ADD R3, R0, R3
        BRnp ELIFQ
        ; TODO: Complete this case.
        ST R2, SAVER2
        ST R7, SAVER7
        JSR POP
        NOT R2, R2
        ADD R2, R2, #1
        JSR PUSH
        LD R2, SAVER2
        LD R7, SAVER7
        BRnzp ENDIF

        ; Else if the command is a 'q'...
ELIFQ   LD  R3, ASCIIQ
        ADD R3, R0, R3
        BRnp ELSE
        ; TODO: Complete this case.
        GETC
        OUT
        BRnzp DONE
        ;BRnzp ENDIF

        ; Else, assume the command is '#'...
ELSE    ; TODO: Complete this case.
        ST R2, SAVER2
        ST R7, SAVER7
        JSR GETI
        JSR OUTI
        AND R2, R2, #0
        ADD R2, R2, R0
        JSR PUSH
        LD R2, SAVER2
        LD R7, SAVER7
        BRnzp ENDIF
        
SAVER2  .FILL x00
SAVER4  .FILL x00
SAVER7  .FILL x00

ENDIF   GETC            ; Consume the newline.
        OUT
        BRnzp LOOP      ; Loop back.

DONE    LEA R0, RESSTR  ; Pop and print an integer.
        PUTS
        JSR POP
        ADD R0, R2, #0
        JSR OUTI
        LEA R0, ENDSTR
        PUTS
        HALT            ; Halt.


; Space for a stack with capacity 16:
        .BLKW #16
STACK   .FILL x00

; Shared constants:
PROMPT  .STRINGZ "Enter a command (#N/a/s/n/q): "
RESSTR  .STRINGZ "Value on top of the stack: "
ENDSTR  .STRINGZ "\n"
ASCIIA  .FILL x-61
ASCIIS  .FILL x-73
ASCIIN  .FILL x-6E
ASCIIQ  .FILL x-71

; NOTE: Do not alter the following lines. They allow the subroutines in other
;       files to be called without manually calculating their offsets.

PUSH    ST  R7, PSHR7
        LDI R7, PSHADDR
        JSRR R7
        LD  R7, PSHR7
        RET
PSHR7   .FILL x0000
PSHADDR .FILL x4000

POP     ST  R7, POPR7
        LDI R7, POPADDR
        JSRR R7
        LD  R7, POPR7
        RET
POPR7   .FILL x0000
POPADDR .FILL x4001

GETI    ST  R7, GETR7
        LDI R7, GETADDR
        JSRR R7
        LD  R7, GETR7
        RET
GETR7   .FILL x0000
GETADDR .FILL x5000

OUTI    ST  R7, OUTR7
        LDI R7, OUTADDR
        JSRR R7
        LD  R7, OUTR7
        RET
OUTR7   .FILL x0000
OUTADDR .FILL x5001

        .END

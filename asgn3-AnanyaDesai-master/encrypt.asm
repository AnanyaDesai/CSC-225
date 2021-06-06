; Encrypts a string using a Caesar cipher.
; CSC 225, Assignment 3
; Given code, Winter '20

; TODO: Complete this program.

        .ORIG x3000
       
        LEA R0, inp1                ; Loading user input prompt into R0
        PUTS                        ; Prompting for user input //key
        GETC                        ; Reading user input key
        OUT                         ; Printing user input key
        ADD R2, R0, #0              ; Copying user input key to R2
        LD R1, MINUS                ; Loading -48 into R1
        ADD R2, R2, R1              ; Converting ASCII to decimal and storing in R2
        ADD R1, R0, #-10            ; Decrementing by \n
        
        BRz INPLOOP1                 
        GETC                       
        OUT                         

INPLOOP1    LEA R0, inp2            ; Prompting for user input //unencrypted input string
            PUTS                    ; Printing user input unencrypted string
            LEA R5, ARRAY           ; Saving address of input into R5
            
CALC1   GETC                        ; Reading user input unencrypted string
        OUT                         
        ADD R1, R0, #-10            ; Converting ASCII 
        BRz INPLOOP2
        STR R0, R5, #0              ;Storing in R5
        ADD R5, R5, #1              ; Incrementing Array index
        BRnzp CALC1
        
INPLOOP2    LEA R0, output          ;Loading output prompt message
            PUTS                    ;Printing output prompt message
            LEA R1, ARRAY           ;Loaing value on array
            LDR R0, R1, #0          ; Copying value from R1 to R0
            
CALC2   BRz DONE
        ADD R0, R0, R2          
        ADD R5, R0, #-16
        ADD R5, R5, #-16
        ADD R5, R5, #-16
        ADD R5, R5, #-16
        ADD R5, R5, #-16
        ADD R5, R5, #-16
        ADD R5, R5, #-16
        ADD R5, R5, #-14
        BRnz CALC3
        AND R5, R5, #0
        ADD R0, R5, #15
        ADD R0, R0, #15
        ADD R0, R0, #15
        ADD R0, R0, #15
        ADD R0, R0, #3
CALC3   OUT                    
        ADD R1, R1, #1
        LDR R0, R1, #0
        BRnzp CALC2
        
        
        

        AND R0, R0, #0
        AND R1, R1, #0
        AND R2, R2, #0
        AND R3, R3, #0
        AND R4, R4, #0
        AND R6, R6, #0
        AND R7, R7, #0
        AND R5, R5, #0
        LD R5, ZERO
        AND R1, R1, R5
DONE    HALT


inp1     .STRINGZ "Encryption key (0-9): "
inp2    .STRINGZ "Unencrypted string: "
output    .STRINGZ "Encrypted string: "
MINUS       .FILL xFFD0  ; #-48
ZERO        .FILL x0
ARRAY      .BLKW #33
ARRAYN      .BLKW #33
        .END
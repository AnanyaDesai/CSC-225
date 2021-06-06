; Supports interrupt-driven keyboard input.
; CSC 225, Assignment 5
; Given code, Winter '20

        .ORIG x1000      ;x1000 og code

; Reads one character, executing a second program while waiting for input:
;  1. Saves the keyboard entry from the IVT.
;  2. Sets the keyboard entry in the IVT to ISR180.
;  3. Enables keyboard interrupts.
;  4. Returns to the second program.
; NOTE: The first program's state must be swapped with the second's.
TRAP26          ST R1, P1R1              ;TODO: Implement this service routine.
                ST R2, P1R2
                ST R3, P1R3
                ST R4, P1R4
                ST R5, P1R5
                ST R7, P1R7
                LDR R1, R6, #0
                ST R1, P1PC
                LDR R1, R6, #1
                ST R1, P1PSR

                LDI R1, KBIV        ;Loads keyboard entry in IVT
                ST R1, SAVEIV       ;Saves keyboard entry
                LEA R1, ISR180       ;Loads ISR180 address
                STI R1, KBIV        ;Sets keyboard entry in IVT to ISR180
                LDI R1, KBSR        ;Loads KBSR
                LD R2, KBIMASK      ;Loads KBIMASK
                AND R3, R1, R2      ;Checks to see if interrupt enabled
                BRp SKIP           ;if it is, you're good
                ADD R1, R1, R2      ;if not, add KBIMASK to KBSR (which enables interrupt)
        SKIP    STI R1, KBSR

                LD R1, P2PC
                STR R1, R6, #0
                LD R1, P2PSR
                STR R1, R6, #1
                LD R0, P2R0
                LD R1, P2R1
                LD R2, P2R2
                LD R3, P2R3
                LD R4, P2R4
                LD R5, P2R5
                LD R7, P2R7
                RTI
                  


; Responds to a keyboard interrupt:
;  1. Disables keyboard interrupts.
;  2. Restores the original keyboard entry in the IVT.
;  3. Reads the typed character into R0.
;  4. Returns to the caller of TRAP26.
; NOTE: The second program's state must be swapped with the first's.
      
ISR180          ST R0, P2R0        ; TODO: Implement this service routine.
                ST R1, P2R1
                ST R2, P2R2
                ST R3, P2R3
                ST R4, P2R4
                ST R5, P2R5
                ST R7, P2R7
                LDR R1, R6, #0
                ST R1, P2PC
                LDR R1, R6, #1
                ST R1, P2PSR

                LDI R0, KBDR        ;read typed char into R0 (ASCII code stored in R0)

                AND R1, R1, #0      ;disables interrupt
                STI R1, KBSR

                LD R1, SAVEIV        ;Restores keyboard entry in IVT
                STI R1, KBIV

                LD R1, P1PC
                STR R1, R6, #0
                LD R1, P1PSR
                STR R1, R6, #1
                LD R1, P1R1
                LD R2, P1R2
                LD R3, P1R3
                LD R4, P1R4
                LD R5, P1R5
                LD R7, P1R7
                RTI                 



; Program 1's data:
P1R1    .FILL x0000     ; TODO: Use these memory locations to save and restore
P1R2    .FILL x0000     ;       the first program's state.
P1R3    .FILL x0000
P1R4    .FILL x0000
P1R5    .FILL x0000
P1R7    .FILL x0000
P1PC    .FILL x0000
P1PSR   .FILL x0000

; Program 2's data:
P2R0    .FILL x0000     ; TODO: Use these memory locations to save and restore
P2R1    .FILL x0000     ;       the second program's state.
P2R2    .FILL x0000
P2R3    .FILL x0000
P2R4    .FILL x0000
P2R5    .FILL x0000
P2R7    .FILL x0000
P2PC    .FILL x4000     ; Initially, Program 2's PC is 0x4000.
P2PSR   .FILL x8002     ; Initially, Program 2 is unprivileged.

; Shared data:
SAVEIV  .FILL x0000     ; TODO: Use this memory location to save and restore
                        ;       the keyboard's IVT entry.

; Shared constants:
KBIV    .FILL x0180     ; The keyboard's interrupt vector
KBSR    .FILL xFE00     ; The Keyboard Status Register
KBDR    .FILL xFE02     ; The Keyboard Data Register
KBIMASK .FILL x4000     ; The keyboard interrupt bit's mask
PCSTACK .FILL x2FFE
KBDRMASK .FILL x00FF

        .END

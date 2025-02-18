0x15EBA2:
    JMP 0x3D2E75 ; Jump to the Deathlink Function.

0x3D2E75:
    CALL 0x405180 ; Call the function that returns Sora's Pointer. Stored at RAX.
    MOV RCX, RAX ; Move RAX to RCX.
    JMP 0x3D2E93 ; Branch-off to the next empty space.

0x3D2E93:
    MOV R8, RDX ; Move RDX [which should be 0x00] to R8.
    MOV R9, RDX ; Move RDX [which should be 0x00] to R9.
    JMP 0x3D2EB0 ; Jump to the Add HP function. [This should always add 0x00 HP, but will cause an update to trigger death.]

0x1816B4:
    JMP 0x143C11 ; Jump to the Information Function. 

0x143C11:
    MOV EBP, [0x2A11478] ; Move the Cutscene Pointer to the EBP register.
    CMP EBP, 0x00 ; Check if the EBP Register is 0x00
    JE 0x143C52 ; If so, continue.
    RET ; Return otherwise.

0x143C52:
    MOV BPL, [0x800000] ; Move the Enable Flag Variable to the BPL register.
    DEC BPL ; Decrease the BPL register.
    JE 0x143CA2 ; If equal to 0x00 [BPL was 0x01], jump to the Information Bar section.
    JMP 0x143CD4 ; Continue otherwise.

0x143CD4:
    DEC BPL ; Decrase the BPL register.
    JE 0x143E43 ; If equal to 0x00 [BPL was 0x02], jump to the Prize Bar section.
    RET ; Return otherwise.

0x143CA2:
    DEC [0x800000] ; Decrease the Enable Flag Variable.
    JMP 0x143D23 ; Branch-off the next empty space.

0x143D23:
    LEA RCX, [0x800004] ; Load the Raw Text Pointer to the RCX register.
    JMP 0x17B710 ; Jump to the Information Bar function.

0x143E43:
    DEC [0x800000] ; Decrease the Enable Flag Variable.
    JMP 0x143F85 ; Branch-off the next empty space.

0x143F85:
    DEC [0x800000] ; Decrease the Enable Flag Variable.
    JMP 0x1440E3 ; Branch-off the next empty space.

0x1440E3:
    LEA RCX, [0x800104] ; Load the Raw Text Pointer to the RCX register.
    JMP 0x1595D0 ; Jump to the Prize Bar function.

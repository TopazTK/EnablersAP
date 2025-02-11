0x180D64:
    JMP 0x102891 # Jump to the injected function start.

0x102891:
    MOV EBP, [0x2A10EF8] # Move the Cutscene Pointer to the EBP register.
    CMP EBP, 0x00 # Check if the EBP Register is 0x00
    JE 0x1028A7 # If so, continue.
    RET # Return otherwise.

0x1028A7:
    MOV BPL, [0x09001C4] # Move the Menu Type Variable to the BPL register.
    JMP 0x1028B3 # Branch-off the next empty space.

0x1028B3:
    INC BPL # Increase the BPL register.
    JE 0x1029B7 # If equal to 0x00 [BPL was 0xFF], continue.
    RET # Return otherwise.

0x1029B7:
    MOV BPL, [0x09BA350] # Move the Is Loaded Variable to the BPL register.
    JMP 0x1029C6 # Branch-off the next empty space.

0x1029C6:
    DEC BPL # Decrease the BPL register.
    JE 0x1029E6 # If equal to 0x00 [BPL was 0x01], continue.
    RET # Return otherwise.

0x1029E6:
    MOV BPL, [0x0717208] # Move the Is Running Variable to the BPL register.
    JMP 0x1029F6 # Branch-off the next empty space.

0x1029F6:
    DEC BPL # Decrease the BPL register.
    JE 0x102592 # If equal to 0x00 [BPL was 0x01], continue.
    RET # Retrun otherwise.

0x102592:
    MOV BPL, [0x0800000] # Move the Enable Flag Variable to the BPL register.
    DEC BPL # Decrease the BPL register.
    JE 0x1025B6 # If equal to 0x00 [BPL was 0x01], jump to the Information Bar section.
    JMP 0x1025A3 # Continue otherwise.

0x1025A3:
    DEC BPL # Decrase the BPL register.
    JE 0x138460 # If equal to 0x00 [BPL was 0x02], jump to the Prize Bar section.
    RET # Return otherwise.

0x1025B6:
    JMP 0x102C68 # Branch-off the next empty space.

0x102C68:
    DEC [0x0800000] # Decrease the Enable Flag Variable.
    JMP 0x102CD9 # Branch-off the next empty space.

0x102CD9:
    JMP 0x102E84 # Branch-off the next empty space.

0x102E84:
    LEA RCX, [0x0800004] # Load the Raw Text Pointer to the RCX register.
    JMP 0x17ADC0 # Jump to the Information Bar function.

0x138460:
    MOV [0x0800000], 0x00000000 # Reset the Enable Flag Variable.
    JMP 0x138475 # Branch-off the next empty space.

0x138475:
    LEA RCX, [0x0800104] # Load the Raw Text Pointer to the RCX register.
    JMP 0x1384E9 # Branch-off the next empty space.
    RET # Return just-in-case.

0x1384E9:
    JMP 0x158C80 # Jump to the Prize Bar function.
    RET # Return just-in-case.

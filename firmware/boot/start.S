    .section .text
    .global _start

_start:
    # Initialize Stack Pointer
    la sp, _stack_top

    # Call C main function
    call main

    # Infinite Loop on exit
1:  j 1b

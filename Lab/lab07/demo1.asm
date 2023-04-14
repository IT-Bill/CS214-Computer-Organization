.include "macro_print_str.asm"
.data
    f1: .float 12.625
.text
    lwc1 $f0, f1
    floor.w.s $f1,$f0 #A
    ceil.w.s $f2,$f0 #A
    round.w.s $f3,$f0 #A
    print_string("orignal float: ")
    print_float($f0)
    print_string("\nafter floor:")
    print_int($f1)
    print_string("\nafter ceil:")
    print_int($f2)
    print_string("\nafter round:")
    print_int($f3)
    
    end
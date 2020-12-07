# ----------------------------------------------------------------------------------------
# Find the maxmum value among three. Runs on 64-bit Linux only.
# To assemble and run:
#
#     gcc -c Assignment9.s && ld Assignment9.o && ./a.out
#
# or
#
#     gcc -nostdlib Assignment9.s && ./a.out
# ----------------------------------------------------------------------------------------
# Author: Troy Bechtold

        .global _start

        .text
_start:
        # write your program below
        movq $10, %rdi #x 
        movq $5, %rsi #y
        movq $1, %rdx #z
	#prepare arguments in registers %rdi, %rsi, %rdx 
	callq FindMax
        # callq FindMax
        # copy the return value from subroutine

		# write your program above

        # exit(0)
        mov     $60, %rax               # system call 60 is exit
        xor     %rdi, %rdi              # we want return code 0
        syscall                         # invoke operating system to exit
		
FindMax: 
        # write your code below 
	#_start:
        # write your program below
        movq %rdi, %rcx #x 
        movq %rsi, %rbx #y
        #movq %rdx, %rdx #z
        cmpq % rcx, %rbx #x < y
        jle _xlarge #x > y
        jmp _ylarge #x < y

 _xlarge:
        cmpq %rcx, %rdx #compare x and z
        jle _xlargest #x > z
        movq % rdx, %rax #x < z
        jmp _end 
 
_ylarge:
        cmpq %rbx, %rdx #compare x and z
        jle _ylargest #y > z
        movq %rdx, %rax #y < z
        jmp _end 
  
_xlargest:
        movq %rcx, %rax 
        jmp _end 
 
_ylargest:
        movq %rbx, %rax 
        jmp _end 
 
_end:
        ret
#end of program
        #before return to caller, make sure the return value is in %rax
        #inside the subroutine, donâ€™t jump to exit(0) since it terminates your program. Jump to â€œretqâ€ instead, because when the subroutine completes, it needs go back to caller. You will need put a label besides the instruction â€œretqâ€
        #Done: retq
		
        # write your code above

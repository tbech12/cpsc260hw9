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
        #prepare arguments in registers %rdi, %rsi, %rdx 
        push %rbx
        movq $10, %rdi #x 
        movq $5, %rsi #y
        movq $1, %rdx #z
	callq FindMax # callq FindMax
	movq %rax, %rbx # copy the return value from subroutine
	pop %rbx
	# write your program above

        # exit(0)
        mov     $60, %rax               # system call 60 is exit
        xor     %rdi, %rdi              # we want return code 0
        syscall                         # invoke operating system to exit
		
FindMax: 
        # write your code below 
	#_start:
        movq %rdi, %rcx #x 
        movq %rsi, %rbp #y
        movq %rdx, %r8 #z
        cmpq % rcx, %rbp #x < y
        jle _xlarge #x > y
        jmp _ylarge #x < y

 _xlarge:
        cmpq %rcx, %r8 #compare x and z
        jle _xlargest #x > z
        movq % r8, %rax #x < z
        jmp _end 
 
_ylarge:
        cmpq %rbp, %r8 #compare x and z
        jle _ylargest #y > z
        movq %r8, %rax #y < z
        jmp _end 
  
_xlargest:
        movq %rcx, %rax 
        jmp _end 
 
_ylargest:
        movq %rbp, %rax 
        jmp _end 
 
_end:
        Return:
        retq #Done: retq
        #end of program
        # write your code above

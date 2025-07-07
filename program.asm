section .data
    prompt1 db "Enter the first number: ", 0xA
    len_prompt1 equ $ - prompt1

    prompt2 db "Enter the next number: ", 0xA
    len_prompt2 equ $ - prompt2

    prompt_op db "Enter the desired operation (+, -, *): ", 0xA
    len_prompt_op equ $ - prompt_op

    result_msg db "Result: ", 0xA
    len_result_msg equ $ - result_msg

section .bss 
    num1 resb 10
    num2 resb 10
    op resb 2
    result resb 20

section .text 
    global _start

_start:

    ; First input structure
    
    ; Print first sentence
    mov rax, 1
    mov rdi, 1
    mov rsi, prompt1
    mov rdx, len_prompt1
    syscall

    ; Stores user's first input 
    mov rax, 0
    mov rdi, 0
    mov rsi, num1
    mov rdx, 10 ; size of reserved memory
    syscall 

    ; Second input structure 

    ; Print second sentence
    mov rax, 1
    mov rdi, 1
    mov rsi, prompt2
    mov rdx, len_prompt2
    syscall

    ; Stores user's second input 
    mov rax, 0
    mov rdi, 0
    mov rsi, num2
    mov rdx, 10 ; size of reserved memory 
    syscall 

    ; Operation input 
    mov rax, 1
    mov rdi, 1 
    mov rsi, prompt_op
    mov rdx, len_prompt_op
    syscall 

    ; Store user's operation input 
    mov rax, 0
    mov rdi, 0
    mov rsi, op
    mov rdx, 2 ; size of reserved memory
    syscall 

    ; First number converter 
    mov rsi, num1 
    call str_to_int
    mov rbx, rax ; num1 in rbx 

    ; Second number converter 
    mov rsi, num2
    call str_to_int
    mov rcx, rax ; num2 in rcx 

    ; Operation logic 
    mov al, byte [op] ; selected operation
    cmp al, '+'
    je .soma 
    cmp al, '-'
    je .sub 
    cmp al, '*'
    je .mult 
    jmp .fim  ; if invalid, exits 

.soma:
    mov rax, rbx 
    add rax, rcx 
    jmp .show

.sub:
    mov rax, rbx
    sub rax, rcx 
    jmp .show

.mult: 
    mov rax, rbx 
    imul rax, rcx 
    jmp .show 

.show:
    mov rdi, result
    call int_to_str

    ; Print "Result" Message
    mov rax, 1 
    mov rdi, 1
    mov rsi, result_msg
    mov rdx, len_result_msg
    syscall 

    ; Show result as string 
    mov rax, 1
    mov rdi, 1
    mov rsi, result 
    mov rdx, 20 ; size in memory 
    syscall 

.fim:

    ; exit 
    mov rax, 60 
    xor rdi, rdi 
    syscall 

; Convert string to integer (rsi)
; return int in rax 
str_to_int:
    xor rax, rax ; Result 
    xor rcx, rcx ; Index

.next_char: 
    movzx rdx, byte [rsi + rcx]
    cmp rdx, 10     ; \n 
    je .done    
    sub rdx, '0'
    imul rax, rax, 10 
    add rax, rdx 
    inc rcx 
    jmp .next_char

.done: 
    ret 

; Convert integer to string 
int_to_str: 
    mov rcx, 10
    mov rbx, rdi 
    add rbx, 19 ; end of the buffer
    mov byte [rbx], 0xA ; newline
    dec rbx 

.convert: 
    xor rdx, rdx 
    div rcx 
    add dl, '0'
    mov [rbx], dl
    dec rbx 
    test rax, rax 
    jnz .convert 

    inc rbx 
    mov rsi, rbx 
    ret 

format ELF64

public _start

include 'func.asm'

section '.bss' writable                     
  temp dq 1 

_start:
    pop rcx
    mov rsi, [rsp + 8]
    mov rax, rsi
    mov rbx, 10
    xor rcx, rcx
    inc rcx
    .iter:
        xor rdx, rdx
        div rbx
        push rdx
        inc rcx
        cmp rax, 0
        jne .iter

    
    .print:
        xor rax, rax
        pop rax
        add rax, '0'
        push rcx
        call print_one
        pop rcx
        dec rcx
        cmp rcx, 0
        jne .print
    .end:
        call exit

print_one:
  mov [temp], 0
  push rax
  mov rax, 1
  mov edi, 1
  pop rdx
  mov [temp], rdx
  mov rsi, temp
  mov edx, 1
  syscall
  ret
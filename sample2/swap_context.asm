.code
swap_context proc
    ; call指令:
    ; 先把下一句指令的地址压入栈顶 rsp += 8
    ; 跳转到call后面跟的地址上去
    mov rax, [rsp]     ; 函数地址
    lea rsp, [rsp + 8] ; 栈顶地址

    ; 保存非易失的寄存器
    mov [rcx +  0], rax
    mov [rcx +  8], rsp
    mov [rcx + 16], r12
    mov [rcx + 24], r13
    mov [rcx + 32], r14
    mov [rcx + 40], r15
    mov [rcx + 48], rbx
    mov [rcx + 56], rbp

    ; 恢复非易失的寄存器
    mov rax, [rdx +  0]
    mov rsp, [rdx +  8]
    mov r12, [rdx + 16]
    mov r13, [rdx + 24]
    mov r14, [rdx + 32]
    mov r15, [rdx + 40]
    mov rbx, [rdx + 48]
    mov rbp, [rdx + 56]

    ; 跳转函数地址
    jmp rax
swap_context endp
end
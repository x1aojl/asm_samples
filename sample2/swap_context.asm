.code
swap_context proc
    ; callָ��:
    ; �Ȱ���һ��ָ��ĵ�ַѹ��ջ�� rsp += 8
    ; ��ת��call������ĵ�ַ��ȥ
    mov rax, [rsp]     ; ������ַ
    lea rsp, [rsp + 8] ; ջ����ַ

    ; �������ʧ�ļĴ���
    mov [rcx +  0], rax
    mov [rcx +  8], rsp
    mov [rcx + 16], r12
    mov [rcx + 24], r13
    mov [rcx + 32], r14
    mov [rcx + 40], r15
    mov [rcx + 48], rbx
    mov [rcx + 56], rbp

    ; �ָ�����ʧ�ļĴ���
    mov rax, [rdx +  0]
    mov rsp, [rdx +  8]
    mov r12, [rdx + 16]
    mov r13, [rdx + 24]
    mov r14, [rdx + 32]
    mov r15, [rdx + 40]
    mov rbx, [rdx + 48]
    mov rbp, [rdx + 56]

    ; ��ת������ַ
    jmp rax
swap_context endp
end
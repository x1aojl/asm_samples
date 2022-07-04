#include <iostream>

extern "C" void jmp_func(void *);

void func()
{
    printf("Hello ASM");
}

int main()
{
    jmp_func(func);
    return 0;
}
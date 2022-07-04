#include <vector>

extern "C" void swap_context(void *, void *);

struct Context
{
    void *registers[8];
} main_context, func_context;

void func()
{
    swap_context(&func_context, &main_context);
    swap_context(&func_context, &main_context);
}

int main()
{
    std::vector<char> mem(4096);
    void *stack = (char *)((uintptr_t)(&mem.back()) & ~15ull) - sizeof(void *);

    func_context.registers[0] = (void *)func;
    func_context.registers[1] = stack;

    swap_context(&main_context, &func_context);
    swap_context(&main_context, &func_context);

    return 0;
}
# 指定cmake最小版本为3.12
cmake_minimum_required (VERSION 3.12)

# 设置工程名称
project(sample2)

# 启用汇编
enable_language(ASM_MASM)

# 添加可执行文件
add_executable(${PROJECT_NAME} main.cpp swap_context.asm)
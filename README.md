# assembly-calculator-logic

## Assembly Calculator

This is a simple calculator written in x86-64 Assembly (NASM syntax) for Linux environments.
It accepts two numbers and an operation (+, -, *) as input via the terminal, performs the calculation, and displays the result.

Expected output (WSL)
![image](https://github.com/user-attachments/assets/a58e0721-85af-49d2-b490-8d8bba1a6c74)


Features:

String input from user

Integer conversion

Addition, subtraction, multiplication and division.

String output with result

Requirements:

WSL (Windows Subsystem for Linux) or a native Linux environment

NASM assembler

ld linker

Instructions to run on WSL:

Open your WSL terminal

Navigate to the project folder
cd /mnt/c/Users/Natan/Documents/GitHub/assembly-calculator-logic

Compile the program
nasm -f elf64 program.asm -o program.o

Link the object file
ld program.o -o program

Execute the program
./program

Project Files:

program.asm – Source code with all logic (input, computation, output)

program.o – Compiled object file (intermediate step before linking)

program – Executable binary file generated after linking

dump.txt – Optional file created using xxd program > dump.txt, contains a hexadecimal dump of the binary

Calculadora em Assembly

Esta é uma calculadora simples escrita em Assembly x86-64 (sintaxe NASM) para ambientes Linux.
Ela aceita dois números e uma operação (+, -, *) como entrada no terminal, executa o cálculo e exibe o resultado.

Funcionalidades:

Entrada de texto do usuário

Conversão para inteiro

Soma, subtração e multiplicação

Saída em texto com o resultado

Requisitos:

WSL (Subsistema do Windows para Linux) ou ambiente Linux nativo

Montador NASM

Linkador ld

Instruções para rodar no WSL:

Abra o terminal do WSL

Vá até a pasta do projeto
cd /mnt/c/Users/Natan/Documents/GitHub/assembly-calculator-logic

Compile o programa
nasm -f elf64 program.asm -o program.o

Linke o arquivo objeto
ld program.o -o program

Execute o programa
./program

Arquivos do Projeto:

program.asm – Código-fonte com toda a lógica (entrada, cálculo e saída)

program.o – Arquivo objeto gerado pela compilação

program – Arquivo binário executável gerado após o link

dump.txt – Arquivo opcional gerado com xxd program > dump.txt, contém o hexdump do executável

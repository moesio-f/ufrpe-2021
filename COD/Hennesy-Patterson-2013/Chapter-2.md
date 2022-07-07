- [Chapter 2: Instructions: Language of the Computer](#chapter-2-instructions-language-of-the-computer)
  - [2.1 Introduction](#21-introduction)
  - [2.2. Operations of the Computer Hardware](#22-operations-of-the-computer-hardware)
  - [2.3 Operands of the Computer Hardware](#23-operands-of-the-computer-hardware)
    - [Memory Operands](#memory-operands)
  - [2.4 Signed and Unsigned Numbers](#24-signed-and-unsigned-numbers)
  - [2.5 Representing Instructions in the Computer](#25-representing-instructions-in-the-computer)
    - [MIPS Fields](#mips-fields)
  - [2.6 Logical Operations](#26-logical-operations)
  - [2.7 Instructions for Making Decisions](#27-instructions-for-making-decisions)
    - [Loops](#loops)
    - [Case/Switch Statement](#caseswitch-statement)
  - [2.8 Supporting Procedures in Computer Hardware](#28-supporting-procedures-in-computer-hardware)
      - [Using More Registers](#using-more-registers)

---
# Chapter 2: Instructions: Language of the Computer

## 2.1 Introduction

> This similarity of instruction sets occurs because all computers are constructed from hardware technologies based on similar underlying principles and because there are a few basic operations that all computers must provide. 

> **Stored-program concept** instruction and data of many types can be stored in memory as numbers, leading to the stored program computer.

## 2.2. Operations of the Computer Hardware

> *Design Principle 1*: Simplicity favors regularity.

![IMG](imgs/2-1-2.png)

![IMG](imgs/2-1-3.png)

## 2.3 Operands of the Computer Hardware

> Unlike programs in high-level languages, the operands of arithmetic instructions are restricted; they must be from a limited number of special locations built directly in hardware called **registers**.
>
> Registers are primitives used in hardware design that are also visible to the programmer when the computer is completed, so you can think of registers as the bricks of computer construction. 
> 
>  The size of a register in
the MIPS architecture is 32 bits; groups of 32 bits occur so frequently that they are given the name **word** in the MIPS architecture.

In the MIPS architecture, there are a limited number of registers (usually, 32).

> *Design Principle 2:* Smaller is faster.

![IMG](imgs/2-1-1.png)

### Memory Operands

MIPS arithmetic operations can only use register, since this number is limited it must access the main memory.

> [...] **Data transfer instructions** are used to access a word in memory by supplying the memory **address**.

> In addition to associating variables with registers, the compiler allocates data structures like arrays and structures to locations in memory. The compiler can then place the proper starting address into the data transfer instructions.

> In MIPS, words must start at addresses that are multiples of 4. This requirement is called an **alignment restriction** (data must ne aligned in memory on natural boundaries), and many architectures have it.

> Computers divide into those that use the address of the leftmost or “big end” byte as the word address versus those that use the rightmost or “little end” byte. 


## 2.4 Signed and Unsigned Numbers

> **Least significant bit** is the rightmost bit in a MIPS word.
>
> **Most significant bit** is the leftmost bit in a MIPS word.

> It’s up to the programming language, the operating system, and the program to determine what to do if overflow occurs.

## 2.5 Representing Instructions in the Computer

> Instructions are kept in the computer as a series of high and low electronic signals and may be represented as numbers. In fact, each piece of an instruction can be considered as an individual number, and placing these numbers side by side forms the instruction

> The **instruction format** is a form of representation of an instruction composed of fields of binary numbers.

> **Machine Language** is the binary representation used for communication within a computer system.

### MIPS Fields

![IMG](imgs/2-mips-fields.png)

> A problem occurs when an instruction needs longer fields than those shown above. For example, the load word instruction must specify two registers and a constant. If the address were to use one of the 5-bit fields in the format above, the constant within the load word instruction would be limited to only 25 or 32. This constant is used to select elements from arrays or data structures, and it often needs to be much larger than 32. This 5-bit field is too small to be useful.

> *Design Principle 3:* Good design demands good compromises.

> The compromise chosen by the MIPS designers is to keep all instructions the same length, thereby requiring different kinds of instruction formats for different kinds of instructions. For example, the format above is called **R-type** (for register) or **R-format**. A second type of instruction format is called **I-type** (for immediate) or **I-format** and is used by the immediate and data transfer instructions. 

![IMG](imgs/2-mips-i-format.png)

![IMG](imgs/2-5.png)


> Today’s computers are built on two key principles:
> 1. Instructions are represented as numbers.
> 2. Programs are stored in memory to be read or written, just like data.

## 2.6 Logical Operations

- Shifts
- AND
- OR
- NOT

## 2.7 Instructions for Making Decisions

> **Conditional branch** is an instruction that requires the comparison of two values and that allows for a subsequent transfer of control to a new address in the program based on the outcome of th comparison.

### Loops

Can be achieved with conditional branches and saving intermediary results.

### Case/Switch Statement

Can be achieved either with conditional branches or with a **jump address table**.

## 2.8 Supporting Procedures in Computer Hardware

Can be implemented with **jump-and-link** instructions.

#### Using More Registers

The idea is to use the main memory with a **stack** and saving the **stack pointer** into the register `$sp`.

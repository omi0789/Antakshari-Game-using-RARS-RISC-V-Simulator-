# RISC-V Antakshari Game

A unique implementation of the classic Indian musical game Antakshari, built using RISC-V assembly language. This project demonstrates low-level programming concepts while preserving the fun of the traditional game.

## Overview

Antakshari is a popular Indian musical game where players/teams take turns singing songs that begin with the last letter/syllable of the previous song. This RISC-V implementation brings the game logic to assembly level programming, offering an educational yet entertaining perspective on low-level system design.

## Features

- Text-based interface for game interaction
- Player management system for 2-4 players
- Song validation using basic syllable matching
- Score tracking mechanism
- Timer implementation for turn management
- Basic song database in memory

## Technical Details

- Written in RISC-V assembly language
- Uses RV32I base integer instruction set
- Memory-efficient design with minimal data storage
- Implements basic string manipulation in assembly
- Uses RISC-V system calls for I/O operations

## Prerequisites

- RISC-V toolchain (riscv64-unknown-elf-gcc)
- RISC-V simulator (QEMU or Spike)
- Make (for build automation)


## Implementation Highlights

- Custom string comparison routines in RISC-V assembly
- Efficient memory management for song storage
- Interrupt handling for timer implementation
- Basic random number generation for game variations

## Game Rules

1. Players take turns in clockwise order
2. Current player must sing a song starting with the last letter of previous song
3. It will run for 10 rounds and who has most number of points will win the game
4. Points awarded for valid songs
5. Game ends when a player reaches winning score or can't continue

## Contributing

Contributions are welcome! Please feel free to submit pull requests for:

- Additional features
- Performance optimizations
- Bug fixes
- Documentation improvements


##Here is the sample output:


![WhatsApp Image 2025-01-02 at 12 14 37_48bccd93](https://github.com/user-attachments/assets/f09c19dc-91fc-4216-8e59-6252819ddbce)


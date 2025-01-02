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

## Building and Running

```bash
# Clone the repository
git clone https://github.com/yourusername/riscv-antakshari.git

# Navigate to project directory
cd riscv-antakshari

# Build the project
make build

# Run the game
make run
```

## Implementation Highlights

- Custom string comparison routines in RISC-V assembly
- Efficient memory management for song storage
- Interrupt handling for timer implementation
- Basic random number generation for game variations

## Game Rules

1. Players take turns in clockwise order
2. Current player must sing a song starting with the last letter of previous song
3. 30-second time limit per turn
4. Points awarded for valid songs
5. Game ends when a player reaches winning score or can't continue

## Contributing

Contributions are welcome! Please feel free to submit pull requests for:

- Additional features
- Performance optimizations
- Bug fixes
- Documentation improvements

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Thanks to the RISC-V community for excellent documentation
- Inspired by traditional Antakshari game played across India
- Special thanks to contributors and testers

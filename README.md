# 🎄 Advent of Code CLI

A simple and elegant command-line tool to download [Advent of Code](https://adventofcode.com) puzzle inputs.

## Features

- 📥 Download puzzle inputs directly from the command line
- 🎯 Smart defaults: uses current year and day if not specified
- 📄 Output to file or stdout (perfect for piping)
- 🎨 Beautiful colored output
- ⚡ Fast and lightweight - just a single bash script

## Installation

### Quick Install (Recommended)

```bash
curl -fsSL https://raw.githubusercontent.com/sullrich84/aoc-cli/main/install.sh | bash
```

Alternatively, download and run the installer locally:

```bash
curl -fsSL https://raw.githubusercontent.com/sullrich84/aoc-cli/main/install.sh -o install.sh
chmod +x install.sh
./install.sh
```

### Install from Source

```bash
git clone https://github.com/sullrich84/aoc-cli.git
cd aoc-cli
./install.sh
```

## Setup

Before using the CLI, you need to set your Advent of Code session cookie:

### Finding Your Session Cookie

1. Go to [adventofcode.com](https://adventofcode.com) and log in
2. Open your browser's Developer Tools (F12)
3. Go to **Application** → **Storage** → **Cookies** → `https://adventofcode.com`
4. Copy the value of the `session` cookie

### Setting the Session Cookie

Add this to your shell configuration file (`~/.bashrc`, `~/.zshrc`, etc.):

```bash
export AOC_SESSION='your_session_cookie_here'
```

Then reload your shell:

```bash
source ~/.bashrc  # or ~/.zshrc
```

## Usage

```bash
aoc [OPTIONS]
```

### Options

- `-y, --year <year>` - Specify the year (default: current year)
- `-d, --day <day>` - Specify the day (default: current day)
- `-o, --out <file>` - Output to file (default: stdout)
- `-h, --help` - Show help message

### Examples

```bash
# Download today's input to stdout
aoc

# Download specific year and day
aoc -y 2024 -d 5

# Save to a file
aoc -y 2024 -d 5 -o input.txt

# Use current year, specific day
aoc -d 10 -o inputs/day10.txt

# Pipe to another command
aoc -y 2023 -d 1 | wc -l
```

## Requirements

- bash
- curl
- macOS, Linux, or WSL

## License

MIT License - see the script header for full license text.

Copyright (c) 2025 Sebastian Ullrich

## Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request.

## Acknowledgments

- [Advent of Code](https://adventofcode.com) by [Eric Wastl](https://twitter.com/ericwastl)

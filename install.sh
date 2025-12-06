#!/bin/bash

# MIT License
#
# Copyright (c) 2025 Sebastian Ullrich
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Advent of Code CLI Installer

set -e

echo "🎄 Advent of Code CLI - Installer"
echo ""

# Determine installation directory
if [ -w "/usr/local/bin" ]; then
    INSTALL_DIR="/usr/local/bin"
elif [ -d "$HOME/.local/bin" ]; then
    INSTALL_DIR="$HOME/.local/bin"
else
    INSTALL_DIR="$HOME/.local/bin"
    echo -e "[\033[0;36mℹ\033[0m] Creating directory: $INSTALL_DIR"
    mkdir -p "$INSTALL_DIR"
fi

# Check if aoc script exists in current directory
if [ ! -f "aoc" ]; then
    echo -e "\033[0;31mError: 'aoc' script not found in current directory\033[0m"
    echo "Please run this installer from the aoc-cli directory or use:"
    echo "  curl -fsSL https://raw.githubusercontent.com/sullrich84/aoc-cli/main/aoc -o aoc"
    exit 1
fi

# Copy the script
echo -e "[\033[0;36m⬇\033[0m] Installing aoc to $INSTALL_DIR/aoc..."
cp aoc "$INSTALL_DIR/aoc"
chmod +x "$INSTALL_DIR/aoc"

echo -e "[\033[0;32m✓\033[0m] Successfully installed aoc CLI"
echo ""

# Check if directory is in PATH
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    echo -e "[\033[0;33m⚠\033[0m] Warning: $INSTALL_DIR is not in your PATH"
    echo ""
    echo "Add it to your PATH by adding this line to your shell config:"

    if [ -n "$ZSH_VERSION" ]; then
        echo "  echo 'export PATH=\"$INSTALL_DIR:\$PATH\"' >> ~/.zshrc"
        echo "  source ~/.zshrc"
    elif [ -n "$BASH_VERSION" ]; then
        echo "  echo 'export PATH=\"$INSTALL_DIR:\$PATH\"' >> ~/.bashrc"
        echo "  source ~/.bashrc"
    else
        echo "  export PATH=\"$INSTALL_DIR:\$PATH\""
    fi
    echo ""
fi

# Remind about session cookie
echo "Before using aoc, set your Advent of Code session cookie:"
echo "  export AOC_SESSION='your_session_cookie_here'"
echo ""
echo "To make it permanent, add it to your shell config file"
echo ""
echo "Usage: aoc --help"

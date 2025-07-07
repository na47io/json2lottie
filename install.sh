#!/bin/bash

# json2lottie installer
# This script installs the json2lottie tool to /usr/local/bin

set -e

INSTALL_DIR="/usr/local/bin"
SCRIPT_NAME="json2lottie"
REPO_URL="https://raw.githubusercontent.com/na47io/json2lottie/main/json2lottie"

echo "Installing json2lottie..."

# Check if running as root for system-wide install
if [ "$EUID" -eq 0 ]; then
    echo "Installing to $INSTALL_DIR (system-wide)"
    TARGET_DIR="$INSTALL_DIR"
else
    # Install to user's local bin directory
    TARGET_DIR="$HOME/.local/bin"
    echo "Installing to $TARGET_DIR (user-local)"
    mkdir -p "$TARGET_DIR"
fi

# If installing from local directory (during development)
if [ -f "./json2lottie" ]; then
    echo "Installing from local directory..."
    cp "./json2lottie" "$TARGET_DIR/$SCRIPT_NAME"
    chmod +x "$TARGET_DIR/$SCRIPT_NAME"
else
    echo "Downloading from repository..."
    if command -v curl >/dev/null 2>&1; then
        curl -fsSL "$REPO_URL" -o "$TARGET_DIR/$SCRIPT_NAME"
    elif command -v wget >/dev/null 2>&1; then
        wget -q "$REPO_URL" -O "$TARGET_DIR/$SCRIPT_NAME"
    else
        echo "Error: Neither curl nor wget found. Please install one of them."
        exit 1
    fi
    chmod +x "$TARGET_DIR/$SCRIPT_NAME"
fi

# Check if directory is in PATH
if [[ ":$PATH:" == *":$TARGET_DIR:"* ]]; then
    echo "✓ json2lottie installed successfully!"
    echo "✓ $TARGET_DIR is in your PATH"
else
    echo "✓ json2lottie installed successfully!"
    echo "⚠️  $TARGET_DIR is not in your PATH"
    echo "   Add this line to your shell profile (~/.bashrc, ~/.zshrc, etc.):"
    echo "   export PATH=\"$TARGET_DIR:\$PATH\""
fi

echo ""
echo "Usage: json2lottie input.json output.lottie"
echo "Try: json2lottie --help"
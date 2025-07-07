# json2lottie

A simple command-line tool to convert Lottie JSON animation files to the binary `.lottie` format.

## Quick Install

```bash
curl -fsSL https://raw.githubusercontent.com/na47io/json2lottie/main/install.sh | bash
```

## What it does

This tool converts standard Lottie JSON files into the `.lottie` format (a ZIP archive) that's compatible with:
- `@lottiefiles/dotlottie-react`
- Other DotLottie libraries
- Modern Lottie players that support the binary format

## Usage

```bash
json2lottie input.json output.lottie
```

### Examples

```bash
# Convert a single animation
json2lottie animation.json my-animation.lottie

# Convert with relative paths
json2lottie ./assets/loader.json ./dist/loader.lottie

# Convert with absolute paths
json2lottie /path/to/animation.json /path/to/output.lottie
```

## Requirements

- `zip` command (usually pre-installed on macOS and Linux)
- Bash shell

## Manual Installation

1. Download the script:
   ```bash
   curl -O https://raw.githubusercontent.com/na47io/json2lottie/main/json2lottie
   ```

2. Make it executable:
   ```bash
   chmod +x json2lottie
   ```

3. Move to your PATH:
   ```bash
   sudo mv json2lottie /usr/local/bin/
   # or for user-local install:
   mkdir -p ~/.local/bin && mv json2lottie ~/.local/bin/
   ```

## Output Format

The generated `.lottie` file contains:
- `animations/data.json` - Your Lottie animation data
- `manifest.json` - Metadata for the DotLottie format

## Troubleshooting

**Error: "zip command not found"**
- Install zip: `sudo apt install zip` (Ubuntu/Debian) or `brew install zip` (macOS)

**Error: "Input JSON file not found"**
- Check the file path and ensure the JSON file exists

**Permission denied**
- Make sure you have write permissions to the output directory

#!/bin/bash

# QHD Invoice Generator - Easy Installer
# Double-click this file to install and run

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

clear
echo -e "${BLUE}================================================${NC}"
echo -e "${BLUE}   QHD Invoice Generator - 发票生成器${NC}"
echo -e "${BLUE}   Easy Installation Script${NC}"
echo -e "${BLUE}================================================${NC}"
echo ""

# Check if Python is installed
echo -e "${YELLOW}[1/4] Checking Python installation...${NC}"
if command -v python3 &> /dev/null; then
    PYTHON_VERSION=$(python3 --version)
    echo -e "${GREEN}✓ Python is installed: $PYTHON_VERSION${NC}"
else
    echo -e "${RED}✗ Python 3 is not installed${NC}"
    echo ""
    echo "Please install Python 3 from: https://www.python.org/downloads/"
    echo "Or use Homebrew: brew install python3"
    echo ""
    read -p "Press Enter to exit..."
    exit 1
fi

echo ""

# Check if all required files exist
echo -e "${YELLOW}[2/4] Checking required files...${NC}"
REQUIRED_FILES=("invoice_generator_v2.0.html" "manifest.json" "sw.js" "icon-192.png" "icon-512.png")
ALL_FILES_PRESENT=true

for file in "${REQUIRED_FILES[@]}"; do
    if [ -f "$file" ]; then
        echo -e "${GREEN}✓ Found: $file${NC}"
    else
        echo -e "${RED}✗ Missing: $file${NC}"
        ALL_FILES_PRESENT=false
    fi
done

if [ "$ALL_FILES_PRESENT" = false ]; then
    echo ""
    echo -e "${RED}Some required files are missing!${NC}"
    echo "Please make sure all files are in the same folder."
    echo ""
    read -p "Press Enter to exit..."
    exit 1
fi

echo ""

# Find available port (8080, or next available)
echo -e "${YELLOW}[3/4] Finding available port...${NC}"
PORT=8080
while lsof -Pi :$PORT -sTCP:LISTEN -t >/dev/null 2>&1 ; do
    echo -e "${YELLOW}Port $PORT is in use, trying next port...${NC}"
    PORT=$((PORT + 1))
done
echo -e "${GREEN}✓ Will use port: $PORT${NC}"

echo ""

# Get IP addresses
echo -e "${YELLOW}[4/4] Getting network information...${NC}"

# Get local IP
LOCAL_IP=$(ifconfig | grep "inet " | grep -v 127.0.0.1 | head -1 | awk '{print $2}')

if [ -z "$LOCAL_IP" ]; then
    LOCAL_IP="localhost"
fi

echo -e "${GREEN}✓ Local IP address: $LOCAL_IP${NC}"

echo ""
echo -e "${BLUE}================================================${NC}"
echo -e "${GREEN}✓ Installation check complete!${NC}"
echo -e "${BLUE}================================================${NC}"
echo ""

# Display access URLs
echo -e "${YELLOW}📱 Access URLs:${NC}"
echo ""
echo -e "${GREEN}For you (on this computer):${NC}"
echo -e "   ${BLUE}http://localhost:$PORT/invoice_generator_v2.0.html${NC}"
echo ""
echo -e "${GREEN}For co-workers (on same network):${NC}"
echo -e "   ${BLUE}http://$LOCAL_IP:$PORT/invoice_generator_v2.0.html${NC}"
echo ""
echo -e "${YELLOW}📋 To install as desktop app:${NC}"
echo "   1. Open the URL above in Chrome/Edge"
echo "   2. Click the install icon (⊕) in the address bar"
echo "   3. Click 'Install' button"
echo ""
echo -e "${BLUE}================================================${NC}"
echo ""

# Ask user if they want to start the server
echo -e "${YELLOW}Start the web server now?${NC}"
echo "Press ENTER to start, or Ctrl+C to cancel"
read

echo ""
echo -e "${GREEN}🚀 Starting web server...${NC}"
echo -e "${YELLOW}Keep this window open while using the app!${NC}"
echo -e "${YELLOW}Press Ctrl+C to stop the server${NC}"
echo ""
echo -e "${BLUE}================================================${NC}"
echo -e "${GREEN}Server is running on:${NC}"
echo -e "   ${BLUE}http://localhost:$PORT/invoice_generator_v2.0.html${NC}"
echo -e "${BLUE}================================================${NC}"
echo ""

# Open in default browser
sleep 1
open "http://localhost:$PORT/invoice_generator_v2.0.html"

# Start the server
python3 -m http.server $PORT

# This runs when server is stopped
echo ""
echo -e "${YELLOW}Server stopped.${NC}"
echo ""
read -p "Press Enter to exit..."

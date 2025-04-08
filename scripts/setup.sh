#!/bin/bash

# Colors for terminal output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Set error handling
set -e
trap 'echo -e "${RED}An error occurred during setup. Exiting...${NC}"; exit 1' ERR

echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║      Digital Clock Setup Script        ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"

# Check if Node.js is installed
echo -e "\n${YELLOW}Checking for Node.js...${NC}"
if ! command -v node &> /dev/null; then
    echo -e "${YELLOW}Node.js could not be found. Please install Node.js (v14 or higher) from https://nodejs.org/${NC}"
    exit 1
fi

NODE_VERSION=$(node -v)
echo -e "${GREEN}✓ Node.js is installed: ${NODE_VERSION}${NC}"

# Check if npm is installed
echo -e "\n${YELLOW}Checking for npm...${NC}"
if ! command -v npm &> /dev/null; then
    echo -e "${YELLOW}npm could not be found. Please ensure npm is installed with Node.js${NC}"
    exit 1
fi

NPM_VERSION=$(npm -v)
echo -e "${GREEN}✓ npm is installed: ${NPM_VERSION}${NC}"

# Install dependencies with error handling
echo -e "\n${YELLOW}Installing dependencies...${NC}"
if npm install; then
    echo -e "${GREEN}✓ Dependencies installed successfully${NC}"
else
    echo -e "${RED}Failed to install dependencies. Please check your internet connection and try again.${NC}"
    exit 1
fi

# Clear error trap now that critical operations are done
trap - ERR

# Setup complete, offer to start the app
echo -e "\n${GREEN}Setup complete!${NC}"
echo -e "\n${YELLOW}Would you like to start the application now? (y/n)${NC}"
read -r START_APP

if [[ $START_APP =~ ^[Yy]$ ]]; then
    echo -e "\n${YELLOW}Starting the application...${NC}"
    echo -e "${BLUE}The application will be available at: ${GREEN}http://localhost:5173${NC}"
    echo -e "${BLUE}Press Ctrl+C to stop the application${NC}\n"
    npm run dev
else
    echo -e "\n${BLUE}You can start the application later with: ${GREEN}npm run dev${NC}"
    echo -e "${BLUE}The application will be available at: ${GREEN}http://localhost:5173${NC}\n"
fi 
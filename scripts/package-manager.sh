#!/bin/bash

# Colors for terminal output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║    Digital Clock Package Manager       ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"

function show_help {
  echo -e "\n${YELLOW}Usage:${NC}"
  echo -e "  $0 [command]"
  echo -e "\n${YELLOW}Available commands:${NC}"
  echo -e "  ${GREEN}install${NC} - Install dependencies"
  echo -e "  ${GREEN}clean${NC} - Clean build artifacts and caches"
  echo -e "  ${GREEN}update${NC} - Update dependencies"
  echo -e "  ${GREEN}audit${NC} - Run security audit"
  echo -e "  ${GREEN}start${NC} - Start the development server"
  echo -e "  ${GREEN}build${NC} - Build for production"
  echo -e "  ${GREEN}help${NC} - Show this help message"
  echo -e "\n${YELLOW}Examples:${NC}"
  echo -e "  $0 install"
  echo -e "  $0 clean"
}

if [ $# -eq 0 ]; then
  show_help
  exit 0
fi

case "$1" in
  install)
    echo -e "\n${YELLOW}Installing dependencies...${NC}"
    npm install
    echo -e "${GREEN}✓ Dependencies installed successfully${NC}"
    ;;
  clean)
    echo -e "\n${YELLOW}Cleaning build artifacts and caches...${NC}"
    rm -rf node_modules/.vite dist
    echo -e "${GREEN}✓ Cleaned successfully${NC}"
    ;;
  update)
    echo -e "\n${YELLOW}Updating dependencies...${NC}"
    npm update
    echo -e "${GREEN}✓ Dependencies updated successfully${NC}"
    ;;
  audit)
    echo -e "\n${YELLOW}Running security audit...${NC}"
    npm audit
    ;;
  start)
    echo -e "\n${YELLOW}Starting the development server...${NC}"
    echo -e "${BLUE}The application will be available at: ${GREEN}http://localhost:5173${NC}"
    echo -e "${BLUE}Press Ctrl+C to stop the application${NC}\n"
    npm run dev
    ;;
  build)
    echo -e "\n${YELLOW}Building for production...${NC}"
    npm run build
    echo -e "${GREEN}✓ Build completed successfully${NC}"
    echo -e "${BLUE}The built files are in the ${GREEN}dist/${BLUE} directory${NC}"
    ;;
  help)
    show_help
    ;;
  *)
    echo -e "\n${RED}Error: Unknown command '$1'${NC}"
    show_help
    exit 1
    ;;
esac 
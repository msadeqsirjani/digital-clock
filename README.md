# Digital Clock

A minimalist, responsive digital clock application built with React and TailwindCSS. Simple, clean, and functional.

## Features

- **Real-time Clock**: Updates every second with precise time
- **Date Display**: Shows the current date in a readable format
- **Dark/Light Mode**: Toggle between dark and light themes
- **12/24 Hour Format**: Switch between 12-hour and 24-hour time formats
- **Responsive Design**: Works on all devices and screen sizes
- **Full Screen Background**: Fills the entire screen with the theme color
- **Title Updates**: Browser tab title updates with the current time

## Getting Started

### Prerequisites

- Node.js (v14 or higher)
- npm (v6 or higher)

### Quick Setup

#### Using Setup Scripts

For Unix/Linux/macOS:
```bash
./scripts/setup.sh
```

For Windows:
```
scripts\setup.bat
```

These scripts will check your environment, install dependencies, and offer to start the application for you.

### Package Manager Scripts

We provide convenient scripts for common package operations:

For Unix/Linux/macOS:
```bash
./scripts/package-manager.sh [command]
```

For Windows:
```
scripts\package-manager.bat [command]
```

Available commands:
- `install` - Install dependencies
- `clean` - Clean build artifacts and caches
- `update` - Update dependencies
- `audit` - Run security audit
- `start` - Start the development server
- `build` - Build for production
- `help` - Show help message

For example:
```bash
./scripts/package-manager.sh start
```

### Manual Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/digital-clock.git
   cd digital-clock
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Start the development server:
   ```bash
   npm run dev
   ```

4. Open your browser and navigate to `http://localhost:5173`

### Available npm Scripts

- `npm run dev` - Start the development server
- `npm run build` - Build for production
- `npm run preview` - Preview the production build
- `npm run start` - Start the development server and open in browser
- `npm run setup` - Install dependencies
- `npm run clean` - Clean build artifacts and cache
- `npm run prepare` - Clean and reinstall dependencies
- `npm run restart` - Clean, reinstall, and restart the development server

### Building for Production

To create a production build:

```bash
npm run build
```

The built files will be in the `dist` directory.

## Technologies Used

- React 
- TypeScript
- TailwindCSS
- Vite
- Lucide Icons

## Usage

- Click the sun/moon icon to toggle between dark and light modes
- Click the "12H"/"24H" button to switch time formats

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details. 
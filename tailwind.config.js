/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        primary: {
          light: '#ffffff',
          dark: '#1a1a1a',
        },
      },
      transition: {
        'colors': 'background-color 0.5s ease-in-out',
      },
    },
  },
  plugins: [],
} 
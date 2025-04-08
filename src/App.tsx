import React, { useState, useEffect } from 'react';
import { Moon, Sun } from 'lucide-react';

function App() {
  const [time, setTime] = useState('');
  const [date, setDate] = useState('');
  const [isDark, setIsDark] = useState(true);
  const [is24Hour, setIs24Hour] = useState(true);
  
  useEffect(() => {
    const updateTime = () => {
      const now = new Date();
      
      // Format time
      let hours = now.getHours();
      const minutes = now.getMinutes().toString().padStart(2, '0');
      const seconds = now.getSeconds().toString().padStart(2, '0');
      
      let period = '';
      if (!is24Hour) {
        period = hours >= 12 ? ' PM' : ' AM';
        hours = hours % 12 || 12;
      }
      
      const timeString = `${hours}:${minutes}:${seconds}${period}`;
      
      // Format date
      const options: Intl.DateTimeFormatOptions = { 
        weekday: 'long', 
        year: 'numeric', 
        month: 'long', 
        day: 'numeric' 
      };
      const dateString = now.toLocaleDateString(undefined, options);
      
      setTime(timeString);
      setDate(dateString);
      document.title = timeString;
    };
    
    updateTime();
    const interval = setInterval(updateTime, 1000);
    return () => clearInterval(interval);
  }, [is24Hour]);

  // Apply background color to html and body
  useEffect(() => {
    document.body.className = isDark ? 'bg-gray-900' : 'bg-gray-100';
  }, [isDark]);
  
  return (
    <div className={`min-h-screen w-full flex flex-col justify-center items-center ${
      isDark ? 'bg-gray-900 text-white' : 'bg-gray-100 text-gray-800'
    }`}>
      <div className="text-center p-8">
        <div className="text-7xl md:text-9xl font-light tracking-tight mb-4">
          {time}
        </div>
        <div className="text-xl opacity-75">
          {date}
        </div>
        
        <div className="mt-8 flex gap-4 justify-center">
          <button 
            onClick={() => setIsDark(!isDark)} 
            className="p-2 rounded-full hover:bg-opacity-20 hover:bg-white transition-colors"
            aria-label="Toggle theme"
          >
            {isDark ? <Sun size={20} /> : <Moon size={20} />}
          </button>
          
          <button 
            onClick={() => setIs24Hour(!is24Hour)} 
            className={`px-3 py-1 rounded-full text-sm transition-colors ${
              isDark ? 'hover:bg-gray-700' : 'hover:bg-gray-200'
            }`}
          >
            {is24Hour ? '12H' : '24H'}
          </button>
        </div>
      </div>
    </div>
  );
}

export default App; 
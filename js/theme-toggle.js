// Theme Toggle Functionality
document.addEventListener('DOMContentLoaded', function() {
    const themeToggle = document.getElementById('theme-toggle');
    const body = document.body;
    
    // Check for saved theme preference or default to dark
    const savedTheme = localStorage.getItem('theme') || 'dark';
    
    // Apply saved theme
    if (savedTheme === 'light') {
        body.classList.add('light-theme');
        themeToggle.textContent = '🌙 Dark';
    } else {
        themeToggle.textContent = '☀️ Light';
    }
    
    // Toggle theme when button is clicked
    themeToggle.addEventListener('click', function() {
        body.classList.toggle('light-theme');
        
        if (body.classList.contains('light-theme')) {
            themeToggle.textContent = '🌙 Dark';
            localStorage.setItem('theme', 'light');
        } else {
            themeToggle.textContent = '☀️ Light';
            localStorage.setItem('theme', 'dark');
        }
    });
});


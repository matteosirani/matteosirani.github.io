document.addEventListener('DOMContentLoaded', () => {
    const themeToggle = document.getElementById('theme-toggle');

    if (!themeToggle) {
        return;
    }

    const storageKey = 'theme';

    const getStoredTheme = () => {
        try {
            return localStorage.getItem(storageKey);
        } catch {
            return null;
        }
    };

    const setStoredTheme = (theme) => {
        try {
            localStorage.setItem(storageKey, theme);
        } catch {
            // localStorage can be unavailable in restricted browser contexts.
        }
    };

    const applyTheme = (theme) => {
        const isLight = theme === 'light';
        document.body.classList.toggle('light-theme', isLight);
        themeToggle.textContent = isLight ? 'Dark mode' : 'Light mode';
        themeToggle.setAttribute('aria-pressed', String(isLight));
    };

    applyTheme(getStoredTheme() || 'dark');

    themeToggle.addEventListener('click', () => {
        const nextTheme = document.body.classList.contains('light-theme') ? 'dark' : 'light';
        applyTheme(nextTheme);
        setStoredTheme(nextTheme);
    });
});

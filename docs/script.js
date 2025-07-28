tailwind.config = {
    theme: {
        extend: {
            colors: {
                primary: '#02569B',
                secondary: '#FFCA28',
                accent: '#42A5F5',
                darkbg: '#1E1E2E',
            }
        }
    }
}
const mobileMenuButton = document.getElementById('mobileMenuButton');
const mobileMenu = document.getElementById('mobileMenu');

mobileMenuButton.addEventListener('click', () => {
    mobileMenu.classList.toggle('hidden');
});
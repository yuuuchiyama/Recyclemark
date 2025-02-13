const menuIcon = document.getElementById('menu-icon');
const menu = document.getElementById('menu');
const searchContainer = document.getElementById('search-container');
// Toggle menu display
menuIcon.addEventListener('click', function() {
    if (menu.style.display === 'flex') {
        menu.style.display = 'none';
        searchContainer.style.display = 'flex'; // Show search container
    } else {
        menu.style.display = 'flex';
        searchContainer.style.display = 'none'; // Hide search container
    }
});
// Toggle submenu display
function toggleSubMenu(submenuId) {
    const submenu = document.getElementById(submenuId);
    submenu.style.display = submenu.style.display === 'flex' ? 'none' : 'flex';
}

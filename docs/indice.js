function toggleVisibility(id) {
    const element = document.getElementById(id);
    if (element) { // Verifica que el elemento existe antes de intentar modificar su estilo.
        if (element.style.display === 'none') {
            element.style.display = 'block';
        } else {
            element.style.display = 'none';
        }
    } else {
        console.error('No se encontró el elemento con ID:', id);
    }
}

function toggleLinks1() {
  const element = document.getElementById('links1');
  if (element) {
    if (element.style.display === 'none') {
      element.style.display = 'block';
    } else {
      element.style.display = 'none';
    }
  } else {
    console.error('No se encontró el elemento con ID:', 'links1');
  }
}

function toggleLinks2() {
  const element = document.getElementById('links2');
  if (element) {
    if (element.style.display === 'none') {
      element.style.display = 'block';
    } else {
      element.style.display = 'none';
    }
  } else {
    console.error('No se encontró el elemento con ID:', 'links2');
  }
}

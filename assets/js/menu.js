document.querySelector('#mobile-menu').addEventListener('click',  () => {
  const menu = document.querySelector('#mobile-menu-list');

  if(menu.classList.contains('invisible')) {
    menu.classList.add('visible');
    menu.classList.remove('invisible');
  } else {
    menu.classList.remove('visible');
    menu.classList.add('invisible');
  }
});

window.addEventListener('resize', () => {
  if (window.innerWidth >= 768) {
    const menu = document.querySelector('#mobile-menu-list');

    menu.classList.remove('visible');
    menu.classList.add('invisible');
  } 
});

document.addEventListener('DOMContentLoaded', function() {
    const pages = document.querySelectorAll('.nav-button');
  
    // Tambahkan event listener untuk setiap halaman
    pages.forEach(page => {
      page.addEventListener('click', function() {
        // Hapus kelas "active" dari halaman sebelumnya
        const activePage = document.querySelector('.current');
        activePage.classList.remove('current');
  
        // Tambahkan kelas "active" pada halaman yang baru
        this.classList.add('current');
      });
    });
  });
  
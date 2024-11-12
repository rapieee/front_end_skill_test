# web_app_dashboard

A new Flutter project.

## Getting Started

Gambaran umum desain
Login Screen: Menggunakan TextField kustom dan tombol ElevatedButton untuk antarmuka yang sederhana namun fungsional.
Dashboard: Menggunakan ListView untuk menampilkan daftar item yang dapat ditambahkan, dihapus, dan diedit oleh pengguna.
Responsif: Menggunakan MediaQuery untuk mengatur ukuran tampilan, memastikan aplikasi terlihat baik di perangkat desktop maupun mobile.

Pilihan Implementasi
1. Provider: Paket provider dipilih untuk manajemen state karena sederhana, efisien, dan sesuai dengan aplikasi ini. ItemProvider memegang daftar item dan menyediakan metode untuk menambah, menghapus, dan mengedit item.

2. Desain UI: Google Fonts digunakan untuk font yang konsisten dan menarik. Antarmuka menggunakan Material Design dengan komponen standar seperti AppBar, TextField, dan ListView.

3. Dialog Edit: Untuk mengedit item, aplikasi menggunakan dialog modal. Ketika pengguna menekan tombol Edit, sebuah dialog muncul untuk mengedit nama item, lalu perubahan tersebut langsung diterapkan pada daftar item.


# front_end_skill_test
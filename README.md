# To-Do-Mini App

## Deskripsi
Ini adalah aplikasi to-do list sederhana dengan 2 halaman:

1.HomeScreen: untuk menambah, menandai selesai, dan menghapus tugas.
2.DetailScreen: untuk melihat status tugas yang sudah selesai atau belum.

Aplikasi dibuat dengan Flutter dan menggunakan state management Provider supaya data tugas bisa diakses di lebih dari satu halaman.

## WidgetTree

MaterialApp → root aplikasi
Scaffold → kerangka layar (AppBar + body)
AppBar → header halaman
Padding → memberi jarak ke dalam
Column → tata letak vertikal
Row → tata letak horizontal
Expanded → isi sisa ruang
TextField → input teks
IconButton → tombol ikon (tambah, hapus)
SizedBox → memberi spasi antar widget
Expanded → agar ListView bisa mengisi ruang tersisa
ListView.builder → membuat daftar todo
ListTile → 1 baris todo (checkbox + judul + tombol hapus)
Checkbox → menandai todo selesai/belum
GestureDetector → menangkap tap pada judul todo (navigasi ke detail)
Text → menampilkan tulisan
Center → memusatkan konten

## Alasan
Saya pakai Provider dengan ChangeNotifier karena lebih simpel daripada setState. Data todo bisa dipakai di beberapa halaman tanpa ribet, dan kalau ada perubahan, tampilan langsung ikut update otomati, jadi pas banget dipakai di aplikasi sederhana kayak Todo App ini.
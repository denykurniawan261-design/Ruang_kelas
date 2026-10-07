# RuangKelas MySQL

Proyek ini sudah dibuat dengan struktur relasi antar tabel untuk data mahasiswa dan dosen, lalu dihubungkan ke MySQL.

## Struktur relasi
- mahasiswa
- dosen
- matakuliah
- mahasiswa_dosen

Hubungan yang dibuat adalah:
- satu mahasiswa bisa memiliki banyak dosen
- satu dosen bisa membimbing banyak mahasiswa
- satu mahasiswa bisa mengambil banyak mata kuliah
- satu dosen bisa mengampu beberapa mata kuliah

## File penting
- `db/schema.sql` : skrip pembuatan database dan tabel
- `server.js` : server Node.js yang terhubung ke MySQL
- `.env.example` : contoh konfigurasi database
- `package.json` : dependency project

## Persiapan MySQL
1. Pastikan MySQL sudah aktif di komputer Anda.
2. Buat database atau jalankan file SQL:
   ```bash
   mysql -u root -p < db/schema.sql
   ```
3. Salin file `.env.example` menjadi `.env` dan sesuaikan konfigurasi:
   ```bash
   copy .env.example .env
   ```
4. Ubah nilai sesuai server MySQL Anda:
   ```env
   DB_HOST=localhost
   DB_PORT=3306
   DB_USER=root
   DB_PASSWORD=your_password
   DB_NAME=kampus_db
   PORT=3000
   ```

## Menjalankan server
```bash
npm install
npm start
```

Setelah server berjalan, cek endpoint:
- http://localhost:3000/api/health
- http://localhost:3000/api/mahasiswa
- http://localhost:3000/api/dosen

## Endpoint utama
- GET /api/mahasiswa
- GET /api/dosen
- GET /api/mahasiswa/:id/dosen
- GET /api/dosen/:id/mahasiswa
- POST /api/mahasiswa
- POST /api/dosen
- POST /api/mahasiswa/:id/dosen

## Contoh relasi
Contoh data yang sudah dibuat:
- Rina Amelia dibimbing oleh Dr. Siti Rahma dan Budi Santoso
- Dedi Pratama dibimbing oleh Dr. Siti Rahma

Ini menunjukkan koneksi data mahasiswa dan dosen yang tersimpan di MySQL.

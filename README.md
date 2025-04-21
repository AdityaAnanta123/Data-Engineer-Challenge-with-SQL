# Data-Engineer-Challenge-with-SQL

Repositori ini berisi solusi untuk tantangan dasar SQL menggunakan MySQL. Tantangan ini dirancang untuk menguji pemahaman dasar dalam manipulasi data, pembuatan tabel, dan relasi antar tabel dalam konteks dunia nyata.

## 🗂 Struktur Proyek

- **`dqlab_mart.sql`**: Skrip SQL untuk membuat dan mengisi database `dqlab_mart` dengan tabel-tabel berikut:
  - `ms_pelanggan`: Menyimpan data pelanggan.
  - `ms_produk`: Menyimpan data produk.
  - `tr_penjualan`: Menyimpan data transaksi penjualan.
  - `tr_penjualan_detail`: Menyimpan detail dari setiap transaksi penjualan.

- **`DataEngineerWIthSQL.sql`**: Kumpulan query SQL untuk menjawab berbagai pertanyaan analitis berdasarkan data yang tersedia di database `dqlab_mart`.

## 🧩 Fitur

- **Pembuatan Skema Database**: Membuat struktur tabel dengan relasi yang sesuai, termasuk primary key dan foreign key.
- **Pengisian Data**: Menyediakan data contoh untuk setiap tabel guna mensimulasikan skenario bisnis nyata.
- **Query Analitis**: Menjawab pertanyaan-pertanyaan seperti total penjualan per produk, pelanggan dengan pembelian terbanyak, dan analisis lainnya menggunakan SQL.

## 🚀 Cara Menggunakan

1. **Kloning Repositori**:
   ```bash
   git clone https://github.com/AdityaAnanta123/Data-Engineer-Challenge-with-SQL.git
   ```

2. **Impor Database**:
   - Buka MySQL dan jalankan skrip `dqlab_mart.sql` untuk membuat dan mengisi database.
   - Contoh:
     ```sql
     SOURCE path/to/dqlab_mart.sql;
     ```

3. **Jalankan Query Analitis**:
   - Setelah database terisi, jalankan skrip `DataEngineerWIthSQL.sql` untuk melihat hasil dari berbagai query analitis.
  

USE dqlab;

---Menampilkan daftar produk yang memiliki harga antara 50.000 and 150.000---
SELECT 
    no_urut,
    kode_produk,
    nama_produk, 
    harga
FROM   
    ms_produk
WHERE 
    harga BETWEEN 50000 AND 150000;

---Menampilkan semua produk yang mengandung kata Flashdisk---
SELECT
    no_urut,
    kode_produk,
    nama_produk, 
    harga
FROM
    ms_produk
WHERE
    nama_produk LIKE '%Flashdisk%';

---Menampilkan nama-nama pelanggan yang hanya memiliki gelar-gelar berikut: S.H, Ir. dan Drs.---
SELECT
    no_urut,
    kode_pelanggan,
    nama_pelanggan, 
    alamat
FROM
    ms_pelanggan
WHERE
    nama_pelanggan LIKE 'S.H' OR 
    nama_pelanggan LIKE 'Ir.' OR
    nama_pelanggan LIKE 'Drs.';

---Menampilkan nama-nama pelanggan dan urutkan hasilnya berdasarkan kolom nama_pelanggan dari yang terkecil ke yang terbesar (A ke Z)---
SELECT
    nama_pelanggan
FROM
    ms_pelanggan
ORDER BY 
    1 ASC;

---Menampilkan nama-nama pelanggan dan urutkan hasilnya berdasarkan kolom nama_pelanggan dari yang terkecil ke yang terbesar (A ke Z), namun gelar tidak boleh menjadi bagian dari urutan---
SELECT
    nama_pelanggan
FROM
    ms_pelanggan
ORDER BY
    SUBSTRING_INDEX(nama_pelanggan, " ", -1);

---Menampilkan nama pelanggan yang memiliki nama paling panjang---
SELECT
    nama_pelanggan
FROM
    ms_pelanggan
WHERE 
    LENGTH(nama_pelanggan) =
    ( SELECT 
        MAX(LENGTH(nama_pelanggan))
      FROM
        ms_pelanggan
    );
    
---Menampilkan nama orang yang memiliki nama paling panjang (pada row atas), dan nama orang paling pendek (pada row setelahnya). Gelar menjadi bagian dari nama---
( 
SELECT
    nama_pelanggan
FROM
    ms_pelanggan
ORDER BY
    LENGTH(nama_pelanggan) DESC
LIMIT 1
)
UNION
(
    SELECT
    nama_pelanggan
FROM
    ms_pelanggan
ORDER BY
    LENGTH(nama_pelanggan) ASC
LIMIT 1
)

---Menampilkan produk yang paling banyak terjual dari segi kuantitas---
SELECT 
    m.kode_produk, 
    m.nama_produk, 
    SUM(t.qty) AS total_qty 
FROM 
    ms_produk m 
JOIN 
    tr_penjualan_detail t 
USING 
    (kode_produk) 
GROUP BY 
    m.kode_produk, m.nama_produk
HAVING 
    SUM(t.qty) = (
        SELECT MAX(total_qty)
        FROM (
            SELECT 
                SUM(qty) AS total_qty
            FROM 
                tr_penjualan_detail
            GROUP BY 
                kode_produk
        ) AS max_qty
    );

---Menampilkan pelanggan yang paling banyak menghabiskan uangnya untuk belanja---
SELECT 
    m.kode_pelanggan, 
    m.nama_pelanggan, 
    SUM( t.qty * t.harga_satuan) AS total_harga 
FROM 
    ms_pelanggan m 
INNER JOIN 
    tr_penjualan USING (kode_pelanggan) 
INNER JOIN 
    tr_penjualan_detail t USING (kode_transaksi) 
GROUP BY 
    m.kode_pelanggan, 
    m.nama_pelanggan 
ORDER BY 
    total_harga DESC 
LIMIT 1;

---Menampilkan daftar pelanggan yang belum pernah melakukan transaksi---
SELECT 
    kode_pelanggan, 
    nama_pelanggan, 
    alamat 
FROM 
    ms_pelanggan 
WHERE 
    kode_pelanggan NOT IN 
    (
        SELECT 
            kode_pelanggan 
        FROM 
            tr_penjualan
    );

---Menampilkan transaksi-transaksi yang memiliki jumlah item produk lebih dari 1 jenis produk---
SELECT
    t.kode_transaksi, 
    t.kode_pelanggan, 
    m.nama_pelanggan, 
    t.tanggal_transaksi, 
    COUNT(tr.qty) as jumlah_detail 
FROM 
    ms_pelanggan m 
INNER JOIN 
    tr_penjualan t USING (kode_pelanggan) 
INNER JOIN 
    tr_penjualan_detail tr USING (kode_transaksi) 
GROUP BY 
    t.kode_transaksi, 
    t.kode_pelanggan, 
    m.nama_pelanggan, 
    t.tanggal_transaksi 
HAVING 
    jumlah_detail > 1
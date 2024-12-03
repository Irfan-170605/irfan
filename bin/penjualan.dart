import 'dart:io';
import '../lib/produk.dart';
import '../lib/keranjang.dart';
import '../lib/transaksi.dart';
import '../lib/kasir.dart';

void main() {
  // Buat daftar produk
  var produk1 = Produk('Buku', 50000, 10);
  var produk2 = Produk('Pulpen', 5000, 50);
  var produk3 = Produk('Penggaris', 15000, 20);

  var daftarProduk = [produk1, produk2, produk3];

  // Buat keranjang belanja
  var keranjang = Keranjang();

  // Buat kasir
  var kasir = Kasir('Andi');

  while (true) {
    print('\n=== Sistem POS Sederhana ===');
    print('1. Lihat Produk');
    print('2. Tambah Produk ke Keranjang');
    print('3. Hapus Produk dari Keranjang');
    print('4. Lihat Keranjang');
    print('5. Checkout');
    print('6. Laporan Penjualan');
    print('0. Keluar');
    stdout.write('Pilih menu: ');
    var pilihan = stdin.readLineSync();

    if (pilihan == '1') {
      // Tampilkan daftar produk
      print('\nDaftar Produk:');
      for (var i = 0; i < daftarProduk.length; i++) {
        var produk = daftarProduk[i];
        print('${i + 1}. ${produk.nama} - Rp${produk.harga} (Stok: ${produk.stok})');
      }
    } else if (pilihan == '2') {
      // Tambah produk ke keranjang
      print('\nMasukkan nomor produk yang ingin dibeli:');
      for (var i = 0; i < daftarProduk.length; i++) {
        var produk = daftarProduk[i];
        print('${i + 1}. ${produk.nama} - Rp${produk.harga} (Stok: ${produk.stok})');
      }
      stdout.write('Nomor produk: ');
      var nomorProduk = int.tryParse(stdin.readLineSync() ?? '');
      if (nomorProduk == null || nomorProduk < 1 || nomorProduk > daftarProduk.length) {
        print('Nomor produk tidak valid.');
        continue;
      }
      stdout.write('Jumlah: ');
      var jumlah = int.tryParse(stdin.readLineSync() ?? '');
      if (jumlah == null || jumlah <= 0) {
        print('Jumlah tidak valid.');
        continue;
      }
      keranjang.tambahProduk(daftarProduk[nomorProduk - 1], jumlah);
    } else if (pilihan == '3') {
      // Hapus produk dari keranjang
      print('\nMasukkan nama produk yang ingin dihapus:');
      keranjang.tampilkanKeranjang();
      stdout.write('Nama produk: ');
      var namaProduk = stdin.readLineSync();
      keranjang.hapusProduk(namaProduk ?? '');
    } else if (pilihan == '4') {
      // Lihat isi keranjang
      keranjang.tampilkanKeranjang();
    } else if (pilihan == '5') {
      // Checkout
      var totalBelanja = keranjang.hitungTotal();
      var transaksi =
          Transaksi(DateTime.now(), keranjang.items, totalBelanja);
      transaksi.cetakStruk();
      kasir.tambahTransaksi(transaksi);
      keranjang = Keranjang(); // Reset keranjang setelah checkout
    } else if (pilihan == '6') {
      // Lihat laporan penjualan
      kasir.laporanPenjualan();
    } else if (pilihan == '0') {
      print('Terima kasih telah menggunakan sistem POS.');
      break;
    } else {
      print('Pilihan tidak valid.');
    }
  }
}

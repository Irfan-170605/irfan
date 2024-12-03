import 'transaksi.dart';

class Kasir {
  String nama;
  List<Transaksi> daftarTransaksi = [];

  Kasir(this.nama);

  void tambahTransaksi(Transaksi transaksi) {
    daftarTransaksi.add(transaksi);
  }

  void laporanPenjualan() {
    print('\n=== Laporan Penjualan ===');
    for (var transaksi in daftarTransaksi) {
      print('Tanggal: ${transaksi.tanggal}, Total: ${transaksi.total}');
    }
    print('=========================\n');
  }
}

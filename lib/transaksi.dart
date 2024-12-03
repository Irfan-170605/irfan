

class Transaksi {
  DateTime tanggal;
  List<Map<String, dynamic>> items;
  double total;

  Transaksi(this.tanggal, this.items, this.total);

  void cetakStruk() {
    print('\n=== Struk Belanja ===');
    print('Tanggal: $tanggal');
    for (var item in items) {
      print(
          '${item['produk'].nama} x${item['jumlah']} = ${item['produk'].harga * item['jumlah']}');
    }
    print('Total Belanja: $total');
    print('=====================\n');
  }
}

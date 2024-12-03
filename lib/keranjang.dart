import 'produk.dart';

class Keranjang {
  List<Map<String, dynamic>> _items = [];

  void tambahProduk(Produk produk, int jumlah) {
    if (produk.stok >= jumlah) {
      _items.add({'produk': produk, 'jumlah': jumlah});
      produk.stok -= jumlah; // Kurangi stok produk
    } else {
      print('Stok tidak mencukupi untuk produk ${produk.nama}');
    }
  }

  void hapusProduk(String namaProduk) {
    _items.removeWhere((item) => item['produk'].nama == namaProduk);
    print('$namaProduk telah dihapus dari keranjang.');
  }

  double hitungTotal() {
    return _items.fold(0, (total, item) {
      return total + (item['produk'].harga * item['jumlah']);
    });
  }

  void tampilkanKeranjang() {
    print('Isi Keranjang:');
    for (var item in _items) {
      print(
          '${item['produk'].nama} x${item['jumlah']} = ${item['produk'].harga * item['jumlah']}');
    }
  }

  List<Map<String, dynamic>> get items => _items;
}

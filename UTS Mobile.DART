import 'dart:math'; //impor library untuk funsi random

abstract class Transportasi{
  String nama; //atribut nama transportasi
  double tarif; // atribut tarif dasar
  Transportasi(this.nama, this.tarif); // konstruktor
  double hitung(int jp); // menghitung total biaya
} 

class Taksi extends Transportasi { // TURUNAN KELAS TRANSPORTASI
  double jarak; // jarak yang ditempuh
  Taksi(super.nama, super.tarif, this.jarak); // konstruktor
  @override
  double hitung(int jp) => tarif*jarak; // perhitungan biaya taksi
}

class Bus extends Transportasi { // TURUNAN KELAS TRANSPORTASI
  bool wifi;
  Bus(super.nama, super.tarif, this.wifi); // konstruktor
  @override
  double hitung(int jp) => tarif*jp + (wifi ? 5000 : 0); // tambahan biaya wifi
}

class Pesawat extends Transportasi {
  String kelas; // jenis kelas penerbangan
  Pesawat(super.nama, super.tarif, this.kelas); // konstruktor
  @override
  double hitung(int jp) => tarif*jp * (kelas == 'Bisnis' ? 1.5 : 1.0); // jika menggunakakn kelas bisnis maka sedikit lebih mahal
}

void main() { // daftar penumpang beserta jenis transportasi
  var list =[
    {'t': Taksi('Taksi', 5000, 15), 'n': 'Nabila','jp': 2}, //nama penumpang nabila
    {'t': Bus('Bus', 4000, true), 'n': 'Dita','jp':5}, // pemesan Bus
    {'t': Pesawat('Pesawat', 800000, 'Bisnis'), 'n': 'Diva', 'jp': 1}, // pemesan pesawat
  ];

  for (var d in list) { // perulangan untuk menampilkan hasil tiap penumpang
    var t= d['t'] as Transportasi; // objek transportasi
    var jp= d['jp'] as int; // jumlah perjalanan
    var total= t.hitung(jp); // hitung total biaya
    print('${d['n']} naik ${t.nama}: Rp${total.toStringAsFixed(0)} (ID-${Random().nextInt(999)})');
  }
}

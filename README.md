# Inventoreal (Mobile version)
## Tugas 7
### Membuat sebuah program Flutter baru dengan tema inventory
1. Buka _command prompt_ dan pindah ke folder tempat menyimpan aplikasi, kemudian generate proyek flutter dengan perintah `flutter create inventoreal_mobile` dan masuk ke folder itu

2. Buka folder `inventoreal_mobile/lib` dan tambahkan file `menu.dart`.

3. Pada line awal `menu.dart`, tambahkan `import 'package:flutter/material.dart';` dan pindahkan _class_ berikut yang ada di file `main.dart` ke dalam file `menu.dart`
``` dart
class MyHomePage ... {
    ...
}

class _MyHomePageState ... {
    ...
}
```

4. Pada file `main.dart`, tambahkan 1 kode baris yang akan meng-import function di `menu.dart`, yaitu `import 'package:inventoreal_mobile/menu.dart';` agar tidak terjadi error

### Membuat tiga tombol sederhana dengan ikon dan teks dan memunculkan Snackbar ketika ditekan tombolnya
1. Pada file `main.dart`, hapus MyHomePage(title: 'Flutter Demo Home Page') menjadi `home: MyHomePage()`

2. Lakukan perubahan pada `menu.dart` di `class MyHomePage()` dari stateful menjadi stateless, dan ubah kontennya menjadi seperti ini.
```dart
class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            ...
        );
    }
}
```
> [!NOTE]
> Jangan lupa untuk hapus fungsi State yang ada dibawah bagian stateless widget ini.


3. Tambahkan _class_ berikut untuk atribut di aplikasi kita
```dart
class InventoryItem {
  final String name;    //Untuk define nama fitur
  final IconData icon;  //Untuk define icon 
  final Color color;    //Untuk define warna tombol masing-masing
  InventoryItem(this.name, this.icon, this.color);
}
```

4. Di file `menu.dart` pada `class MyHomePage extends StatelessWidget`, di bawah kode `MyHomePage({Key? key}) : super(key: key);`, tambahkan kode berikut untuk mendefinisikan setiap tombol yang ditambahkan
```dart
...
final List<InventoryItem> items = [
    InventoryItem("Lihat Item", Icons.checklist, Colors.green),
    InventoryItem("Tambah Item", Icons.add_shopping_cart, Colors.blue),
    InventoryItem("Logout", Icons.logout, Colors.purple),
  ];
...
```

5. Dalam _class_ yang sama, ganti _function_ `Widget build` menjadi berikut
```dart
...
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'InventoReal',
          style: TextStyle(color: Color.fromARGB(255, 95, 196, 95)),
        ),
      ),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Main Menu', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((InventoryItem item) {
                  // Iterasi untuk setiap item
                  return InventoryCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
...
```

6. Tambahkan _function_ baru untuk mendefinisikan tombol/card yang kita tambahkan
```dart
class InventoryCard extends StatelessWidget {
  final InventoryItem item;

  const InventoryCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

### Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
Stateless widget dalam Flutter adalah komponen UI yang tidak berubah setelah dibuat; mereka tidak mempertahankan state. Sebagai contoh, ikon atau teks yang tidak perlu diperbarui berdasarkan interaksi pengguna adalah stateless. Di sisi lain, stateful widget dirancang untuk merespons perubahan—seperti input pengguna atau data internal—dan mempertahankan state tersebut sepanjang waktu hidup mereka. Ini membuat stateful widget cocok untuk elemen interaktif seperti form atau game. Sementara stateless widget umumnya lebih ringan dan cepat, stateful widget menyediakan fleksibilitas yang diperlukan untuk UI dinamis yang membutuhkan pembaruan. Memilih antara keduanya tergantung pada apakah UI membutuhkan kemampuan untuk berubah setelah dibangun.

### Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing
- MaterialApp: Widget yang membungkus sejumlah widget yang memungkinkan pengembangan aplikasi material design. Ini adalah widget root untuk aplikasi

- ThemeData: Widget yang digunakan untuk mengatur tema global aplikasi, yang memberi pengaruh pada tampilan visual dari banyak widget material lainnya

- ColorScheme: Digunakan dalam ThemeData untuk mendefinisikan skema warna untuk tema aplikasi

- Colors: Kelas ini menyediakan konstanta warna yang biasa digunakan

- MyApp: Widget stateless yang dibuat untuk menjadi widget root aplikasi yang berfungsi sebagai kontainer untuk MaterialApp

- Scaffold: Ini menyediakan kerangka dasar aplikasi Material, yang meliputi struktur dan layout untuk banyak komponen UI seperti AppBar, Body, dan FloatingActionButton

- AppBar: Ini memberikan area di bagian atas aplikasi yang biasanya menampilkan judul, tombol aksi, atau tombol navigasi

- Text: Widget ini menampilkan string teks dengan berbagai styling

- SingleChildScrollView: Digunakan untuk membuat konten yang bisa discroll ketika konten tersebut lebih besar dari ruang layar yang tersedia

- Padding: Ini menambahkan ruang kosong di sekitar child widgetnya, yaitu memberikan padding pada konten

- Column: Widget ini menata child widgetnya secara vertikal

- GridView: Grid yang menampilkan widget-widget children dalam format grid. Di sini digunakan GridView.count untuk menentukan jumlah kolom (cross-axis)

- Material: Ini adalah konsep Material Design. Widget ini memberikan efek visual pada child widgetnya, seperti ink splash yang terlihat saat menekan InkWell

- InkWell: Widget yang memberikan efek visual saat di-tap dan bisa menghandle gestur tap

- Container: Menyediakan kotak untuk menempatkan child widget dengan kemampuan untuk memberikan styling, seperti padding dan margin

- Icon: Menampilkan ikon dari set yang diberikan oleh Flutter, seperti yang ditemukan di Icons class

- Center: Widget ini menengahkan child widgetnya di dalam dirinya sendiri

- ScaffoldMessenger: Digunakan untuk menampilkan SnackBar, yaitu pesan singkat yang muncul di bagian bawah layar

- SnackBar: Pesan singkat yang ditampilkan di bagian bawah layar, biasanya digunakan untuk feedback ringkas

- InventoryCard: Widget buatan sendiri yang menggunakan beberapa widget di atas untuk menampilkan informasi tentang item inventori dalam bentuk card

## Tugas 8
### Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru dengan ketentuan sebagai berikut:
Memakai minimal tiga elemen input, yaitu name, amount, description. Tambahkan elemen input sesuai dengan model pada aplikasi tugas Django yang telah kamu buat.
Memiliki sebuah tombol Save.
Setiap elemen input di formulir juga harus divalidasi dengan ketentuan sebagai berikut:
Setiap elemen input tidak boleh kosong.
Setiap elemen input harus berisi data dengan tipe data atribut modelnya.
Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.
Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.
Membuat sebuah drawer pada aplikasi dengan ketentuan sebagai berikut:
Drawer minimal memiliki dua buah opsi, yaitu Halaman Utama dan Tambah Item.
Ketika memiih opsi Halaman Utama, maka aplikasi akan mengarahkan pengguna ke halaman utama.
Ketika memiih opsi (Tambah Item), maka aplikasi akan mengarahkan pengguna ke halaman form tambah item baru.

Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
Bagaimana penerapan clean architecture pada aplikasi Flutter?
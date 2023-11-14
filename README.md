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
### Membuat Halaman Formulir Tambah Item Baru
1. Buat sebuah file baru dengan nama "inventoreal_form.dart" dalam proyek Flutter dan tambahkan import untuk material.dart dan left_drawer.dart ke dalam berkas "inventoreal_form.dart".

2. Buat widget "ItemFormPage" sebagai StatefulWidget dengan sebuah form. Gunakan widget Scaffold dan tambahkan app bar dengan judul `"Add Your Item here"`. Atur warna latar belakang dan warna teks sesuai preferensi.

```dart
import 'package:flutter/material.dart';
import 'left_drawer.dart'; // Import left_drawer.dart

class ItemFormPage extends StatefulWidget {
  const ItemFormPage({super.key});

  @override
  State<ItemFormPage> createState() => _ItemFormPageState();
}

class _ItemFormPageState extends State<ItemFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Your Item here',
        ),
        backgroundColor: Colors.black,
        foregroundColor: const Color.fromARGB(255, 67, 179, 70),
      ),
      body: Form(
        // ... Isi formulir di sini
      ),
    );
  }
}
```

3. Di dalam formulir, tambahkan elemen input seperti `Name`, `Category`, `Amount`, `Price`, dan `Description`. Gunakan TextFormField dan atur tampilan dekorasi sesuai preferensi Anda. Tambahkan validasi input untuk setiap elemen input. Pastikan input tidak boleh kosong, dan sesuai dengan jenis data yang diharapkan.
```dart
...
body: Form(
key: _formKey,
child: SingleChildScrollView(
child:
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: "Name",
        labelText: "Item Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      onChanged: (String? value) {
        setState(() {
          _name = value!;
        });
      },
      onSaved: (String? value) {
        setState(() {
          // Menambahkan variabel yang sesuai
          _name = value!;
        });
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Name cannot be empty!";
        }
        return null;
      },
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: "Category",
        labelText: "Category",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      onChanged: (String? value) {
        setState(() {
          _category = value!;
        });
      },
      onSaved: (String? value) {
        setState(() {
          // Menambahkan variabel yang sesuai
          _category = value!;
        });
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Category cannot be empty!";
        }
        return null;
      },
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: "Amount",
        labelText: "Amount",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      onChanged: (String? value) {
        setState(() {
          _amount = int.parse(value!);
        });
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Amount cannot be empty!";
        }
        if (int.tryParse(value) == null) {
          return "Amount must be a valid integer!";
        }
        return null;
      },
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: "Price",
        labelText: "Price",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      onChanged: (String? value) {
        setState(() {
          _price = int.parse(value!);
        });
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Price cannot be empty!";
        }
        if (int.tryParse(value) == null) {
          return "Price must be a valid integer!";
        }
        return null;
      },
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: "Description",
        labelText: "Description",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      onChanged: (String? value) {
        setState(() {
          // Menambahkan variabel yang sesuai
          _description = value!;
        });
      },
      onSaved: (String? value) {
        setState(() {
          // Menambahkan variabel yang sesuai
          _description = value!;
        });
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Description cannot be empty!";
        }
        return null;
      },
    ),
  ),
...
```

4. Tambahkan tombol "Save" di bagian bawah halaman formulir serta pop-up konfirmasi setelah tombol "Save" ditekan yang berisi item apa yang ditambahkan.
```dart
Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 67, 179, 70)),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            items.add(Item(
              name: _name,
              category: _category,
              amount: _amount,
              price: _price,
              description: _description,
            ));
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Item saved successfully'),
                  content: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Memunculkan value-value lainnya
                        Text('Name: $_name'),
                        Text('Category: $_category'),
                        Text('Amount: $_amount'),
                        Text('Price: $_price'),
                        Text('Description: $_description')
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
            _formKey.currentState!.reset();
          }
        },
        child: const Text(
          "Save",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  ),
...
```

### Membuat Drawer Menu
1. Buat widget drawer dalam sebuah folder terpisah bernama `widgets` dan file dengan nama `left_drawer.dart` Drawer ini akan berisi opsi menu navigasi. Jangan lupa untuk `import package material.dart` dalam berkasnya

2. Buat widget "LeftDrawer" yang merupakan StatelessWidget dengan drawer sebagai kontennya. Gunakan ListView untuk menampilkan opsi menu.
```dart
import 'package:flutter/material.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // ... Isi opsi menu di sini
        ],
      ),
    );
  }
}
```

3. Tambahkan opsi menu pada drawer, seperti "Halaman Utama" dan "Tambah Produk." Gunakan ListTile dan ikon yang sesuai. Di dalam onTap setiap opsi menu, gunakan Navigator.pushReplacement() untuk melakukan navigasi ke halaman yang sesuai.
```dart
...
ListTile(
  leading: const Icon(Icons.home_outlined),
  title: const Text('Home'),
  // Bagian redirection ke MyHomePage
  onTap: () {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ));
  },
),
ListTile(
  leading: const Icon(Icons.checklist),
  title: const Text('Show Items'),
  // Bagian redirection ke ShopFormPage
  onTap: () {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ItemsPage(),
        ));
  },
),
ListTile(
  leading: const Icon(Icons.add_shopping_cart),
  title: const Text('Add Items'),
  // Bagian redirection ke ShopFormPage
  onTap: () {
    /*
    Routing ke ShopFormPage di sini, setelah halaman ShopFormPage sudah dibuat.
    */
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const ItemFormPage()));
  },
),
...
```

### Menggunakan Drawer pada Halaman Utama dan Halaman Formulir
1. Di halaman utama, tambahkan widget LeftDrawer ke dalam widget Scaffold. Ini akan menampilkan drawer menu di halaman utama.
```dart
return Scaffold(
  appBar: AppBar(
    centerTitle: false,
    title: const Text(
      'InventoReal',
    ),
    backgroundColor: Colors.black,
    foregroundColor: const Color.fromARGB(255, 67, 179, 70),
  ),
  drawer: const LeftDrawer(), // Tambahkan drawer ke halaman utama
  // ... Konten halaman utama
);
```

2. Di halaman formulir, juga tambahkan widget LeftDrawer ke dalam widget Scaffold. Ini akan menampilkan drawer menu di halaman formulir.
```dart
return Scaffold(
  appBar: AppBar(
    title: const Text(
      'Add Your Item here',
    ),
    backgroundColor: Colors.black,
    foregroundColor: const Color.fromARGB(255, 67, 179, 70),
  ),

  // Menambahkan drawer yang sudah dibuat di sini
  drawer: const LeftDrawer(), // Tambahkan drawer ke halaman formulir
  // ... Konten halaman formulir
);
```

> [!NOTE]
> Setelah menjalankan seluruh langkah diatas, saya melakukan refactor pada struktur penyimpanan file sehingga menjadi lebih rapi.

### Perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()`
`Navigator.push()` dan `Navigator.pushReplacement()` adalah dua metode yang digunakan dalam Flutter untuk mengelola navigasi antar halaman dalam aplikasi. `Navigator.push()` digunakan untuk menambahkan halaman baru ke tumpukan navigasi (navigation stack) yang akan menambahkan halaman baru di atas halaman saat ini dalam tumpukan navigasi, sehingga pengguna dapat kembali ke halaman sebelumnya dengan menekan tombol "Kembali" pada perangkat mereka. Hal ini berguna ketika ingin menambahkan halaman baru dan memungkinkan pengguna untuk kembali ke halaman sebelumnya. Contoh penggunaannya adalah seperti di bawah ini. 
```dart
// Navigasi dari halaman saat ini ke halaman baru
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => NewPage()),
);
```

Berbeda dengan `Navigator.pushReplacement()` yang digunakan untuk menambahkan halaman baru ke tumpukan navigasi, tetapi dengan perbedaan bahwa itu menggantikan halaman saat ini dalam tumpukan navigasi. Ini berarti bahwa ketika kita menggunakan `pushReplacement()`, pengguna tidak dapat kembali ke halaman sebelumnya dengan menekan tombol "Kembali" karena halaman saat ini digantikan oleh halaman baru. Ini berguna ketika ingin menggantikan halaman saat ini dengan halaman baru, misalnya ketika pengguna berhasil login dan ingin beralih dari halaman login ke halaman beranda. Berikut contoh penggunaan dari `Navigator.pushReplacement()`:
```dart
// Menggantikan halaman saat ini dengan halaman baru
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => HomeScreen()),
);
```

> [!NOTE]
> Dalam kedua contoh di atas, `context` adalah objek BuildContext yang diperlukan untuk mengakses Navigator, dan `MaterialPageRoute` adalah salah satu dari banyak jenis rute yang dapat digunakan dalam Flutter untuk menggambarkan bagaimana halaman baru akan ditampilkan. Developer dapat mengganti `NewPage()` atau `HomeScreen()` dengan halaman-halaman yang sesuai dalam aplikasi.

### Layout widget pada Flutter
Berikut adalah beberapa layout widget pada Flutter dan konteks penggunaannya:

1. `Container`: Membungkus widget lain, mengatur padding, margin, dan dekorasi, dan mengendalikan tata letak kontennya.

2. `Row`: Mengatur widget horizontal dalam baris.

3. `Column`: Mengatur widget vertikal dalam kolom.

4. `ListView`: Membungkus daftar panjang atau berpotensi panjang dari widget.

5. `Expanded`: Mengisi ruang yang tersedia dalam `Row` atau `Column` sesuai dengan proporsi yang ditentukan.

6. `Stack`: Menempatkan widget di atas satu sama lain dengan kontrol posisi yang tepat.

7. `Card`: Menggambarkan kartu yang memiliki penampilan khusus dengan bayangan dan elemen-elemen dalamnya.

8. `SizedBox`: Mengatur ukuran widget yang berisi widget anaknya.

9. `Wrap`: Mengatur widget dalam baris dan kolom yang dapat berubah berdasarkan kebutuhan tanpa menghasilkan tampilan overflow.

10. `Flow`: Mengatur widget dalam tata letak berbasis aliran yang dapat mengatur widget dalam satu atau beberapa arah.

11. `IntrinsicHeight`: Memastikan bahwa widget anak dalam `Column` memiliki tinggi yang seragam.

12. `GridView`: Mengatur widget dalam grid, baik vertikal atau horizontal.

13. `CustomMultiChildLayout`: Mengizinkan pengaturan tata letak yang sangat kustom untuk widget anaknya.

14. `SingleChildScrollView`: Membungkus widget anak dalam scrollbar ketika konten dapat mengisi lebih dari satu layar.

15. `ListBody`: Mengatur widget anak dalam tata letak tubuh daftar yang dapat diatur sesuai kebutuhan.

16. `Table`: Mengatur widget dalam tabel berbasis sel yang dapat mengatur widget dalam baris dan kolom.

17. `Flow`: Mengatur widget dalam tata letak berbasis aliran yang dapat mengatur widget dalam satu atau beberapa arah.

### Elemen Input pada Form yang Digunakan dan Alasannya
Saya menggunakan `TextFormField` dengan _input validation_ untuk menerima input teks seperti nama produk, kategori produk, jumlah, harga, dan deskripsi. Khusus untuk jumlah dam harga, saya lakukan validasi dengan percobaan parse menjadi `int`.

### Penerapan _Clean Architecture_ pada aplikasi Flutter
Penerapan Clean Architecture pada aplikasi Flutter melibatkan pengaturan kode ke dalam beberapa lapisan terpisah untuk memastikan struktur yang rapi, kemudahan dalam pengujian, dan manajemen yang lebih efisien. Di inti dari arsitektur ini adalah Lapisan Domain, yang berisi logika bisnis utama dan entitas aplikasi. Lapisan ini independen dari detail implementasi teknologi, seperti Flutter atau database. Selanjutnya, ada Lapisan Use Cases atau Aplikasi, yang bertanggung jawab atas logika aplikasi yang lebih spesifik dan sering menangani input pengguna. Lapisan ini menggunakan model dan interaktor dari Lapisan Domain dan berfungsi sebagai penghubung antara Domain dan Presentasi. Lapisan Interface, sebagai berikutnya, merupakan kontrak antara Presentasi dan Aplikasi/Domain, berisi antarmuka yang diperlukan oleh lapisan Presentasi untuk berinteraksi dengan aplikasi. Akhirnya, Lapisan Presentasi adalah tempat di mana tampilan, antarmuka pengguna, dan interaksi pengguna dikembangkan. Menggunakan Flutter, lapisan ini fokus pada aspek visual dan interaksi tanpa mengandung logika bisnis. Struktur ini memungkinkan setiap bagian aplikasi untuk dikembangkan dan diuji secara mandiri, memudahkan pemeliharaan dan skalabilitas dalam jangka panjang.
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Katalog Produk',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController _nameController = TextEditingController();
  String _userName = 'Pengguna';

  void _showLoginDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Login / Ubah Nama'),
          content: TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Nama Lengkap',
              hintText: 'Masukkan nama Anda',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.trim().isNotEmpty) {
                  setState(() {
                    _userName = _nameController.text.trim();
                  });
                }
                Navigator.pop(context);
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            tooltip: 'Ganti Nama',
            onPressed: _showLoginDialog,
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.shopping_bag_rounded,
                  size: 70,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Selamat Datang di KatalogStore',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Halo, $_userName! Silakan masuk untuk melihat daftar produk menarik kami.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              const SizedBox(height: 36),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainNavigationScreen(userName: _userName),
                      ),
                    );
                  },
                  icon: const Icon(Icons.storefront),
                  label: const Text(
                    'Masuk ke Aplikasi',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  final String userName;

  const MainNavigationScreen({super.key, required this.userName});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> products = [
    {
      'id': 1,
      'nama': 'Sepatu Sneaker Casual',
      'harga': 'Rp 350.000',
      'hargaAngka': 350000,
      'hargaAsli': 'Rp 500.000',
      'diskon': '30%',
      'rating': 4.8,
      'deskripsi': 'Sepatu sneaker kekinian dengan bahan katun berkualitas tinggi. Sangat nyaman untuk jalan-jalan harian.',
      'icon': Icons.roller_skating,
      'color': Colors.orangeAccent,
      'isFavorite': false,
    },
    {
      'id': 2,
      'nama': 'Jam Tangan Digital',
      'harga': 'Rp 250.000',
      'hargaAngka': 250000,
      'hargaAsli': null,
      'diskon': null,
      'rating': 4.7,
      'deskripsi': 'Jam tangan sporty anti air hingga kedalaman 50 meter. Memiliki fitur alarm dan stopwatch.',
      'icon': Icons.watch,
      'color': Colors.blueAccent,
      'isFavorite': false,
    },
    {
      'id': 3,
      'nama': 'Headphone Wireless',
      'harga': 'Rp 350.000',
      'hargaAngka': 350000,
      'hargaAsli': 'Rp 500.000',
      'diskon': '30%',
      'rating': 4.9,
      'deskripsi': 'Headphone Bluetooth dengan fitur Active Noise Cancellation dan baterai tahan hingga 20 jam.',
      'icon': Icons.headset,
      'color': Colors.purpleAccent,
      'isFavorite': false,
    },
    {
      'id': 4,
      'nama': 'Ransel Laptop Premium',
      'harga': 'Rp 299.000',
      'hargaAngka': 299000,
      'hargaAsli': null,
      'diskon': null,
      'rating': 4.6,
      'deskripsi': 'Tas ransel berkapasitas besar dilengkapi slot laptop 15.6 inch dan port USB charging.',
      'icon': Icons.backpack,
      'color': Colors.green,
      'isFavorite': false,
    },
    {
      'id': 5,
      'nama': 'Kacamata Anti Radiasi',
      'harga': 'Rp 60.000',
      'hargaAngka': 60000,
      'hargaAsli': 'Rp 120.000',
      'diskon': '50%',
      'rating': 4.5,
      'deskripsi': 'Kacamata melindung mata dari radiasi sinar biru layar HP dan laptop.',
      'icon': Icons.visibility,
      'color': Colors.redAccent,
      'isFavorite': false,
    },
    {
      'id': 6,
      'nama': 'Jaket Hoodie Polos',
      'harga': 'Rp 180.000',
      'hargaAngka': 180000,
      'hargaAsli': null,
      'diskon': null,
      'rating': 4.8,
      'deskripsi': 'Hoodie bahan fleece hangat dan lembut. Cocok digunakan saat cuaca dingin.',
      'icon': Icons.checkroom,
      'color': Colors.teal,
      'isFavorite': false,
    },
  ];

  final List<Map<String, dynamic>> myOrders = [];

  void _toggleFavorite(int index) {
    setState(() {
      products[index]['isFavorite'] = !(products[index]['isFavorite'] as bool);
    });
  }

  void _addOrder(Map<String, dynamic> newOrder) {
    setState(() {
      myOrders.insert(0, newOrder);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      KatalogProdukScreen(
        userName: widget.userName,
        products: products,
        onToggleFavorite: _toggleFavorite,
        onAddOrder: _addOrder,
      ),
      ProfilScreen(
        userName: widget.userName,
        products: products,
        myOrders: myOrders,
        onToggleFavorite: _toggleFavorite,
      ),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Theme.of(context).colorScheme.primary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_rounded),
            label: 'Katalog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class KatalogProdukScreen extends StatelessWidget {
  final String userName;
  final List<Map<String, dynamic>> products;
  final Function(int) onToggleFavorite;
  final Function(Map<String, dynamic>) onAddOrder;

  const KatalogProdukScreen({
    super.key,
    required this.userName,
    required this.products,
    required this.onToggleFavorite,
    required this.onAddOrder,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Halo $userName, selamat berbelanja! 👋',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.72,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final item = products[index];
                  final hasDiscount = item['diskon'] != null;
                  final isFav = item['isFavorite'] == true;

                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailProdukScreen(
                              product: item,
                              onToggleFavorite: () => onToggleFavorite(index),
                              onAddOrder: onAddOrder,
                            ),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: item['color'].withOpacity(0.2),
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(12),
                                    ),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      item['icon'],
                                      size: 50,
                                      color: item['color'],
                                    ),
                                  ),
                                ),
                                if (hasDiscount)
                                  Positioned(
                                    top: 8,
                                    left: 8,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        'DISKON ${item['diskon']}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                Positioned(
                                  top: 4,
                                  right: 4,
                                  child: IconButton(
                                    icon: Icon(
                                      isFav ? Icons.favorite : Icons.favorite_border,
                                      color: isFav ? Colors.red : Colors.grey,
                                    ),
                                    onPressed: () => onToggleFavorite(index),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['nama'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text(
                                      item['harga'],
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.primary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                    if (hasDiscount) ...[
                                      const SizedBox(width: 4),
                                      Text(
                                        item['hargaAsli'],
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 10,
                                          decoration: TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.star, size: 14, color: Colors.amber),
                                        const SizedBox(width: 2),
                                        Text(
                                          '${item['rating']}',
                                          style: const TextStyle(fontSize: 11),
                                        ),
                                      ],
                                    ),
                                    CircleAvatar(
                                      radius: 12,
                                      backgroundColor: Theme.of(context).colorScheme.primary,
                                      child: const Icon(Icons.add, size: 14, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailProdukScreen extends StatefulWidget {
  final Map<String, dynamic> product;
  final VoidCallback onToggleFavorite;
  final Function(Map<String, dynamic>) onAddOrder;

  const DetailProdukScreen({
    super.key,
    required this.product,
    required this.onToggleFavorite,
    required this.onAddOrder,
  });

  @override
  State<DetailProdukScreen> createState() => _DetailProdukScreenState();
}

class _DetailProdukScreenState extends State<DetailProdukScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final hasDiscount = widget.product['diskon'] != null;
    final isFav = widget.product['isFavorite'] == true;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product['nama']),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        actions: [
          IconButton(
            icon: Icon(
              isFav ? Icons.favorite : Icons.favorite_border,
              color: isFav ? Colors.red : null,
            ),
            onPressed: () {
              setState(() {
                widget.onToggleFavorite();
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 250,
                    color: widget.product['color'].withOpacity(0.2),
                    child: Center(
                      child: Icon(
                        widget.product['icon'],
                        size: 120,
                        color: widget.product['color'],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (hasDiscount) ...[
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              'PROMO HEMAT ${widget.product['diskon']}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                        Text(
                          widget.product['nama'],
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              widget.product['harga'],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            if (hasDiscount) ...[
                              const SizedBox(width: 8),
                              Text(
                                widget.product['hargaAsli'],
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                            const Spacer(),
                            const Icon(Icons.star, color: Colors.amber, size: 20),
                            const SizedBox(width: 4),
                            Text(
                              '${widget.product['rating']}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Divider(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Jumlah Pembelian',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: quantity > 1
                                      ? () => setState(() => quantity--)
                                      : null,
                                  icon: const Icon(Icons.remove_circle_outline),
                                ),
                                Text(
                                  '$quantity',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () => setState(() => quantity++),
                                  icon: const Icon(Icons.add_circle_outline),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Divider(height: 32),
                        const Text(
                          'Deskripsi Produk',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.product['deskripsi'],
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[800],
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CheckoutScreen(
                            product: widget.product,
                            quantity: quantity,
                            onAddOrder: widget.onAddOrder,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Beli Sekarang ($quantity Barang)',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CheckoutScreen extends StatefulWidget {
  final Map<String, dynamic> product;
  final int quantity;
  final Function(Map<String, dynamic>) onAddOrder;

  const CheckoutScreen({
    super.key,
    required this.product,
    required this.quantity,
    required this.onAddOrder,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final List<Map<String, dynamic>> vouchers = [
    {
      'kode': 'HEMAT10K',
      'nama': 'Diskon Potongan Rp 10.000',
      'potongan': 10000,
    },
    {
      'kode': 'DISCOUNT20',
      'nama': 'Diskon 20% All Item',
      'potonganPersen': 0.20,
    },
    {
      'kode': 'GRATISONGKIR',
      'nama': 'Gratis Ongkir Rp 15.000',
      'potonganOngkir': 15000,
    },
  ];

  Map<String, dynamic>? selectedVoucher;
  String selectedPayment = 'Transfer Bank (BCA)';
  int ongkir = 15000;

  void _showVoucherBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Pilih Voucher Diskon',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: vouchers.length,
                  itemBuilder: (context, index) {
                    final voucher = vouchers[index];
                    final isSelected = selectedVoucher?['kode'] == voucher['kode'];
                    return Card(
                      color: isSelected ? Colors.blue.shade50 : null,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: isSelected ? Colors.blue : Colors.grey.shade300,
                        ),
                      ),
                      child: ListTile(
                        leading: const Icon(Icons.confirmation_number, color: Colors.orange),
                        title: Text(
                          voucher['kode'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(voucher['nama']),
                        trailing: isSelected
                            ? const Icon(Icons.check_circle, color: Colors.blue)
                            : ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    selectedVoucher = voucher;
                                  });
                                  Navigator.pop(context);
                                },
                                child: const Text('Gunakan'),
                              ),
                        onTap: () {
                          setState(() {
                            selectedVoucher = voucher;
                          });
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  int _calculateDiscount(int subtotal) {
    if (selectedVoucher == null) return 0;
    if (selectedVoucher!['potongan'] != null) {
      return selectedVoucher!['potongan'] as int;
    }
    if (selectedVoucher!['potonganPersen'] != null) {
      return (subtotal * (selectedVoucher!['potonganPersen'] as double)).round();
    }
    if (selectedVoucher!['potonganOngkir'] != null) {
      return selectedVoucher!['potonganOngkir'] as int;
    }
    return 0;
  }

  String _formatRupiah(int number) {
    return 'Rp ${number.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}';
  }

  @override
  Widget build(BuildContext context) {
    int hargaSatuan = widget.product['hargaAngka'] ?? 100000;
    int subtotal = hargaSatuan * widget.quantity;
    int diskon = _calculateDiscount(subtotal);
    int totalPembayaran = (subtotal + ongkir - diskon);
    if (totalPembayaran < 0) totalPembayaran = 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout Pesanan'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Produk yang Dibeli',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: widget.product['color'].withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(widget.product['icon'], color: widget.product['color']),
                ),
                title: Text(
                  widget.product['nama'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('${widget.product['harga']} x ${widget.quantity}'),
                trailing: Text('x${widget.quantity}'),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Voucher Diskon',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                leading: const Icon(Icons.card_giftcard, color: Colors.redAccent),
                title: Text(
                  selectedVoucher != null
                      ? 'Voucher: ${selectedVoucher!['kode']}'
                      : 'Pilih / Masukkan Voucher',
                  style: TextStyle(
                    fontWeight: selectedVoucher != null ? FontWeight.bold : FontWeight.normal,
                    color: selectedVoucher != null ? Colors.green : Colors.black,
                  ),
                ),
                subtitle: Text(
                  selectedVoucher != null
                      ? selectedVoucher!['nama']
                      : 'Hemat hingga puluhan ribu rupiah',
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: _showVoucherBottomSheet,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Metode Pembayaran',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedPayment,
                    isExpanded: true,
                    items: const [
                      DropdownMenuItem(
                        value: 'Transfer Bank (BCA)',
                        child: Text('Transfer Bank (BCA)'),
                      ),
                      DropdownMenuItem(
                        value: 'E-Wallet (GoPay / OVO)',
                        child: Text('E-Wallet (GoPay / OVO)'),
                      ),
                      DropdownMenuItem(
                        value: 'Bayar di Tempat (COD)',
                        child: Text('Bayar di Tempat (COD)'),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedPayment = value;
                        });
                      }
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Rincian Pembayaran',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Subtotal (${widget.quantity} barang)'),
                        Text(_formatRupiah(subtotal)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Biaya Pengiriman'),
                        Text(_formatRupiah(ongkir)),
                      ],
                    ),
                    if (diskon > 0) ...[
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Diskon Voucher', style: TextStyle(color: Colors.green)),
                          Text('-${_formatRupiah(diskon)}', style: const TextStyle(color: Colors.green)),
                        ],
                      ),
                    ],
                    const Divider(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total Pembayaran', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Text(
                          _formatRupiah(totalPembayaran),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  widget.onAddOrder({
                    'nama': widget.product['nama'],
                    'jumlah': widget.quantity,
                    'totalHarga': totalPembayaran,
                    'status': 'Dalam Proses',
                    'icon': widget.product['icon'],
                    'color': widget.product['color'],
                  });

                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Pesanan Berhasil!'),
                        content: Text(
                          'Terima kasih telah berbelanja.\nBarang: ${widget.product['nama']} (x${widget.quantity})\nTotal: ${_formatRupiah(totalPembayaran)}\nMetode: $selectedPayment',
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: const Text('Kembali ke Katalog'),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Bayar Sekarang',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilScreen extends StatelessWidget {
  final String userName;
  final List<Map<String, dynamic>> products;
  final List<Map<String, dynamic>> myOrders;
  final Function(int) onToggleFavorite;

  const ProfilScreen({
    super.key,
    required this.userName,
    required this.products,
    required this.myOrders,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            CircleAvatar(
              radius: 50,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 12),
            Text(
              userName,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              '${userName.toLowerCase().replaceAll(' ', '')}@email.com',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.shopping_bag),
                    title: const Text('Pesanan Saya'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${myOrders.length}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Icon(Icons.chevron_right),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PesananScreen(myOrders: myOrders),
                        ),
                      );
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.favorite),
                    title: const Text('Favorit Saya'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${products.where((p) => p['isFavorite'] == true).length}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Icon(Icons.chevron_right),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FavoritScreen(
                            products: products,
                            onToggleFavorite: onToggleFavorite,
                          ),
                        ),
                      );
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.location_on),
                    title: const Text('Alamat Pengiriman'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AlamatScreen()),
                      );
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Pengaturan'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PengaturanScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                    (route) => false,
                  );
                },
                icon: const Icon(Icons.logout, color: Colors.red),
                label: const Text('Keluar / Ganti Akun', style: TextStyle(color: Colors.red)),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PesananScreen extends StatelessWidget {
  final List<Map<String, dynamic>> myOrders;

  const PesananScreen({super.key, required this.myOrders});

  String _formatRupiah(int number) {
    return 'Rp ${number.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesanan Saya'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: myOrders.isEmpty
          ? const Center(child: Text('Belum ada pesanan.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: myOrders.length,
              itemBuilder: (context, index) {
                final order = myOrders[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: (order['color'] as Color).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(order['icon'] as IconData, color: order['color'] as Color),
                    ),
                    title: Text(
                      order['nama'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Jumlah: ${order['jumlah']} barang'),
                        Text(
                          'Status: ${order['status']}',
                          style: TextStyle(
                            color: order['status'] == 'Selesai'
                                ? Colors.green
                                : Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    trailing: Text(
                      _formatRupiah(order['totalHarga'] as int),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class FavoritScreen extends StatefulWidget {
  final List<Map<String, dynamic>> products;
  final Function(int) onToggleFavorite;

  const FavoritScreen({
    super.key,
    required this.products,
    required this.onToggleFavorite,
  });

  @override
  State<FavoritScreen> createState() => _FavoritScreenState();
}

class _FavoritScreenState extends State<FavoritScreen> {
  @override
  Widget build(BuildContext context) {
    final favProducts = widget.products.where((p) => p['isFavorite'] == true).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorit Saya'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: favProducts.isEmpty
          ? const Center(child: Text('Belum ada produk favorit.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: favProducts.length,
              itemBuilder: (context, index) {
                final product = favProducts[index];
                final originalIndex = widget.products.indexWhere((p) => p['id'] == product['id']);

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: (product['color'] as Color).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(product['icon'] as IconData, color: product['color'] as Color),
                    ),
                    title: Text(
                      product['nama'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(product['harga']),
                    trailing: IconButton(
                      icon: const Icon(Icons.favorite, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          widget.onToggleFavorite(originalIndex);
                        });
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailProdukScreen(
                            product: product,
                            onToggleFavorite: () {
                              setState(() {
                                widget.onToggleFavorite(originalIndex);
                              });
                            },
                            onAddOrder: (newOrder) {},
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}

class AlamatScreen extends StatelessWidget {
  const AlamatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alamat Pengiriman'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.home, color: Colors.orange),
              title: const Text('Alamat Rumah (Utama)'),
              subtitle: const Text('Jl. Merdeka No. 123, Jakarta Selatan'),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {},
              ),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Tambah Alamat Baru'),
          ),
        ],
      ),
    );
  }
}

class PengaturanScreen extends StatelessWidget {
  const PengaturanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Notifikasi'),
            subtitle: const Text('Terima pembaruan promo dan pesanan'),
            value: true,
            onChanged: (val) {},
          ),
          const Divider(height: 1),
          SwitchListTile(
            title: const Text('Mode Gelap'),
            subtitle: const Text('Gunakan tema gelap'),
            value: false,
            onChanged: (val) {},
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Keamanan & Kata Sandi'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
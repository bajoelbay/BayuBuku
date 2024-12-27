import 'package:flutter/material.dart';

class PopularPage extends StatefulWidget {
  @override
  _PopularPageState createState() => _PopularPageState();
}

class _PopularPageState extends State<PopularPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, String>> categories = [
    {
      'category': 'Horor',
      'title': 'Malam Mencekam',
      'author': 'Dian P.',
      'content': 'Buku ini menceritakan tentang malam yang penuh misteri...',
    },
    {
      'category': 'Horor',
      'title': 'Suara dari Kegelapan',
      'author': 'Agus W.',
      'content': 'Suara aneh yang selalu muncul setiap tengah malam...',
    },
    {
      'category': 'Romance',
      'title': 'Cinta dalam Hujan',
      'author': 'Maya Rahmadani.',
      'content': 'Di sebuah kota kecil yang selalu diselimuti hujan, ',
    },
    {
      'category': 'Romance',
      'title': 'Kasih Tak Sampai',
      'author': 'Lina B.',
      'content': 'Cinta yang terhalang oleh waktu dan keadaan...',
    },
    {
      'category': 'Legenda',
      'title': 'Legenda Sang Pahlawan',
      'author': 'Tirta S.',
      'content': 'Cerita tentang pahlawan legendaris yang dikenal sepanjang masa...',
    },
    {
      'category': 'Legenda',
      'title': 'Dewi Penolong Desa',
      'author': 'Yuni K.',
      'content': 'Legenda dewi yang melindungi desa dari ancaman...',
    },
    // Tambahkan lebih banyak buku di sini jika diperlukan
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Mengubah background menjadi putih
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(text: 'Horor'),
            Tab(text: 'Romance'),
            Tab(text: 'Legenda'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildBookList('Horor'),
          buildBookList('Romance'),
          buildBookList('Legenda'),
        ],
      ),
    );
  }

  Widget buildBookList(String category) {
    List<Map<String, String>> filteredBooks = categories.where((book) => book['category'] == category).toList();

    return ListView.builder(
      itemCount: filteredBooks.length,
      itemBuilder: (context, index) {
        final book = filteredBooks[index];
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailPage(book: book),
                ),
              );
            },
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book['title'] ?? '',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text('Penulis: ${book['author'] ?? ''}'),
                    SizedBox(height: 8),
                    Text(book['content'] ?? ''),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class BookDetailPage extends StatelessWidget {
  final Map<String, String> book;

  const BookDetailPage({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book['title'] ?? 'Detail Buku'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              book['title'] ?? '',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Penulis: ${book['author'] ?? ''}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text(book['content'] ?? '', style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}

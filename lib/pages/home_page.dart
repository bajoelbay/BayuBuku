import 'package:flutter/material.dart';
import '../models/book_model.dart';
import '../widgets/book_card.dart';
import '../services/auth_service.dart';
import 'popular_page.dart';
import 'logout_page.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomePageContent(),
    PopularPage(),
    LogoutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'BayNovl',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: Container(
        color: Colors.white,
        child: _children[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Populer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  final List<Book> books = [
    Book(
      title: 'Harimau dan Kancil: Akal vs. Kekuatan',
      author: 'Shani Indri',
      content: 'Di sebuah hutan yang lebat, hiduplah seekor harimau yang terkenal galak dan ditakuti oleh semua binatang. Suatu hari, harimau itu merasa sangat lapar. Saat berjalan di tepi sungai, ia melihat seekor kancil kecil sedang meminum air.“Wah, akhirnya aku menemukan makanan enak!” pikir harimau sambil mendekati kancil.Kancil yang cerdas segera menyadari bahaya. Ia tetap tenang dan mulai berpikir cara untuk menyelamatkan dirinya. Ketika harimau semakin dekat, kancil berpura-pura tidak takut dan menyapa harimau. “Wah, Harimau! Kau pasti sangat hebat dan kuat. Namun, apakah kau cukup berani melawan Raja Hutan yang baru?” tanya kancil dengan nada terkejut. Harimau berhenti, bingung dengan ucapan kancil. “Raja Hutan? Siapa itu? Aku adalah yang terkuat di hutan ini!” Kancil tersenyum kecil dan berkata, “Oh, kau belum tahu? Raja Hutan yang baru sangat besar dan kuat. Bahkan aku pun takut padanya. Jika kau tidak percaya, aku bisa membawamu melihatnya. Tapi aku tak bertanggung jawab jika kau kalah darinya.” Karena sombong, harimau setuju. “Bawa aku ke Raja Hutan itu. Aku akan membuktikan bahwa aku tetap penguasa di sini!” Kancil membawa harimau ke tepi sungai yang airnya jernih seperti cermin. Ia menunjuk bayangan harimau di air. “Itulah Raja Hutan yang baru!” katanya. Harimau melihat bayangannya di air dan berpikir itu adalah harimau lain. Ia mengaum dengan keras, tetapi bayangan itu juga mengaum balik. Merasa tertantang, harimau melompat ke air untuk menyerang. Namun, ia justru terjebak di sungai dan hampir tenggelam. Kancil tertawa kecil sambil berkata, “Harimau, kau memang kuat, tetapi kekuatan tanpa akal hanya akan membawa petaka.” Harimau akhirnya berhasil keluar dari sungai dengan tubuh basah kuyup dan merasa malu. Ia pun pergi dari sana tanpa berani mengganggu kancil lagi. Pesan moral: Kepintaran dan kecerdikan sering kali bisa mengalahkan kekuatan yang sombong.',
      imagePath: 'images/book1.jpg',
    ),
    Book(
      title: 'Perahu Kertas',
      author: 'Ranty M',
      content: 'Di sebuah desa kecil yang terletak di tepi sungai, hiduplah seorang anak laki-laki bernama Bima. Ia memiliki mimpi besar untuk menjadi seorang pelaut yang menjelajahi dunia. Setiap sore, Bima duduk di tepi sungai sambil membuat perahu kertas. Baginya, perahu-perahu kecil itu adalah simbol dari impiannya. Suatu hari, Bima bertemu dengan Lila, anak perempuan yang selalu penasaran dengan apa yang dilakukan Bima. “Kenapa kau selalu membuat perahu kertas, Bima?” tanya Lila. Bima tersenyum. “Karena perahu ini membawa mimpi-mimpiku. Aku ingin menjadi pelaut dan menjelajahi dunia.” Lila terinspirasi dan mulai membantu Bima membuat perahu kertas. Mereka menuliskan harapan-harapan kecil di atasnya. Perahu kertas itu dilepaskan ke sungai, membiarkannya mengalir bersama arus. “Hari ini, kita mengirimkan mimpi kita ke dunia,” kata Bima dengan penuh semangat. Tahun demi tahun berlalu, dan Bima tumbuh menjadi seorang pria dewasa. Ia tidak pernah melupakan mimpi masa kecilnya. Suatu hari, ia mendapat kesempatan bekerja di sebuah kapal besar. Sebelum berangkat, ia kembali ke tepi sungai, tempat ia dan Lila dulu bermain. Saat memandangi aliran sungai, Bima tersenyum. “Perahu kertas kecil itu akhirnya membawa aku ke mimpiku.” Pesan moral: Impian yang besar dimulai dari langkah kecil. Percaya dan teruslah berusaha, maka mimpi itu akan terwujud.',
      imagePath: 'images/book2.jpg',
    ),
    Book(
      title: 'Kasih Ibu ',
      author: 'Author A',
      content: 'Konten Novel A...',
      imagePath: 'images/book3.jpg',
    ),
    Book(
      title: 'Ruang sunyi',
      author: 'Chow Cin',
      content: 'Konten Novel B...',
      imagePath: 'images/book4.jpg',
    ),
    Book(
      title: 'Beruang Kutub',
      author: 'azam nur',
      content: 'Konten Novel C...',
      imagePath: 'images/book5.jpg',
    ),
    Book(
      title: 'Kisah Ramayana',
      author: 'alshop D',
      content: 'Konten Novel C...',
      imagePath: 'images/book6.jpg',
    ),
    Book(
      title: 'Herri potter',
      author: 'anggit th',
      content: 'Konten Novel C...',
      imagePath: 'images/book7.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.0, top: 16.0),
          child: Text(
            'Baru',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              final book = books[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      book.imagePath,
                      width: 50,
                      height: 75,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    book.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(book.author),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(),
                        settings: RouteSettings(arguments: book),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.0, top: 16.0),
          child: Text(
            'Lainnya',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 3 / 4,
            ),
            itemCount: books.length - 2,
            itemBuilder: (context, index) {
              final book = books[index + 2];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(),
                      settings: RouteSettings(arguments: book),
                    ),
                  );
                },
                child: BookCard(book: book),
              );
            },
          ),
        ),
      ],
    );
  }
}
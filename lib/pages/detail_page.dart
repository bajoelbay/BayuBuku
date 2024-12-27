import 'package:flutter/material.dart';
import '../models/book_model.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mendapatkan argumen 'Book' dari route.
    final Book? book = ModalRoute.of(context)?.settings.arguments as Book?;

    if (book == null) {
      // Jika argumen tidak ada, tampilkan pesan error.
      return Scaffold(
        appBar: AppBar(title: Text('Detail Buku')),
        body: Center(
          child: Text(
            'Buku tidak ditemukan!',
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    book.imagePath,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                book.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'By ${book.author}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                book.content,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class LogoutPage extends StatelessWidget {
  // Mengambil username yang sedang login dari AuthService
  final String username = AuthService.currentUser ?? 'Nama Pengguna';

  // Getter untuk mengambil riwayat bacaan dari AuthService
  List<String> get readingHistory {
    return AuthService.getReadingHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white, // Latar belakang profil putih
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    username, // Nama pengguna dari AuthService
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),

            // Reading History Section
            Row(
              children: [
                Icon(Icons.history, color: Colors.purple),
                SizedBox(width: 8),
                Text(
                  'Riwayat Bacaan:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),

            // Jika tidak ada riwayat, tampilkan pesan
            readingHistory.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Belum ada riwayat bacaan',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: readingHistory.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 2,
                          margin: EdgeInsets.symmetric(vertical: 4),
                          child: ListTile(
                            leading: Icon(
                              Icons.book,
                              color: Colors.purple,
                            ),
                            title: Text(
                              readingHistory[index],
                              style: TextStyle(fontSize: 16),
                            ),
                            subtitle: Text(
                              'Dibaca pada ${DateTime.now().toString().split(' ')[0]}',
                              style: TextStyle(fontSize: 12),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Colors.grey,
                            ),
                            onTap: () {
                              print('Membuka cerita: ${readingHistory[index]}');
                            },
                          ),
                        );
                      },
                    ),
                  ),

            SizedBox(height: 16),

            // Logout Button
            Center(
              child: ElevatedButton.icon(
                onPressed: () async {
                  print('Logout button clicked');
                  await AuthService.logout();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/login',
                    (route) => false,
                  );
                },
                icon: Icon(Icons.logout),
                label: Text('Logout'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

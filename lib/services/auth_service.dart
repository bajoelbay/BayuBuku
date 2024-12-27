class AuthService {
  // Menyimpan data user secara "persisten"
  static final List<Map<String, String>> _users = [
    // Data default user (opsional)
    {
      'username': 'admin',
      'password': 'admin123'
    }
  ];
  static String? _currentUser;
  static bool _isLoggedIn = false;
  
  // Menyimpan riwayat bacaan untuk setiap user
  static final Map<String, List<String>> _readingHistory = {};

  // Method untuk menambah riwayat bacaan   
  static void addToReadingHistory(String bookTitle) {
    if (_currentUser != null) {
      _readingHistory[_currentUser!] ??= [];
      if (!_readingHistory[_currentUser!]!.contains(bookTitle)) {
        _readingHistory[_currentUser!]!.insert(0, bookTitle); // Menambah di awal list
      }
    }
  }

  // Method untuk mengambil riwayat bacaan user yang sedang login
  static List<String> getReadingHistory() {
    if (_currentUser == null) return [];
    return _readingHistory[_currentUser!] ?? [];
  }

  static Future<Map<String, dynamic>> register(String username, String password) async {
    try {
      username = username.trim();
      password = password.trim();

      if (username.isEmpty || password.isEmpty) {
        return {
          'success': false,
          'message': 'Username dan password tidak boleh kosong'
        };
      }

      await Future.delayed(Duration(seconds: 2));

      // Cek apakah username sudah ada
      bool userExists = _users.any((user) => user['username'] == username);
      if (userExists) {
        return {'success': false, 'message': 'Username sudah terdaftar'};
      }

      // Simpan user baru
      _users.add({
        'username': username,
        'password': password,
      });

      return {'success': true, 'message': 'Registrasi berhasil'};
    } catch (e) {
      return {
        'success': false,
        'message': 'Terjadi kesalahan: ${e.toString()}'
      };
    }
  }

  static Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      username = username.trim();
      password = password.trim();

      if (username.isEmpty || password.isEmpty) {
        return {
          'success': false,
          'message': 'Username dan password tidak boleh kosong'
        };
      }

      await Future.delayed(Duration(seconds: 1));

      // Cek kredensial
      bool userValid = _users.any(
        (user) => user['username'] == username && user['password'] == password,
      );

      if (userValid) {
        _currentUser = username;
        _isLoggedIn = true;
        return {
          'success': true,
          'message': 'Login berhasil',
          'username': username
        };
      }

      return {'success': false, 'message': 'Username atau password salah'};
    } catch (e) {
      return {
        'success': false,
        'message': 'Terjadi kesalahan: ${e.toString()}'
      };
    }
  }

  static Future<Map<String, dynamic>> logout() async {
    try {
      await Future.delayed(Duration(milliseconds: 500));
      _currentUser = null;
      _isLoggedIn = false;
      // Data user tetap tersimpan di _users, tidak dihapus saat logout
      return {'success': true, 'message': 'Logout berhasil'};
    } catch (e) {
      return {
        'success': false,
        'message': 'Terjadi kesalahan saat logout: ${e.toString()}'
      };
    }
  }

  static bool get isLoggedIn => _isLoggedIn;
  static String? get currentUser => _currentUser;

  static Future<bool> checkLoginStatus() async {
    await Future.delayed(Duration(milliseconds: 500));
    return _isLoggedIn;
  }

  // Tambahan method untuk mendapatkan data user yang sedang login
  static Map<String, String>? getCurrentUserData() {
    if (_currentUser == null) return null;
    return _users.firstWhere((user) => user['username'] == _currentUser);
  }
}

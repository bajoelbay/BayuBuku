import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:novelbay/main.dart';


void main() {
  testWidgets('Login page loads correctly', (WidgetTester tester) async {
    // Build aplikasi dan trigger frame pertama.
    await tester.pumpWidget(MyApp());

    // Verifikasi bahwa halaman login muncul.
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Register'), findsOneWidget);

    // Input username dan password.
    await tester.enterText(find.byType(TextField).first, 'user');
    await tester.enterText(find.byType(TextField).last, 'password');

    // Tekan tombol Login.
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    // Verifikasi navigasi ke halaman beranda.
    expect(find.text('Beranda Buku'), findsOneWidget);
  });
}

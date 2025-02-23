import 'package:flutter/material.dart';
import 'package:web_app_dashboard/screens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  
  ThemeData(
  brightness: Brightness.dark, // Untuk dark mode
);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(),
        
      ),
      debugShowCheckedModeBanner: false,
      
      home: LoginScreen(),  // Menampilkan halaman Login saat aplikasi dijalankan
    );
  }
}

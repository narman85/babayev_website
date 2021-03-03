import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'portfolio/portfolio_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Babayev',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.amber,
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline2: GoogleFonts.montserrat(
            color: Colors.purple,
            fontWeight: FontWeight.w200,
          ),
          headline4: GoogleFonts.montserrat(
            fontWeight: FontWeight.w900,
            fontSize: 30,
            color: Colors.purple,
          ),
        ),
      ),
      home: PortfolioView(),
    );
  }
}

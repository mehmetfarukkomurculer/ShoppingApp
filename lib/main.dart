import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/product_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    const ShoppingApp(),
  );
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Madimi',
          colorScheme: const ColorScheme.dark(),
          inputDecorationTheme: const InputDecorationTheme(
            prefixIconColor: Colors.white,
            hintStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}

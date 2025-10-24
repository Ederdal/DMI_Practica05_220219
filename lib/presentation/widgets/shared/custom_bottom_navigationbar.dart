import 'package:flutter/material.dart';

class CustomBottomNavigationbar extends StatelessWidget {
  const CustomBottomNavigationbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home_max), label: 'Inicio'),
      BottomNavigationBarItem(
          icon: Icon(Icons.label_outline), label: 'Categoria'),
      BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline), label: "Favorios"),
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ignore: prefer_const_constructors
class HomeViewBottomBar extends StatelessWidget {
  const HomeViewBottomBar({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('HomeScreen'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        // Here, the items of BottomNavigationBar are hard coded. In a real
        // world scenario, the items would most likely be generated from the
        // branches of the shell route, which can be fetched using
        // `navigationShell.route.branches`.
        type: BottomNavigationBarType.fixed, // Fixed
        backgroundColor: Colors.black, // <-- This works for fixed
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Cadastro'),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'Section C'),
          BottomNavigationBarItem(icon: Icon(Icons.get_app), label: 'Section D'),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_rounded), label: 'Perfil'),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => navigationShell.goBranch(index),
      ),
    );
  }
}

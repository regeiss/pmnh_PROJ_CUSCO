import 'package:flutter/material.dart';
import 'package:gtk_flutter/src/common_widgets/drawer.dart';
import 'package:gtk_flutter/src/constants/strings.dart';
import 'package:gtk_flutter/src/feature/auth/data/firebase_auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(Strings.homePage),
          actions: <Widget>[
            PopupMenuButton<int>(
              onSelected: (item) => handleClick(item, ref),
              itemBuilder: (context) => [
                PopupMenuItem<int>(value: 0, child: Text('Logout')),
                PopupMenuItem<int>(value: 1, child: Text('Ajustes')),
              ],
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.green[100],
                    child: const Text("Pet 1"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.green[200],
                    child: const Text('Pet 2'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.green[300],
                    child: const Text('Pet3'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.green[400],
                    child: const Text('Pet 4'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.green[500],
                    child: const Text('Pet 5'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.green[600],
                    child: const Text('Pet 6'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.green[700],
                    child: const Text('Pet 7'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.green[800],
                    child: const Text('Pet 8'),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  void handleClick(int item, WidgetRef ref) {
    switch (item) {
      case 0:
        ref.read(firebaseAuthProvider).signOut();
        break;
      case 1:
        break;
    }
  }
}

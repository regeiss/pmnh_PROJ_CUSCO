import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/src/common_widgets/appbar.dart';
import 'package:gtk_flutter/src/common_widgets/drawer.dart';
import 'package:gtk_flutter/src/core/router/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MatchesScreen extends ConsumerWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: BaseAppBar(
          title: Text('Matches'),
          appBar: AppBar(),
          widgets: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_box_outlined, color: Colors.white),
              onPressed: () => context.goNamed(AppRoute.addAbrigo.name),
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
                crossAxisCount: 1,
                children: <Widget>[
                  Container(
                    height: 80.0,
                    padding: const EdgeInsets.all(8),
                    color: Colors.blue[100],
                    child: const Text("Match 10"),
                  ),
                  Container(
                    height: 80.0,
                    padding: const EdgeInsets.all(8),
                    color: Colors.green[200],
                    child: const Text('Match 20'),
                  ),
                  Container(
                    height: 80.0,
                    padding: const EdgeInsets.all(8),
                    color: Colors.yellow[300],
                    child: const Text('Match 30'),
                  ),
                  Container(
                    height: 80.0,
                    padding: const EdgeInsets.all(8),
                    color: Colors.red[400],
                    child: const Text('Match 40'),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  void handleClick(String value) {}
}

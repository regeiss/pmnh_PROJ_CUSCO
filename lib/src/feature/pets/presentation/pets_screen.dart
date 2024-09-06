import 'package:flutter/material.dart';
import 'package:gtk_flutter/src/common_widgets/appbar.dart';
import 'package:gtk_flutter/src/common_widgets/drawer.dart';
import 'package:gtk_flutter/src/constants/app_sizes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PetsScreen extends ConsumerWidget {
  const PetsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var card = SizedBox(
      height: 150,
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(1)),
        ),
        child: ListTile(
          dense: false,
          leading: FlutterLogo(),
          title: Text(
            "Cusco tal\n #31",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          subtitle: Text(
            "Raça: Indefinida",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );

    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Pets'),
        appBar: AppBar(),
        widgets: <Widget>[
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Logout', 'Ajustes'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ], //<Widget>[Icon(Icons.more_vert)],
      ),
      drawer: MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              card,
              gapW4,
              card,
              gapW4,
              card,
              card,
              gapW4,
              card,
            ],
          ),
        ),
      ),
    );
  }

  void handleClick(String value) {}
}

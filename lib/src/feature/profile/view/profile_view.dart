import 'package:flutter/material.dart';
import 'package:gtk_flutter/src/common_widgets/appbar.dart';
import 'package:gtk_flutter/src/common_widgets/drawer.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Cusco App'),
        appBar: AppBar(),
        widgets: <Widget>[Icon(Icons.more_vert)],
      ),
      drawer: MainDrawer(),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // background image and bottom contents
          Column(
            children: <Widget>[
              Container(
                height: 200.0,
                color: Colors.blue,
                child: Center(
                  child: Text('Imagem de fundo'),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Text('Conteudo'),
                  ),
                ),
              )
            ],
          ),
          // Profile image
          Positioned(
            top: 150.0, // (background container size) - (circle height / 2)
            child: Container(
              height: 150.0,
              width: 150.0,
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green),
            ),
          )
        ],
      ),
    );
  }
}

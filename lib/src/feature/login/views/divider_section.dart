import 'package:flutter/material.dart';

class DividerSection extends StatelessWidget {
  const DividerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
    children: <Widget>[
        Expanded(
          child: Divider(
            height: 10,
            thickness: 1,
            indent: 30,
            endIndent: 30,
          ),       
        ),
        Text("Logar com"),        
        Expanded(
          child: Divider(
            height: 10,
            thickness: 1,
            indent: 30,
            endIndent: 30,
          ),
        ),
      ]
    );
  }
}
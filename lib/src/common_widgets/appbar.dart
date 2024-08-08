import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = Colors.blue;
  final Text title;
  final AppBar appBar;
  final List<Widget>? widgets;

  /// you can add more fields that meet your needs

  const BaseAppBar({super.key, required this.title, required this.appBar, this.widgets});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      backgroundColor: backgroundColor,
      actions: widgets,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}

// class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const MainAppBar({super.key});

//   @override
//   Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);

//   void handleClick(String value) {
//     switch (value) {
//       case 'Logout':
//         break;
//       case 'Settings':
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: Colors.deepOrange[500],
//       titleTextStyle: TextStyle(
//         color: Colors.amber[200],
//         fontSize: 24,
//       ),
//       title: Text('Root of section'),
//       actions: <Widget>[
//         PopupMenuButton<String>(
//           onSelected: handleClick,
//           itemBuilder: (BuildContext context) {
//             return {'Logout', 'Ajustes'}.map((String choice) {
//               return PopupMenuItem<String>(
//                 value: choice,
//                 child: Text(choice),
//               );
//             }).toList();
//           },
//         ),
//       ],
//     );
//   }
// }

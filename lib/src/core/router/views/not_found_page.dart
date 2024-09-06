import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Pagina não encontrada"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go("/login"),
          child: const Text("Voltar à pagina inicial"),
        ),
      ),
    );
  }
}

// //==============================================================================
// /// teste de telas
// //==============================================================================
// class RootScreen extends StatelessWidget {
//   /// Creates a RootScreen
//   const RootScreen({
//     required this.label,
//     required this.detailsPath,
//     this.secondDetailsPath,
//     super.key,
//   });

//   final String label;
//   final String detailsPath;
//   final String? secondDetailsPath;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: BaseAppBar(
//         title: Text('Cusco App'),
//         appBar: AppBar(),
//         widgets: <Widget>[
//           PopupMenuButton<String>(
//             onSelected: handleClick,
//             itemBuilder: (BuildContext context) {
//               return {'Logout', 'Ajustes'}.map((String choice) {
//                 return PopupMenuItem<String>(
//                   value: choice,
//                   child: Text(choice),
//                 );
//               }).toList();
//             },
//           ),
//         ], //<Widget>[Icon(Icons.more_vert)],
//       ),
//       drawer: MainDrawer(),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Text('Screen $label', style: Theme.of(context).textTheme.titleLarge),
//             const Padding(padding: EdgeInsets.all(4)),
//             TextButton(
//               onPressed: () {
//                 GoRouter.of(context).go(detailsPath, extra: '$label-XYZ');
//               },
//               child: const Text('View details'),
//             ),
//             const Padding(padding: EdgeInsets.all(4)),
//             if (secondDetailsPath != null)
//               TextButton(
//                 onPressed: () {
//                   GoRouter.of(context).go(secondDetailsPath!);
//                 },
//                 child: const Text('View more details'),
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   void handleClick(String value) {}
// }

// /// The details screen for either the A or B screen.
// class DetailsScreen extends StatefulWidget {
//   /// Constructs a [DetailsScreen].
//   const DetailsScreen({
//     required this.label,
//     this.param,
//     this.extra,
//     this.withScaffold = true,
//     super.key,
//   });

//   final String label;
//   final String? param;
//   final Object? extra;
//   final bool withScaffold;

//   @override
//   State<StatefulWidget> createState() => DetailsScreenState();
// }

// /// The state for DetailsScreen
// class DetailsScreenState extends State<DetailsScreen> {
//   int _counter = 0;

//   @override
//   Widget build(BuildContext context) {
//     if (widget.withScaffold) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Details Screen - ${widget.label}'),
//         ),
//         body: _build(context),
//       );
//     } else {
//       return ColoredBox(
//         color: Theme.of(context).scaffoldBackgroundColor,
//         child: _build(context),
//       );
//     }
//   }

//   Widget _build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Text('Details for ${widget.label} - Counter: $_counter', style: Theme.of(context).textTheme.titleLarge),
//           const Padding(padding: EdgeInsets.all(4)),
//           TextButton(
//             onPressed: () {
//               setState(() {
//                 _counter++;
//               });
//             },
//             child: const Text('Increment counter'),
//           ),
//           const Padding(padding: EdgeInsets.all(8)),
//           if (widget.param != null) Text('Parameter: ${widget.param!}', style: Theme.of(context).textTheme.titleMedium),
//           const Padding(padding: EdgeInsets.all(8)),
//           if (widget.extra != null) Text('Extra: ${widget.extra!}', style: Theme.of(context).textTheme.titleMedium),
//           if (!widget.withScaffold) ...<Widget>[
//             const Padding(padding: EdgeInsets.all(16)),
//             TextButton(
//               onPressed: () {
//                 GoRouter.of(context).pop();
//               },
//               child: const Text('< Back', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
//             ),
//           ]
//         ],
//       ),
//     );
//   }
// }

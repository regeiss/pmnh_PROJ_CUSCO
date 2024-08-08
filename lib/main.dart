import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gtk_flutter/firebase_options.dart';
import 'package:gtk_flutter/src/feature/welcome/view/app_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
   
Future<void> main() async {
 
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: AppView()));
  FlutterNativeSplash.remove();
}
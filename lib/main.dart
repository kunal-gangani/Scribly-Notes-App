import 'package:firebase_core/firebase_core.dart';
import 'package:notes_application/MyApp/my_app.dart';
import 'package:flutter/material.dart';
import 'package:notes_application/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MyApp(),
  );
}

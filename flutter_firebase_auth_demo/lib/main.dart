import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'common/application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Application());
}

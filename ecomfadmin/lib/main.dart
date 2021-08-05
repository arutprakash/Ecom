import 'package:flutter/material.dart';
import 'package:ecomfadmin/providers/app_states.dart';
import 'package:ecomfadmin/providers/products_provider.dart';
import 'package:ecomfadmin/screens/admin.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:ecomfadmin/screens/dashboard.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: AppState()),
      ChangeNotifierProvider.value(value: ProductProvider()),

    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    ),
  ));
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superlig_app/login.dart';
import 'package:superlig_app/provider/app_satate.dart';

void main() {
  runApp(const SuperligApp());
}

class SuperligApp extends StatelessWidget {
  const SuperligApp({Key? key}) : super(key: key);
//dfgdfghdg
//dfgdfghdg
//dfgdfghdg
//dfgdfghdg
//dfgdfghdg
override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AppState(),
          ) //merhbaba
        ],
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AppState(),
          ) //merhbaba
        ],
        child: MaterialApp(
          title: "Süper Lig App",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.amber),
          home: const FormsPage(),
        ));
  }
}

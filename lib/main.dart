import 'package:flutter/material.dart';
import 'package:flutterMyShop/views/produtos_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha Loja',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.orange,
        fontFamily: 'Lato',
      ),
      home: ProdutosViewScreen(),
    );
  }
}

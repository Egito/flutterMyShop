import 'package:flutter/material.dart';
import 'package:flutterMyShop/rotas/cce_rotas.dart';
import 'package:flutterMyShop/views/cce_pro_cat.dart';
import 'package:flutterMyShop/views/cce_pro_cat_item_det.dart';

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
      home: CceProCatalogo(),
      routes: {
        AppRoutes.CCE_PRO_DETALHE: (ctx) => CceProDetalhe(),
      },
    );
  }
}

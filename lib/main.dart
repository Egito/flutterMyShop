import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutterMyShop/widget/cce_pro_cat_item_det.dart';
import 'package:flutterMyShop/data/cce_pro_provider.dart';
import 'package:flutterMyShop/rotas/cce_rotas.dart';
import 'package:flutterMyShop/widget/cce_pro_cat.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new CceProProviver(),
          child: MaterialApp(
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
      ),
    );
  }
}

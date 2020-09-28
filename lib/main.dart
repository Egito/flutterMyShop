import 'package:flutter/material.dart';
import 'package:flutterMyShop/servicos/ven_carro_provider.dart';
import 'package:flutterMyShop/paginas/ven/ven_carro.dart';
import 'package:provider/provider.dart';

import 'package:flutterMyShop/paginas/cce/cce_pro_cat_item_det.dart';
import 'package:flutterMyShop/servicos/cce_produto_provider.dart';
import 'package:flutterMyShop/rotas/rotas.dart';
import 'package:flutterMyShop/paginas/cce/cce_pro_cat.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new CceProdutoProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => new VenCarroProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Minha Loja',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.orange,
          fontFamily: 'Lato',
        ),
        home: CceProCatalogo(),
        routes: {
          AppRoutes.CCE_PRO_DETALHE: (ctx) => CceProDetalhe(),
          AppRoutes.VEN_CAR_DETALHE: (ctx) => VenCarro(),
        },
      ),
    );
  }
}

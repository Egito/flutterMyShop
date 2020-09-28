import 'package:flutter/material.dart';
import 'package:flutterMyShop/servicos/fat_pedidos_provider.dart';
import 'package:flutterMyShop/servicos/ven_carro_provider.dart';
import 'package:flutterMyShop/servicos/cce_produto_provider.dart';
import 'package:provider/provider.dart';

import 'package:flutterMyShop/paginas/cce/cce_pro_cat_item_det.dart';
import 'package:flutterMyShop/paginas/cce/cce_catalogo.dart';
import 'package:flutterMyShop/paginas/fat/fat_pedidos.dart';
import 'package:flutterMyShop/paginas/ven/ven_carro.dart';
import 'package:flutterMyShop/rotas/rotas.dart';

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
        ChangeNotifierProvider(
          create: (_) => new FatPedidosProvider(),
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
          AppRoutes.HOME: (ctx) => CceProCatalogo(),
          AppRoutes.CCE_PRODUTO: (ctx) => CceProDetalhe(),
          AppRoutes.VEN_CARRINHO: (ctx) => VenCarro(),
          AppRoutes.FAT_PEDIDOS: (ctx) => FatPedidos(),
        },
      ),
    );
  }
}

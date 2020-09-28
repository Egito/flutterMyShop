import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutterMyShop/02-servicos/fat_pedidos_provider.dart';
import 'package:flutterMyShop/02-servicos/ven_carro_provider.dart';
import 'package:flutterMyShop/02-servicos/cce_produto_provider.dart';

import 'package:flutterMyShop/03-paginas/cce/cce_pro_detalhe.dart';
import 'package:flutterMyShop/03-paginas/cce/cce_catalogo.dart';
import 'package:flutterMyShop/03-paginas/fat/fat_pedidos.dart';
import 'package:flutterMyShop/03-paginas/ven/ven_carro.dart';

import 'package:flutterMyShop/00-rotas/rotas.dart';

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
        home: CceCatalogo(),
        routes: {
          AppRoutes.HOME: (ctx) => CceCatalogo(),
          AppRoutes.CCE_PRODUTO: (ctx) => CceProDetalhe(),
          AppRoutes.VEN_CARRINHO: (ctx) => VenCarro(),
          AppRoutes.FAT_PEDIDOS: (ctx) => FatPedidos(),
        },
      ),
    );
  }
}

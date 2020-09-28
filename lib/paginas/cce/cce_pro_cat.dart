import 'package:flutter/material.dart';
import 'package:flutterMyShop/servicos/cce_produto_provider.dart';
import 'package:flutterMyShop/servicos/ven_carro_provider.dart';
import 'package:flutterMyShop/rotas/rotas.dart';
import 'package:flutterMyShop/paginas/cce/cce_pro_cat_grid.dart';
import 'package:flutterMyShop/paginas/ven/ven_carro_icone.dart';
import 'package:provider/provider.dart';

class CceProCatalogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CceProdutoProvider produto = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Nossa Loja'),
        actions: <Widget>[
          PopupMenuButton(
              onSelected: (int selectValue) {
                print(selectValue);
                if (selectValue == 0) {
                  produto.mostraSoFavoritos();
                } else {
                  produto.mostraTodos();
                }
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text('Somente os Favoritos'),
                      value: 0,
                    ),
                    PopupMenuItem(
                      child: Text('Mostrar Todos'),
                      value: 1,
                    ),
                  ]),
          Consumer<VenCarroProvider>(
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.VEN_CAR_DETALHE);
              },
            ),
            builder: (_, carro, child) => VenCarroIcone(
              value: carro.itensCarro.toString(),
              filho: child,
            ),
          ),
        ],
      ),
      body: CceProCatGrid(),
    );
  }
}

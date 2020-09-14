import 'package:flutter/material.dart';
import 'package:flutterMyShop/data/cce_pro_provider.dart';
import 'package:flutterMyShop/widget/cce_pro_cat_grid.dart';
import 'package:provider/provider.dart';

class CceProCatalogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CceProProvider produto = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Nossa Loja'),
        actions: <Widget>[
          PopupMenuButton(onSelected: (int selectValue) {
            print(selectValue);
            if(selectValue == 0) {
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
        ],
      ),
      body: CceProCatGrid(),
    );
  }
}

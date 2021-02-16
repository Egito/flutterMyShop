import 'package:flutter/material.dart';

import 'package:flutterMyShop/app/00-rotas/rotas.dart';

class AccMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Menu de usuario'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.pages_rounded),
            title: Text('Produtos'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.CCE_PRODUTO,
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop_rounded),
            title: Text('Catalogo'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.CCE_CATALOGO,
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Pedidos'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.FAT_PEDIDOS,
              );
            },
          ),
        ],),
    );
  }
}
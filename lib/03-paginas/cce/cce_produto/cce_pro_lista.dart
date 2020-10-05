import 'package:flutter/material.dart';
import 'package:flutterMyShop/00-rotas/rotas.dart';
import 'package:flutterMyShop/01-models/cce_produto_model.dart';
import 'package:flutterMyShop/03-paginas/cce/cce_produto/cce_pro_edit.dart';

class CceProdutoItem extends StatelessWidget {
  final CceProdutoModel produto;

  CceProdutoItem(
    this.produto,
  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(produto.imagemUrl),
      ),
      title: Text(produto.abrev),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              color: Theme.of(context).primaryColor,
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.CCE_PRO_EDICAO);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Theme.of(context).errorColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

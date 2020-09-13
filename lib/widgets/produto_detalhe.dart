import 'package:flutter/material.dart';
import 'package:flutterMyShop/models/produto_model.dart';

class ProdutoDetalhe extends StatelessWidget {
  final CceProduto produto;

  ProdutoDetalhe(this.produto);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        produto.imagemUrl,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black87,
        //backgroundColor: Colors.black54,
        leading: IconButton(
          icon: Icon(Icons.favorite),
          onPressed: () {},
          color: Theme.of(context).accentColor,
        ),
        title: Text(
          produto.abrev,
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {},
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}

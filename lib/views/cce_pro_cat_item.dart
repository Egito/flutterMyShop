import 'package:flutter/material.dart';
import 'package:flutterMyShop/models/cce_pro_model.dart';
import 'package:flutterMyShop/rotas/cce_rotas.dart';
import 'package:flutterMyShop/views/cce_pro_cat_item_det.dart';

class CceProCataItem extends StatelessWidget {
  final CceProdutoModel produto;

  CceProCataItem(this.produto);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRoutes.CCE_PRO_DETALHE,
              arguments: produto,
            );
          },
          child: Image.network(
            produto.imagemUrl,
            fit: BoxFit.cover,
          ),
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
      ),
    );
  }
}

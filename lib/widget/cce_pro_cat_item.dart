import 'package:flutter/material.dart';
import 'package:flutterMyShop/models/cce_pro_model.dart';
import 'package:flutterMyShop/rotas/cce_rotas.dart';
import 'package:provider/provider.dart';

class CceProCataItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final CceProdutoModel produto = Provider.of<CceProdutoModel>(context, listen: false);
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
          // usando consumer para otimizar a renderizacao, la em cima se colocou o lister para falso
          leading: Consumer<CceProdutoModel>(
            builder: (ctx, produto, child) => IconButton(
              icon: Icon(produto.isFavorite ? Icons.favorite :  Icons.favorite_border),
              onPressed: () {
                produto.toogleFavorite();
              },
              color: Theme.of(context).accentColor,
            ),
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

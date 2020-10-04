import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutterMyShop/02-servicos/ven_carro_provider.dart';
import 'package:flutterMyShop/01-models/cce_produto_model.dart';
import 'package:flutterMyShop/00-rotas/rotas.dart';

class CceCatalogoGridItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CceProdutoModel produto =
        Provider.of<CceProdutoModel>(context, listen: false);

    final VenCarroProvider carro =
        Provider.of<VenCarroProvider>(context, listen: false);

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
              icon: Icon(
                  produto.isFavorite ? Icons.favorite : Icons.favorite_border),
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
            onPressed: () {
              Scaffold.of(context).hideCurrentSnackBar();
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Item colocado no carrinho!',
                    textAlign: TextAlign.center,
                  ),
                  duration: Duration(seconds: 3),
                  action: SnackBarAction(
                    label: 'Desfazer',
                    onPressed: () {
                      carro.subtraiItem(produto);
                    },
                  ),
                ),
              );
              carro.addItem(produto);
              //print(carro.itensCarro);
            },
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}

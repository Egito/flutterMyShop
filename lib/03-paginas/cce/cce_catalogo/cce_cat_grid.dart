import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutterMyShop/02-servicos/cce_produto_provider.dart';
import 'package:flutterMyShop/03-paginas/cce/cce_catalogo/cce_cat_grid_item.dart';

class CceCatalogoGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final produtosProvider = Provider.of<CceProdutoProvider>(context);
    final nossosProdutos = produtosProvider.items;

    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: nossosProdutos.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: nossosProdutos[i],
        child: CceCatalogoGridItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutterMyShop/servicos/cce_produto_provider.dart';
import 'package:flutterMyShop/paginas/cce/cce_pro_cat_item.dart';
import 'package:provider/provider.dart';

class CceProCatGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final produtosProvider = Provider.of<CceProdutoProvider>(context);
    final nossosProdutos = produtosProvider.items;

    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: nossosProdutos.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: nossosProdutos[i],
        child: CceProCataItem(),
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

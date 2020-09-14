
import 'package:flutter/material.dart';
import 'package:flutterMyShop/data/cce_pro_provider.dart';
import 'package:flutterMyShop/widget/cce_pro_cat_item.dart';
import 'package:provider/provider.dart';

class CceProCatGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final produtosProvider = Provider.of<CceProProviver>(context);
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

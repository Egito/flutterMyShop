import 'package:flutter/material.dart';
import 'package:flutterMyShop/models/cce_pro_model.dart';
import 'package:flutterMyShop/views/cce_pro_cat_item.dart';

import 'package:flutterMyShop/data/dummy_data.dart';

class CceProCatalogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<CceProdutoModel> nossosProdutos = DUMMY_PRODUTOS;

    return Scaffold(
      appBar: AppBar(
        title: Text('Nossa Loja'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: nossosProdutos.length,
        itemBuilder: (ctx, i) => CceProCataItem(nossosProdutos[i]),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}

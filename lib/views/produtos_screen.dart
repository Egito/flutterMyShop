import 'package:flutter/material.dart';
import 'package:flutterMyShop/data/dummy_data.dart';
import 'package:flutterMyShop/models/produto_model.dart';
import 'package:flutterMyShop/widgets/produto_detalhe.dart';

class ProdutosViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<CceProduto> nossosProdutos = DUMMY_PRODUTOS;

    return Scaffold(
      appBar: AppBar(
        title: Text('Nossa Loja'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: nossosProdutos.length,
        itemBuilder: (ctx, i) => ProdutoDetalhe(nossosProdutos[i]),
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

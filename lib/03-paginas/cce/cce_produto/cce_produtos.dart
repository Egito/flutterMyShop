import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutterMyShop/00-rotas/rotas.dart';

import 'package:flutterMyShop/03-paginas/cce/cce_produto/cce_pro_lista.dart';
import 'package:flutterMyShop/02-servicos/cce_produto_provider.dart';
import 'package:flutterMyShop/03-paginas/acc/acc_menu.dart';

class CceProdutos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final produtosProv =
        Provider.of<CceProdutoProvider>(context, listen: false);
    final produtos = produtosProv.items;

    return Scaffold(
      drawer: AccMenu(),
      appBar: AppBar(
        title: Text('Cadastro de Produtos'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: produtosProv.numItens,
          itemBuilder: (ctx, i) => Column(
            children: [
              CceProdutoItem(produtos[i]),
              Divider(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.CCE_PRO_EDICAO);
        },
        child: null,
      ),
    );
  }
}

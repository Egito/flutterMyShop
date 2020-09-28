import 'package:flutter/material.dart';

import 'package:flutterMyShop/03-paginas/acc/acc_menu.dart';

class CceProdutos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AccMenu(),
      appBar: AppBar(
        title: Text('Cadastro de Produtos'),
      ),
      body: Container(
        child: FloatingActionButton(onPressed: () {}, child: null),
      ),
    );
  }
}

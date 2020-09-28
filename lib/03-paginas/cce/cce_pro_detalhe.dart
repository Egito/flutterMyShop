import 'package:flutter/material.dart';

import 'package:flutterMyShop/01-models/cce_produto_model.dart';

class CceProDetalhe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CceProdutoModel produto =
        ModalRoute.of(context).settings.arguments as CceProdutoModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(produto.abrev),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                produto.imagemUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'R\$ ${produto.preco}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                produto.descr,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),),
    );
  }
}

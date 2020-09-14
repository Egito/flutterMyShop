import 'package:flutter/material.dart';
import 'package:flutterMyShop/models/cce_pro_model.dart';

class CceProDetalhe extends StatelessWidget {
  final CceProduto produto;

  CceProDetalhe(this.produto);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(produto.abrev),
      ),
    );
  }
}

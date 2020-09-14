import 'package:flutter/material.dart';
import 'package:flutterMyShop/models/cce_pro_model.dart';

class CceProDetalhe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CceProdutoModel produto =
        ModalRoute.of(context).settings.arguments as CceProdutoModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(produto.abrev),
      ),
    );
  }
}

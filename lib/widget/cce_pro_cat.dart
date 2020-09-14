import 'package:flutter/material.dart';
import 'package:flutterMyShop/widget/cce_pro_cat_grid.dart';

class CceProCatalogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Nossa Loja'),
      ),
      body: CceProCatGrid(),
    );
  }
}

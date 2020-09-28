import 'package:flutter/foundation.dart';
import 'package:flutterMyShop/01-models/cce_produto_model.dart';

class VenCarroItemModel {
  final String id;
  final String descr;
  final int quant;
  final double preco;
  final CceProdutoModel produto;

  VenCarroItemModel({
    @required this.id,
    @required this.descr,
    @required this.quant,
    @required this.preco,
    @required this.produto,
  });
}

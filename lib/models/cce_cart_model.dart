import 'package:flutter/foundation.dart';

class CceCarroItem {
  final String id;
  final String descr;
  final int quant;
  final double preco;

  CceCarroItem({
    @required this.id,
    @required this.descr,
    @required this.quant,
    @required this.preco,
  });
}

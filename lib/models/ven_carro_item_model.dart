import 'package:flutter/foundation.dart';

class VenCarroItemModel {
  final String id;
  final String descr;
  final int quant;
  final double preco;

  VenCarroItemModel({
    @required this.id,
    @required this.descr,
    @required this.quant,
    @required this.preco,
  });
}

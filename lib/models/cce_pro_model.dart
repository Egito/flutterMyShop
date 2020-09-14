import 'package:flutter/foundation.dart';

class CceProduto {
  final String id;
  final String abrev;
  final String descr;
  final double preco;
  final String imagemUrl;
  bool isFavorite;

  CceProduto({
    @required this.id,
    @required this.abrev,
    @required this.descr,
    @required this.preco,
    @required this.imagemUrl,
    this.isFavorite = false,
  });
}

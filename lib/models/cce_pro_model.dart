import 'package:flutter/foundation.dart';

class CceProdutoModel with ChangeNotifier {
  final String id;
  final String abrev;
  final String descr;
  final double preco;
  final String imagemUrl;
  bool isFavorite;

  CceProdutoModel({
    @required this.id,
    @required this.abrev,
    @required this.descr,
    @required this.preco,
    @required this.imagemUrl,
    this.isFavorite = false,
  });

  void toogleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}

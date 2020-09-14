import 'package:flutter/material.dart';
import 'package:flutterMyShop/data/dummy_data.dart';
import 'package:flutterMyShop/models/cce_pro_model.dart';

class CceProProvider with ChangeNotifier {
  List<CceProdutoModel> _items = DUMMY_PRODUTOS;

  bool _mostraSoFavoritos = false;

  List<CceProdutoModel> get items {
    if(_mostraSoFavoritos) {
      return _items.where((element) => element.isFavorite).toList();
    }
    return [..._items];
  }

  void mostraSoFavoritos() {
    _mostraSoFavoritos = true;
    notifyListeners();
  }

  void mostraTodos() {
    _mostraSoFavoritos = false;
    notifyListeners();
  }

  void addCceProduto(CceProdutoModel produto) {
    _items.add(produto);
    notifyListeners();
  }
}

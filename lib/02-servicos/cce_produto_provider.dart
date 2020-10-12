import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterMyShop/02-servicos/dummy_data.dart';
import 'package:flutterMyShop/01-models/cce_produto_model.dart';

class CceProdutoProvider with ChangeNotifier {
  bool _mostraSoFavoritos = false;

  List<CceProdutoModel> _items = dummyProdutos;

  List<CceProdutoModel> get items {
    if (_mostraSoFavoritos) {
      return _items.where((element) => element.isFavorite).toList();
    }
    return [..._items];
  }

  int get numItens {
    return _items.length;
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
    _items.add(CceProdutoModel(
      id: Random().nextDouble().toString(),
      abrev: produto.abrev,
      descr: produto.descr,
      preco: produto.preco,
      imagemUrl: produto.imagemUrl,
    ));
    notifyListeners();
  }

  bool updateCceProduto(CceProdutoModel produto) {
    if (produto == null || produto.id == null) return false;

    final i = _items.indexWhere((element) => element.id == produto.id);

    if (i < 0) return false;

    _items[i] = produto;
    notifyListeners();
    return true;
  }

  bool deleteCceProduto(CceProdutoModel produto) {
    if (produto == null || produto.id == null) return false;

    final i = _items.indexWhere((element) => element.id == produto.id);

    if (i < 0) return false;

    _items.removeWhere((element) => element.id == produto.id);
    notifyListeners();
    return true;
  }
}

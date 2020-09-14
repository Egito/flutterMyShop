import 'package:flutter/material.dart';
import 'package:flutterMyShop/data/dummy_data.dart';
import 'package:flutterMyShop/models/cce_pro_model.dart';

class CceProProviver with ChangeNotifier {
  List<CceProdutoModel> _items = DUMMY_PRODUTOS;

  List<CceProdutoModel> get items => [..._items];

  void addCceProduto(CceProdutoModel produto) {
    _items.add(produto);
    notifyListeners();
  }
}

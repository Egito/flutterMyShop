import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutterMyShop/models/cce_cart_model.dart';
import 'package:flutterMyShop/models/cce_pro_model.dart';

class CceCarroProvider with ChangeNotifier {
  Map<String, CceCarroItem> _itens;

  Map<String, CceCarroItem> get item {
    return {..._itens};
  }

 void addItem(CceProdutoModel produto)  {
    if(_itens.containsKey(produto.id)) {
      _itens.update(produto.id, (value) {
        return CceCarroItem(
          id: value.id,
          descr: value.descr,
          quant: value.quant + 1,
          preco: value.preco,
        );
      });
    } else {
      _itens.putIfAbsent(produto.id, () => CceCarroItem(
        id: Random().nextDouble().toString(),
        descr: produto.descr,
        quant: 1,
        preco: produto.preco,
      ));
    }

    notifyListeners();
  }
}
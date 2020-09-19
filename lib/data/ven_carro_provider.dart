import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutterMyShop/models/cce_produto_model.dart';
import 'package:flutterMyShop/models/ven_carro_item_model.dart';

class VenCarroProvider with ChangeNotifier {
  Map<String, VenCarroItemModel> _itens = {};

  Map<String, VenCarroItemModel> get item {
    return {..._itens};
  }

  int get itensCarro {
    return _itens.length;
  }

  double get totalCarro {
    double total = 0.0;
    _itens.forEach((key, value) {
      total += value.quant * value.preco;
    });
    return total;
  }

  void addItem(CceProdutoModel produto) {
    if (_itens.containsKey(produto.id)) {
      _itens.update(produto.id, (value) {
        return VenCarroItemModel(
          id: value.id,
          descr: value.descr,
          quant: value.quant + 1,
          preco: value.preco,
        );
      });
    } else {
      _itens.putIfAbsent(
          produto.id,
          () => VenCarroItemModel(
                id: Random().nextDouble().toString(),
                descr: produto.descr,
                quant: 1,
                preco: produto.preco,
              ));
    }

    notifyListeners();
  }
}

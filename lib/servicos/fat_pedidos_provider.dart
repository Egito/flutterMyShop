import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterMyShop/models/fat_pedido_model.dart';
import 'package:flutterMyShop/servicos/ven_carro_provider.dart';


class FatPedidosProvider with ChangeNotifier {
  List<FatPedidoModel> _itemPed = [];

  List<FatPedidoModel> get itemPed {
    return [..._itemPed];
  }

  int get itensPed {
    return _itemPed.length;
  }

  void addPedido(VenCarroProvider carro) {
    //final total = carro.fold(0.0, (t, i) => t + (i.quant * i.preco));
    _itemPed.insert(
      0,
      FatPedidoModel(
        id: Random().nextDouble().toString(),
        total: carro.totalCarro,
        itens: carro.itensCarro,
        data: DateTime.now(),
        produtos: carro.itens.values.toList(),
      ),
    );

    notifyListeners();
  }
}
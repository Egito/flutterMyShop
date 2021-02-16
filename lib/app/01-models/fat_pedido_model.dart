import 'package:flutterMyShop/app/01-models/ven_carro_item_model.dart';

class FatPedidoModel {

  final String id;
  final double total;
  final int itens;
  final DateTime data;
  final List<VenCarroItemModel> produtos;

  FatPedidoModel({
    this.id,
    this.total,
    this.itens,
    this.data,
    this.produtos,
  });
}

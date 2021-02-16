import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutterMyShop/app/02-servicos/fat_pedidos_provider.dart';

import 'package:flutterMyShop/app/03-paginas/acc/acc_menu.dart';
import 'package:flutterMyShop/app/03-paginas/fat/fat_ped_detalhe.dart';

class FatPedidos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FatPedidosProvider pedidos = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Pedidos'),
      ),
      drawer: AccMenu(),
      body: ListView.builder(
        itemCount: pedidos.itensPed,
        itemBuilder: (ctx, i) => FatPedDetalhe(pedidos.itemPed[i]),
      ),
    );
  }
}

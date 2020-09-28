import 'package:flutter/material.dart';
import 'package:flutterMyShop/01-models/fat_pedido_model.dart';
import 'package:flutterMyShop/03-paginas/acc/acc_menu.dart';
import 'package:flutterMyShop/03-paginas/fat/fat_ped_detalhe.dart';
import 'package:flutterMyShop/02-servicos/fat_pedidos_provider.dart';
import 'package:provider/provider.dart';

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
import 'package:flutter/material.dart';
import 'package:flutterMyShop/models/fat_pedido_model.dart';
import 'package:flutterMyShop/paginas/acc/acc_menu.dart';
import 'package:flutterMyShop/paginas/fat/fat_ped_detalhe.dart';
import 'package:flutterMyShop/servicos/fat_pedidos_provider.dart';
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
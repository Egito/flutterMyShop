import 'package:flutter/material.dart';
import 'package:flutterMyShop/02-servicos/fat_pedidos_provider.dart';
import 'package:provider/provider.dart';

import 'package:flutterMyShop/02-servicos/ven_carro_provider.dart';
import 'package:flutterMyShop/03-paginas/ven/ven_carro_item.dart';

class VenCarro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final VenCarroProvider carro = Provider.of(context);
    final carroItens = carro.itens.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(25),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: 10),
                  Chip(
                    label: Text(
                      'R\$ ${carro.totalCarro.toStringAsFixed(2)}',
                      style: TextStyle(
                        color:
                            Theme.of(context).primaryTextTheme.bodyText1.color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  Spacer(),
                  FlatButton(
                    onPressed: () {
                      Provider.of<FatPedidosProvider>(context, listen: false)
                          .addPedido(carro);
                      carro.limpaCarro();
                    },
                    child: Text('Finalizar Compra'),
                    textColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
                itemCount: carro.itensCarro,
                itemBuilder: (ctx, i) => VenCarroItem(carroItens[i])),
          ),
        ],
      ),
    );
  }
}

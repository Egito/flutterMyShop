import 'package:flutter/material.dart';

import 'package:flutterMyShop/01-models/ven_carro_item_model.dart';

import 'package:flutterMyShop/02-servicos/ven_carro_provider.dart';
import 'package:provider/provider.dart';

class VenCarroItem extends StatelessWidget {

  final VenCarroItemModel carroItem;

// recebe passagem de parametro do modelo acima
  const VenCarroItem(this.carroItem);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(carroItem.id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        Provider.of<VenCarroProvider>(context, listen: false).removeItem(carroItem.produto.id);
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Image.network(
                carroItem.produto.imagemUrl,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(carroItem.descr),
            subtitle: Text('Total R\$: ${(carroItem.preco * carroItem.quant).toStringAsFixed(2)}'),
            trailing: Text('${carroItem.quant}x'),
          ),
        ),
        
      ),
    );
  }
}
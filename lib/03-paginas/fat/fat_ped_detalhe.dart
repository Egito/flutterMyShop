import 'package:flutter/material.dart';
import 'package:flutterMyShop/01-models/fat_pedido_model.dart';
import 'package:intl/intl.dart';

class FatPedDetalhe extends StatefulWidget {

  final FatPedidoModel pedido;

  FatPedDetalhe(
    this.pedido,
  );

  @override
  _FatPedDetalheState createState() => _FatPedDetalheState();
}

class _FatPedDetalheState extends State<FatPedDetalhe> {
  bool _expandido = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('R\$ ${widget.pedido.total.toStringAsFixed(2)}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(widget.pedido.data),
            ),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expandido = !_expandido;
                });
              },
            ),
          ),
          if(_expandido)
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 4,
              ),
              height: widget.pedido.itens * 25.0 + 10,
              child: ListView(
                children: widget.pedido.produtos.map((p) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: new Container(
                          padding: new EdgeInsets.only(right: 13.0),
                          child: new Text(
                            p.descr,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Text(
                        '${p.quant} x R\$ ${p.preco.toString()}',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
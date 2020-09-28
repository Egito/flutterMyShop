import 'package:flutter/material.dart';

class Alerta extends StatelessWidget {

  final String msg;

  Alerta({context,
    this.msg,
  })

  @override
  Widget build(BuildContext context) {
    return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text(
              msg,
              textAlign: TextAlign.center,
            ),
            //content: Text('Opção'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {Navigator.of(ctx).pop(false);},
                child: Text('Nao'),
              ),
              FlatButton(
                onPressed: () {Navigator.of(ctx).pop(true);},
                child: Text('Sim'),
              ),
            ],
          ),
        );
  }
}
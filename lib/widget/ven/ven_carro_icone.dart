import 'package:flutter/material.dart';

class VenCarroIcone extends StatelessWidget {
  final Widget filho;
  final String value;
  final Color cor;

  VenCarroIcone({
    @required this.filho,
    @required this.value,
    this.cor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        filho,
        Positioned(
            right: 8,
            top: 8,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: cor != null ? cor : Theme.of(context).accentColor,
              ),
              constraints: BoxConstraints(
                minHeight: 16,
                minWidth: 16,
              ),
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ))
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CceProdutoEdit extends StatefulWidget {
  @override
  _CceProdutoEditState createState() => _CceProdutoEditState();
}

class _CceProdutoEditState extends State<CceProdutoEdit> {
  final _prFocusNode = FocusNode();
  final _dsFocusNode = FocusNode();
  final _imgFocusNode = FocusNode();
  final _imgControler = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _imgFocusNode.addListener(_updateImagem);
  }

  void _updateImagem() {
    setState(() {});
    print('mudou');
  }

  @override
  void dispose() {
    super.dispose();
    _prFocusNode.dispose();
    _dsFocusNode.dispose();
    _imgFocusNode.removeListener(_updateImagem);
    _imgFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Manutenção de Produto',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Titulo'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_prFocusNode);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Preço'),
                textInputAction: TextInputAction.next,
                focusNode: _prFocusNode,
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_dsFocusNode);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Descrição'),
                maxLines: 3,
                focusNode: _dsFocusNode,
                keyboardType: TextInputType.multiline,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_dsFocusNode);
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'URL da Imagem'),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      focusNode: _imgFocusNode,
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.only(
                      top: 8,
                      left: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).accentColor,
                        width: 1,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: _imgControler.text.isEmpty
                        ? Text('Sem URL')
                        : FittedBox(
                            child: Image.network(
                              _imgControler.text,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  // https://www.gratispng.com/png-1mw11z/
                  // https://image.freepik.com/fotos-gratis/pizza-vegetariana-em-fundo-branco_1339-55595.jpg
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

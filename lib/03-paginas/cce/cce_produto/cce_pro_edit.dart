import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterMyShop/01-models/cce_produto_model.dart';
import 'package:flutterMyShop/02-servicos/cce_produto_provider.dart';
import 'package:provider/provider.dart';

class CceProdutoEdit extends StatefulWidget {
  @override
  _CceProdutoEditState createState() => _CceProdutoEditState();
}

class _CceProdutoEditState extends State<CceProdutoEdit> {
  final _prFocusNode = FocusNode();
  final _dsFocusNode = FocusNode();
  final _imgFocusNode = FocusNode();
  final _imgControler = TextEditingController();
  final _form = GlobalKey<FormState>();

  final _formDados = Map<String, Object>();

  @override
  void initState() {
    super.initState();
    _imgFocusNode.addListener(_updateImagem);
  }

  void _updateImagem() {
    if (urlValida(_imgControler.text)) {
      setState(() {});
    }
  }

  bool urlValida(String url) {
    bool protValido = url.toLowerCase().startsWith('http://') ||
        url.toLowerCase().startsWith('https://');
    bool extValida = url.toLowerCase().endsWith('.png') ||
        url.toLowerCase().endsWith('.jpg') ||
        url.toLowerCase().endsWith('.jpeg');
    return protValido && extValida;
  }

  @override
  void dispose() {
    super.dispose();
    _prFocusNode.dispose();
    _dsFocusNode.dispose();
    _imgFocusNode.removeListener(_updateImagem);
    _imgFocusNode.dispose();
  }

  void _saveForm() {
    bool estaValido = _form.currentState.validate();

    if (!estaValido) return;

    _form.currentState.save();

    final produto = CceProdutoModel(
      abrev: _formDados['abrev'],
      descr: _formDados['descr'],
      preco: _formDados['preco'],
      imagemUrl: _formDados['imagemUrl'],
    );

    Provider.of<CceProdutoProvider>(context, listen: false)
        .addCceProduto(produto);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manutenção de Produto'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              _saveForm();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Titulo'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_prFocusNode);
                },
                onSaved: (value) => _formDados['abrev'] = value,
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return 'Informe uma abreviatura valida!';
                  }
                  return null;
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
                onSaved: (value) => _formDados['preco'] = double.parse(value),
                validator: (value) {
                  var prEco = double.tryParse(value);
                  if (value.trim().isEmpty || prEco == null || prEco <= 0.00) {
                    return 'Informe um valor valido para o produto!';
                  }
                  return null;
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
                onSaved: (value) => _formDados['descr'] = value,
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return 'Informe uma descrição para o produto!';
                  }
                  return null;
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
                      controller: _imgControler,
                      onFieldSubmitted: (_) {
                        _saveForm();
                      },
                      onSaved: (value) => _formDados['imagemUrl'] = value,
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return 'Informe um caminho para a imagem valido!';
                        }
                        if (!urlValida(value.trim())) {
                          return 'Informe http(s) e um tipo valido (png,jpg,jpeg)!';
                        }
                        return null;
                      },
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

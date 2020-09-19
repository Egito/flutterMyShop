import '../models/cce_produto_model.dart';

final DUMMY_PRODUTOS = [
  CceProdutoModel(
    id: 'p1',
    abrev: 'Red Shirt',
    descr: 'A red shirt - it is pretty red!',
    preco: 29.99,
    imagemUrl:
        'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
  ),
  CceProdutoModel(
    id: 'p2',
    abrev: 'Trousers',
    descr: 'A nice pair of trousers.',
    preco: 59.99,
    imagemUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
  ),
  CceProdutoModel(
    id: 'p3',
    abrev: 'Yellow Scarf',
    descr: 'Warm and cozy - exactly what you need for the winter.',
    preco: 19.99,
    imagemUrl: 'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
  ),
  CceProdutoModel(
    id: 'p4',
    abrev: 'A Pan',
    descr: 'Prepare any meal you want.',
    preco: 49.99,
    imagemUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
  ),
];

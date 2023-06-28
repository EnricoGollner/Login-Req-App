import 'dart:convert';

import 'package:flutter_application_diy/app/data/http/exceptions.dart';
import 'package:flutter_application_diy/app/data/http/http_client.dart';
import 'package:flutter_application_diy/app/data/models/produto_model.dart';

abstract class IProdutoRepository {
  Future<List<ProdutoModel>> getProdutos();
}

class ProdutoRepository implements IProdutoRepository {
  final IHttpClient client;

  ProdutoRepository(
      {required this.client}); // Construtor - parâmetro obrigatório

  @override
  Future<List<ProdutoModel>> getProdutos() async {
    final response = await client.get(
      url: 'https://dummyjson.com/products',
    );

    if (response.statusCode == 200) {
      final List<ProdutoModel> produtos = [];

      final body = jsonDecode(response
          .body); // a resposta vem em formato de String e transforma essa String em um map,

      body['products'].map((item) {
        // o item já é um mapa do produto em questão.
        final ProdutoModel produto = ProdutoModel.fromMap(item);

        produtos.add(produto);
      }).toList();

      return produtos;
    } else if (response.statusCode == 404) {
      throw NotFoundException(
          'A URL informada não é válida. Não encontramos nada.');
    } else {
      throw Exception('Não foi possível carregar os produtos');
    }
  }
}

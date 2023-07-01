import 'dart:convert';

import 'package:flutter_application_diy/app/data/http/exceptions.dart';
import 'package:flutter_application_diy/app/data/http/http_client.dart';
import 'package:flutter_application_diy/app/data/models/usuario_model.dart';
import 'package:http/http.dart';

abstract class IUsuarioRepository {
  Future<List<UsuarioModel>> getUsuarios();
}

class UsuarioRepository implements IUsuarioRepository {
  UsuarioRepository({required this.client});

  final IHttpClient client;

  @override
  Future<List<UsuarioModel>> getUsuarios() async {
    final Response response =
        await client.get(url: 'https://dummyjson.com/users');

    if (response.statusCode == 200) {
      final List<UsuarioModel> users = [];

      final body = jsonDecode(response.body);

      body['users'].map((user) {
        final usuario = UsuarioModel.fromMap(user);

        users.add(usuario);
      }).toList();

      return users;
    } else if (response.statusCode == 404) {
      throw NotFoundException('Usuarios não encontrados para validação');
    } else {
      throw Exception('Não foi possível realizar o request para validação');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_diy/app/data/http/exceptions.dart';
import 'package:flutter_application_diy/app/data/repositories/usuario_repository.dart';

import '../../../data/models/usuario_model.dart';

class UsuarioStore {
  final IUsuarioRepository repository;

  UsuarioStore({required this.repository});

  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  final ValueNotifier<List<UsuarioModel>> state = ValueNotifier([]);

  final ValueNotifier<String> erro = ValueNotifier<String>('');

  Future getUsuarios() async {
    isLoading.value = true;

    try {
      final result = await repository.getUsuarios();
      state.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    }

    isLoading.value = false;
  }
}

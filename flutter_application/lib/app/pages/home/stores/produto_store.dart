import 'package:flutter/material.dart';
import 'package:flutter_application_diy/app/data/http/exceptions.dart';
import 'package:flutter_application_diy/app/data/repositories/produto_repository.dart';

import '../../../data/models/produto_model.dart';

class ProdutoStore {
  final IProdutoRepository repository;

  ProdutoStore({required this.repository});

  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  final ValueNotifier<List<ProdutoModel>> state = ValueNotifier([]);

  final ValueNotifier<String> erro = ValueNotifier<String>('');

  Future getProdutos() async {
    isLoading.value = true;

    try {
      final result = await repository.getProdutos();
      state.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    }

    isLoading.value = false;
  }
}

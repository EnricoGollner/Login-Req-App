import 'package:flutter/material.dart';
import 'package:flutter_application_diy/app/data/http/exceptions.dart';
import 'package:flutter_application_diy/app/data/repositories/produto_repository.dart';

import '../../../data/models/produto_model.dart';

class ProdutoStore {
  final IProdutoRepository repository;

  ProdutoStore({required this.repository});

  // Quando trabalhamos com assync aqui no Flutter, existem pelo menos  3 tipos de estados que acontecem nesse momento, que seriam:

  //  variável reativa para o Loading: - Enquanto realiza a tarefa que leva um tempo para ser finalizada
  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  // variável reativa para o State: - quando termina a tarefa e atualiza o estado da nossa tela com o resultado da resposta
  final ValueNotifier<List<ProdutoModel>> state = ValueNotifier([]);

  // variável reativa para o Erro: - quando termina a tarefa mas finaliza com erro ou não consegue terminar a tarefa
  final ValueNotifier<String> erro = ValueNotifier<String>('');

  // para que essas variáveis sejam observáveis, utilizamos a classe ValueNotifier.

// para atualizar os valores das variáveis, precisamos fazer uma requisição ao nosso produto_repositorio
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

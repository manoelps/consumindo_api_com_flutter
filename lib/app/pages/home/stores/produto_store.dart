import 'package:consumindo_api_com_flutter/app/data/http/exceptions.dart';
import 'package:consumindo_api_com_flutter/app/data/models/produto_model.dart';
import 'package:consumindo_api_com_flutter/app/data/repositories/produto_repository.dart';
import 'package:flutter/material.dart';

class ProdutoStore {
  //implementa o repositorio, criando um contrato
  final IProdutoRepository repository;

  //! monitorar esses estados na tela
  //! com o uso do ValueNotifier essas 3 variaveis serão observadas na tela de exibicao dos produtos

  // Variável reativa para o loading
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  // Variável reativa para o state (guarda a lista de produtos)
  final ValueNotifier<List<ProdutoModel>> state =
      ValueNotifier<List<ProdutoModel>>([]);

  // Variável reativa para o erro
  final ValueNotifier<String> erro = ValueNotifier<String>('');

  // inicializa a implementacao do repositorio como obrigatorio
  ProdutoStore({required this.repository});

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

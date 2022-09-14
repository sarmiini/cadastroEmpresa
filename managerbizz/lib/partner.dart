// ignore_for_file: prefer_final_fields

import 'address.dart';

class PessoaFisica {
  String nome;
  String _cpf; 
  Endereco endereco;
  PessoaFisica(
    this._cpf, {
    required this.nome,
    required this.endereco,
  });

  

//VALIDATE  CPF
  String get cpf {
    
    if (_cpf.length == 11) {
      return "${_cpf.substring(0, 3)}.${_cpf.substring(3, 6)}.${_cpf.substring(6, 9)} -${_cpf.substring(9, 11)} ";
    } else {
      return "Este documento nao e valido!";
    }
  }
}

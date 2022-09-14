// ignore_for_file: prefer_final_fields

import 'address.dart';
import 'partner.dart';
import 'package:uuid/uuid.dart';

class Empresa {
  late String _id = Uuid().v1(); 
  String _cnpj;
  final horario = DateTime.now();
  String razaoSocial;
  String nomeFantasia;
  String _telefone;
  PessoaFisica meuSocio;
  Endereco endereco;

  Empresa(
    // CONSTRUTOR
    this._cnpj,
    this._telefone, {
    required this.razaoSocial,
    required this.nomeFantasia,
    required this.meuSocio,
    required this.endereco,
  });

  String get id => _id; 
//CNPJ 
  String get cnpj {
   
    if (_cnpj.length == 14) {
      return "${_cnpj.substring(0, 2)}.${_cnpj.substring(2, 5)}.${_cnpj.substring(5, 8)}/${_cnpj.substring(8, 12)}-${_cnpj.substring(12, 14)}";
    } else {
      return "cnpj incorreto";
    }
  }

  String get telefone {
    if (_telefone.length == 10) {
      return "(${_telefone.substring(0, 2)})${_telefone.substring(2, 6)}-${_telefone.substring(6, 10)}";
    } else if (_telefone.length == 11) {
      return "(${_telefone.substring(0, 2)})${_telefone.substring(2, 7)}-${_telefone.substring(7, 11)}";
    } else {
      return "Telefone invalido!";
    }
  }

  String toString() {
   
    return '''
ID: $id 
CNPJ: $cnpj Data Cadastro: $horario
Razão Social: $razaoSocial 
Nome Fantasia: $nomeFantasia
Telefone: $telefone
Endereço: ${endereco.rua}, ${endereco.numero}, ${endereco.bairro}, ${endereco.estado}, ${endereco.cep}
Socio: 
CPF: ${meuSocio.cpf}
Nome ${meuSocio.nome}
Endereço: ${meuSocio.endereco.rua}, ${meuSocio.endereco.numero}, ${meuSocio.endereco.bairro}, ${meuSocio.endereco.estado}, ${meuSocio.endereco.cep}

''';
  }
}

import 'dart:io';

import 'package:managerbizz/address.dart';
import 'package:managerbizz/business.dart';
import 'package:managerbizz/partner.dart';

void main() {
  int? escolhas;
  do {
    print("BEM VINDO AO GERENCIADOR! <3  \nO QUE VOCÊ DESEJA FAZER?");
    print('''
1 - Cadastrar uma nova empresa
2 - Buscar Empresa cadastrada por CNPJ
3 - Buscar Empresa por CPF do Sócio
4 - Listar Empresas cadastradas em ordem alfabética (baseado na Razão Social)
5 - Excluir uma empresa (por ID)
6 - Sair''');
    escolhas = int.parse(stdin.readLineSync()!);

    if (escolhas == 1) {
      digiteEnderecoEmpresa();
    } else if (escolhas == 2) {
      if (guardarEmpresa.isEmpty) {
        print("Você não tem empresa cadastrada.");
      } else {
        procurarCnpj();
      }
    } else if (escolhas == 3) {
      if (guardarEmpresa.isEmpty) {
        print("Você não tem empresa cadastrada.");
      } else {
        procurarCpf();
      }
    } else if (escolhas == 4) {
      if (guardarEmpresa.isEmpty) {
        print("Você não tem empresa cadastrada.");
      } else {
        listarEmpresaOrdem();
      }
    } else if (escolhas == 5) {
      if (guardarEmpresa.isEmpty) {
        print("Você não tem empresa cadastrada.");
      } else {
        excluirEmpresaId();
      }
    }
  } while (escolhas != 6);
}

List<Empresa> guardarEmpresa = [];

void listarEmpresaOrdem() {
  guardarEmpresa.sort((a, b) =>
      (a.razaoSocial).toLowerCase().compareTo(b.razaoSocial.toLowerCase()));
  print(guardarEmpresa);
}

//SEARCH FOR  CPF .
void procurarCpf() {
  print("Digite o CPF do sócio para buscar Empresa ");
  var buscaCpf = stdin.readLineSync()!;

  if (int.tryParse(buscaCpf) == null) {
    // isso aqui verifica se usuario digitou apenas numeros.
    print('DIGITE APENAS NUMEROS!');
  } else {
    guardarEmpresa.where((item) => item.meuSocio.cpf == buscaCpf);
    print(guardarEmpresa);
  }
}

//SEARCH FOR CNPJ .
void procurarCnpj() {
  print("Digite o CNPJ para  buscar Empresa ");
  var buscaCnpj = stdin.readLineSync()!;
  if (int.tryParse(buscaCnpj) == null) {
    print('DIGITE APENAS NUMEROS!');
  } else {
    guardarEmpresa.where((item) => item.cnpj == buscaCnpj);
    print(guardarEmpresa);
  }
}

//DELETE BUSINESS USING ID
void excluirEmpresaId() {
  print("Digite o ID para excluir Empresa");
  var deletarId = stdin.readLineSync()!;

  if (guardarEmpresa.isNotEmpty) {
    guardarEmpresa.removeWhere((item) => item.id == deletarId);
  }
}

//TO GET INFOS
void digiteEnderecoEmpresa() {
  print("===================Dados da Empresa=====================");
  print("Digite o CNPJ");
  var cnpj = (stdin.readLineSync()!);
  print("Digite a Razão Social");
  var razaoSocial = (stdin.readLineSync()!);
  print("Digite o Nome Fantasia");
  var nomeFantasia = (stdin.readLineSync()!);
  print("Digite um Telefone com DDD");
  var telefone = (stdin.readLineSync()!);
  print("=================Endereço da Empresa====================");
  print("Digite Rua");
  var rua = (stdin.readLineSync()!);
  print("Digite Número e Complemento");
  var numero = (stdin.readLineSync()!);
  print("Digite Bairro");
  var bairro = (stdin.readLineSync()!);
  print("Digite Estado");
  var estado = (stdin.readLineSync()!);
  print("Digite o CEP");
  var cep = (stdin.readLineSync()!);
  // MEUSOCIO STARTS HERE!

  print("===================Sócio da Empresa=====================");

  print("     Agora digite os dados do Sócio da Empresa!");

  print("Digite o  Nome Completo ");
  var nome = (stdin.readLineSync()!);
  print("Digite o  CPF");
  var cpf = (stdin.readLineSync()!);

  print("digite Endereco");
  var ruapf = (stdin.readLineSync()!);
  print("Digite Número e Complemento ");
  var numeropf = (stdin.readLineSync()!);
  print("Digite Bairro");
  var bairropf = (stdin.readLineSync()!);
  print("Digite Estado");
  var estadopf = (stdin.readLineSync()!);
  print("Digite CEP");
  var ceppf = (stdin.readLineSync()!);
  guardarEmpresa.add(Empresa(
      cnpj,
      razaoSocial: razaoSocial,
      nomeFantasia: nomeFantasia,
      telefone,
      meuSocio: PessoaFisica(cpf,
          nome: nome,
          endereco: Endereco(
              rua: ruapf,
              numero: numeropf,
              bairro: bairropf,
              estado: estadopf,
              ceppf)),
      endereco: Endereco(cep,
          rua: rua, numero: numero, bairro: bairro, estado: estado)));
}

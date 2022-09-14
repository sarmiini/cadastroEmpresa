// ignore_for_file: prefer_final_fields

class Endereco {
  String rua;
  String numero;
  String? complemento;
  String bairro;
  String estado;
  String _cep;

  Endereco(
    this._cep, {
    required this.rua,
    required this.numero,
    required this.bairro,
    required this.estado,
  });

  String get cep {
    if (_cep.length == 8) {
      return "${_cep.substring(0, 5)}-${_cep.substring(5, 8)} ";
    } else {
      return "Este documento nao e valido!";
    }
  }
}

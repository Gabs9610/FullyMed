// ignore_for_file: public_member_api_docs, sort_constructors_first
class UsuarioModel {
  int? id;
  String? nome;
  String? cpf;
  String? conselhoClasse;
  String? estadoEmissor;
  String? registroConselhoClasse;
  String? email;
  String? user;
  String? password;
  DateTime? dtCriacao;
  DateTime? dtAtualizacao;

  UsuarioModel();

  UsuarioModel.create(
    this.id,
    this.nome,
    this.cpf,
    this.conselhoClasse,
    this.estadoEmissor,
    this.registroConselhoClasse,
    this.email,
    this.user,
    this.dtCriacao,
    this.dtAtualizacao,
  );

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel.create(
      map['id']?.toInt() ?? 0,
      map['nome'] ?? '',
      map['cpf'] ?? '',
      map['conselho_classe'] ?? '',
      map['estado_emissor'] ?? '',
      map['registro_conselho_classe'] ?? '',
      map['email'] ?? '',
      map['user'] ?? '',
      map['dt_criacao'],
      map['dt_atualizacao'],
    );
  }

  factory UsuarioModel.fromUser(Map map) {
    return UsuarioModel()
      ..id = map['id']?.toInt()
      ..password = map['password'];
  }

  factory UsuarioModel.fromCpf(Map map) {
    return UsuarioModel()
      ..id = map['id']?.toInt()
      ..user = map['user']
      ..password = map['password'];
  }

  factory UsuarioModel.fromRequest(Map map) {
    return UsuarioModel()
      ..nome = map['nome']
      ..cpf = map['cpf']
      ..conselhoClasse = map['conselhoClasse']
      ..estadoEmissor = map['estadoEmissor']
      ..registroConselhoClasse = map['registroConselhoClasse']
      ..email = map['email']
      ..user = map['user']
      ..password = map['password'];
  }

  Map toJson() {
    return {
      'id': id,
      'nome': nome,
      'cpf': cpf,
      'conselhoClasse': conselhoClasse,
      'estadoEmissor': estadoEmissor,
      'registroConselhoClasse': registroConselhoClasse,
      'email': email,
      'user': user,
    };
  }

  @override
  String toString() {
    return 'UsuarioModel(id: $id, nome: $nome, cpf: $cpf, conselho_classe: $conselhoClasse, estado_emissor: $estadoEmissor, registro_conselho_classe: $registroConselhoClasse, email: $email, user $user, is_ativo: $dtCriacao, dt_atualizacao: $dtAtualizacao)';
  }
}

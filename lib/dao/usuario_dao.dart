import '../infra/database/db_cofiguration.dart';
import '../models/usuario_model.dart';
import 'dao.dart';

class UsuarioDAO implements DAO<UsuarioModel> {
  final DBConfiguration _dbConfiguration;
  UsuarioDAO(this._dbConfiguration);

  @override
  Future<bool> create(UsuarioModel value) async {
    var result = await _dbConfiguration.execQuery(
      'INSERT INTO FullyMed.usuarios (nome, cpf, conselho_classe, estado_emissor, registro_conselho_classe, email, user, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
      [
        value.nome,
        value.cpf,
        value.conselhoClasse,
        value.estadoEmissor,
        value.registroConselhoClasse,
        value.email,
        value.user,
        value.password
      ],
    );
    return result.affectedRows > 0;
  }

  @override
  Future<bool> delete(int id) async {
    var result = await _dbConfiguration.execQuery(
      'DELETE from FullyMed.usuarios where id = ?',
      [id],
    );
    return result.affectedRows > 0;
  }

  @override
  Future<List<UsuarioModel>> findAll() async {
    var result =
        await _dbConfiguration.execQuery('SELECT * FROM FullyMed.usuarios');
    return result
        .map((r) => UsuarioModel.fromMap(r.fields))
        .toList()
        .cast<UsuarioModel>();
  }

  @override
  Future<UsuarioModel?> findOne(int id) async {
    var result = await _dbConfiguration.execQuery(
      'SELECT * FROM FullyMed.usuarios where id = ?',
      [id],
    );
    return result.affectedRows == 0
        ? null
        : UsuarioModel.fromMap(result.first.fields);
  }

  @override
  Future<bool> update(UsuarioModel value) async {
    var result = await _dbConfiguration.execQuery(
      'UPDATE FullyMed.usuarios set nome = ?, conselho_classe = ?, estado_emissor = ?, registro_conselho_classe = ?, password = ? where cpf = ?',
      [
        value.nome,
        value.conselhoClasse,
        value.estadoEmissor,
        value.registroConselhoClasse,
        value.password,
        value.cpf,
      ],
    );
    return result.affectedRows > 0;
  }

  Future<UsuarioModel?> findByUser(String user) async {
    var result = await _dbConfiguration
        .execQuery('SELECT * FROM FullyMed.usuarios where user = ?', [user]);
    return result.affectedRows == 0
        ? null
        : UsuarioModel.fromUser(result.first.fields);
  }

  Future<UsuarioModel?> findByCpf(String? cpf) async {
    var result = await _dbConfiguration
        .execQuery('SELECT * FROM FullyMed.usuarios where cpf = ?', [cpf]);
    result.affectedRows == 0 ? null : UsuarioModel.fromCpf(result.first.fields);
  }
}

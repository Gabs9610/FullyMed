import 'package:mysql1/mysql1.dart';
import 'db_cofiguration.dart';

class MySqlDBConfiguration implements DBConfiguration {
  MySqlConnection? _connection;

  @override
  Future<MySqlConnection> get conection async {
    if (_connection == null) {
      _connection = await createConection();
    }
    if (_connection == null)
      throw Exception('[ERROR/DB] -> Failer Ceate Conection');
    return _connection!;
  }

  @override
  Future<MySqlConnection> createConection() async =>
      await MySqlConnection.connect(
        ConnectionSettings(
          host: 'localhost',
          port: 3306,
          user: 'root',
          password: 'root',
          db: 'FullyMed',
        ),
      );

  @override
  execQuery(String sql, [List? params]) async {
    var conn = await this.conection;
    return await conn.query(sql, params);
  }
}

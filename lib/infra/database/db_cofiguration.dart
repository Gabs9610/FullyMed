abstract class DBConfiguration {
  Future<dynamic> createConection();

  Future<dynamic> get conection;

  execQuery(String sql, [List? params]);
}

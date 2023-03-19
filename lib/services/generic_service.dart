abstract class GenericService<Type> {
  Future<Type?> findOne(int id);
  Future<List<Type>> findAll();
  Future<bool> save(Type value);
  Future<bool> delete(int id);
}

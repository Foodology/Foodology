DatabaseService._internal();
static final DatabaseService _singleton = DatabaseService._internal();
factory DatabaseService() {
  return _singleton;
}
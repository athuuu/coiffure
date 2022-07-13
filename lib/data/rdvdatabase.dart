import 'package:coiffeur/model/rdv.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfDatabase {
  static final SqfDatabase instance = SqfDatabase._init();

  static Database? _database;

  SqfDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('rdv.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 2, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const integerType = 'INTEGER NOT NULL';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE $planning (
    ${Rdvfields.id} $idType,
    ${Rdvfields.number} $integerType,
    ${Rdvfields.prestation} $textType,
    ${Rdvfields.nom} $textType,
    ${Rdvfields.prenom} $textType,
    ${Rdvfields.createdTime} $textType,


    )
  ''');
  }

  Future<Rdv> create(Rdv rdv) async {
    final db = await instance.database;

    // final json = rdv.toJson();
    //  const columns =
    //      '${Rdvfields.prestation}, ${Rdvfields.nom}, ${Rdvfields.createdTime}';

    //  const values =
    //      '${Rdvfields.prestation}, ${Rdvfields.nom}, ${Rdvfields.createdTime}';

    // final id = await db
    //    .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(planning, rdv.toJson());
    return rdv.copy(id: id);
  }

  Future<Rdv> readRdv(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      planning,
      columns: Rdvfields.values,
      where: '${Rdvfields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Rdv.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Rdv>> readAllRdv() async {
    final db = await instance.database;

    const orderBy = '${Rdvfields.createdTime} ASC';
    //final result = await db.rawQuery('SELECT * FROM $planning ORDER BY $orderBy');

    final result = await db.query(planning, orderBy: orderBy);

    return result.map((json) => Rdv.fromJson(json)).toList();
  }

  Future<int> update(Rdv rdv) async {
    final db = await instance.database;

    return db.update(
      planning,
      rdv.toJson(),
      where: '${Rdvfields.id} =  ?',
      whereArgs: [rdv.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      planning,
      where: '${Rdvfields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}

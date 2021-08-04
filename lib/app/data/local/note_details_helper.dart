import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

/// Usage
///
/// Get database object first
/// final dbHelper = DatabaseHelper.instance;
///
/// Create a note
/// await dbHelper.createNote(
///   beneficiaryId: needyFamilyId,
///   note: theNote,
/// );
///
/// Get List of notes for a beneficiary
/// await dbHelper.getNotes(beneficiaryId: needyFamilyId);
///
/// Edit a note
/// await dbHelper.editNote(
///   noteId: idOfTheNote,
///   note: updatedNote,
/// );
///
/// Delete a note
/// await dbHelper.deleteNote(
///   noteId: idOfTheNote,
/// );

///Make a helper class in different file under [app>data>local] with name 'database_helper.dart'
class DatabaseHelper {
  static final _databaseName = 'six.db';
  static final _databaseVersion = 1;

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;
  Future<Database> get database async {
    return _database ??= await _initDatabase();
  }

  // this opens the database (and creates it if it doesn't exist)
  Future<Database> _initDatabase() async {
    var documentsDirectory = await getApplicationDocumentsDirectory();
    var path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  // SQL code to create the database table
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $notesTable(
      $columnId INTEGER PRIMARY KEY,
      $columnBeneficiaryId TEXT NOT NULL,
      $columnNote TEXT NOT NULL,
      $columnCreatedOn BIGINT NOT NULL
    )
    ''');
  }

  Future<void> _onUpgrade(Database db, int versionOld, int versionNew) async {
    print('in onUpgrade');
    print('New Version : ' +
        versionNew.toString() +
        ' :: Old Version : ' +
        versionOld.toString());
  }

  //Tables
  static final notesTable = 'notes';

  ///Columns for [notesTable]
  static final columnId = 'id';
  static final columnBeneficiaryId = 'ben_id';
  static final columnNote = 'note';
  static final columnCreatedOn = 'createdOn';

  Future<int> createNote({
    required String beneficiaryId,
    required String note,
  }) async {
    var db = await instance.database;
    return db.insert(
      notesTable,
      {
        columnBeneficiaryId: beneficiaryId,
        columnNote: note,
        columnCreatedOn: DateTime.now().millisecondsSinceEpoch,
      },
    );
  }

  Future<List<Map<String, Object?>>> getNotes(
      {required String beneficiaryId}) async {
    var db = await instance.database;
    return await db.query(
      notesTable,
      where: '$columnBeneficiaryId = ?',
      whereArgs: [beneficiaryId],
      orderBy: '$columnCreatedOn DESC',
    );
  }

  Future<int> deleteNote({required int noteId}) async {
    var db = await instance.database;
    return await db.delete(
      notesTable,
      where: '$columnId = ?',
      whereArgs: [noteId],
    );
  }

  Future<int> editNote({required int noteId, required String note}) async {
    var db = await instance.database;
    return await db.update(
      notesTable,
      {
        columnNote: note,
      },
      where: '$columnId = ?',
      whereArgs: [noteId],
    );
  }
}

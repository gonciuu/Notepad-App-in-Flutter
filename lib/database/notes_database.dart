import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class NotesDatabase{

  setDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'db_notepad');
    Database database = await openDatabase(path,version: 1,onCreate:(Database db,int version) async{
      await db.execute('CREATE TABLE Notes (id INTEGER PRIMARY KEY, title TEXT, description TEXT, category TEXT, isStar INTEGER, date TEXT, time TEXT)');
    });
    return database;
  }
}
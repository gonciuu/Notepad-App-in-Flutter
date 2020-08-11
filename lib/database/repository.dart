
import 'package:enotepad/database/notes_database.dart';
import 'package:sqflite/sqflite.dart';

class Repository{

  NotesDatabase _notesDatabase = NotesDatabase();

  static Database _database;


  Future<Database> get database async{
    if(_database != null) return _database;
    _database = await _notesDatabase.setDatabase();
    return _database;
  }

   Future<int> insertData(table,Map<String,dynamic> data) async{
    Database db = await database;
    return await db.insert(table, data);
  }

  Future<int> updateData(table,Map<String,dynamic> data) async{
    Database db = await database;
    return await db.update(table, data,where: "id=?",whereArgs: [data['id']]);
  }

  Future<int> deleteData(table,int id) async{
    Database db = await database;
    return await db.delete(table,where: "id = ?",whereArgs:[id]);
  }

  

}
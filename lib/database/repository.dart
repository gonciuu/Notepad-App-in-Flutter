
import 'package:enotepad/database/notes_database.dart';
import 'package:sqflite/sqflite.dart';

class Repository{

  NotesDatabase _notesDatabase = NotesDatabase();

  static Database _database;


  //init database
  Future<Database> get database async{
    if(_database != null) return _database;
    _database = await _notesDatabase.setDatabase();
    return _database;
  }

  //insert data to database
   Future<int> insertData(table,Map<String,dynamic> data) async{
    Database db = await database;
    return await db.insert(table, data);
  }

  //update data in database
  Future<int> updateData(table,Map<String,dynamic> data) async{
    Database db = await database;
    return await db.update(table, data,where: "id=?",whereArgs: [data['id']]);
  }

  //delete data from database
  Future<int> deleteData(table,int id) async{
    Database db = await database;
    return await db.delete(table,where: "id = ?",whereArgs:[id]);
  }

  //get all data from database
  Future<List<Map<String,dynamic>>> getAllData(String table) async{
    Database db = await database;
    return await db.query(table);
  }

  //get data by id in database
  Future<Map<String,dynamic>> getById(String table,int id) async{
    Database db = await database;
    List<Map<String,dynamic>> list =  await db.query(table,where: "id=?",whereArgs: [id]);
    if(list.length > 0) return list.first; else return null;
  }

}
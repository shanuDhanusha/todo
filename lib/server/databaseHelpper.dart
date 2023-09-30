import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/Todos.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
class databaseHelpper {
  static const int _version = 1;
  static const String _dbName = "todo.db";

  static Future<Database> getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async =>
        await db.execute(
            '''
          CREATE TABLE todo (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            exDate TEXT,
            discription TEXT,
            startTime TEXT,
            endTime TEXT,
            notificationTime TEXT,
            notificationNote TEXT,
            color INTEGER
          );'''
        ),version: _version
    );
  }

  static Future<int> addTodo(Todos todos)async {
    final db= await getDB();
    return await db.insert("todo", todos.toJson(),
        conflictAlgorithm:ConflictAlgorithm.replace
    );
  }

  static Future<int>updateTodos(Todos todos)async{
    final db=await getDB();
    return await db.update("todo", todos.toJson(),
       where: 'id=?',whereArgs: [todos.id],
      conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  static Future<int>deleteTodos(Todos todos)async{
    final db=await getDB();
    return await db.delete("todo",
        where: 'id=?',whereArgs: [todos.id],
    );
  }

  static Future<List<Todos>?>getTodo()async{
    final db=await getDB();
    final List<Map<String,dynamic>>maps=await db.query("todo");
        if(maps.isEmpty){
          return null;
        }
    List<Todos> todosList = List.generate(maps.length, (index) {
      return Todos(
        id: maps[index]['id'],
        title: maps[index]['title'],
        exDate: maps[index]['exDate'],
        discription: maps[index]['discription'],
        startTime: maps[index]['startTime'],
        endTime: maps[index]['endTime'],
        notificationTime: maps[index]['notificationTime'],
        notificationNote: maps[index]['notificationNote'],
        color: maps[index]['color'],
      );
    });
    print("hummmmmmmmmmmmmm${todosList[0].startTime}");
    return todosList;

  }


}

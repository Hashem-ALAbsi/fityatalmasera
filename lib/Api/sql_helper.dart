// import 'dart:typed_data';

// import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart' as sql;

// import '../models/playlist_model.dart';

class SqlHelper {
  static Future<void> createTableSong(sql.Database database) async {
    await database.execute('''CREATE TABLE songs(
id INTEGER PRIMARY KEY NOT NULL,
title TEXT NOT NULL,
description TEXT,
url TEXT,
createAT TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)''');
  }

  static Future<void> createFirestTableSongs(sql.Database database) async {
    await database.execute('''CREATE TABLE firestsongs(
id INTEGER PRIMARY KEY NOT NULL,
title TEXT NOT NULL,
description TEXT,
url TEXT,
createAT TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)''');
  }
// fkid INTEGER NOT NULL,
// isfavorit BOOL,
  //AUTOINCREMENT
  //isfavorit bool,
  //coverUrl TEXT,

  static Future<sql.Database> db() async {
    return sql.openDatabase('DatabaseFityatalmasera.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createFirestTableSongs(database);
      await createTableSong(database);
    });
  }

  // static Future<sql.Database> firestdb() async {
  //   return sql.openDatabase('DatabaseRafahia.db', version: 2,
  //       onCreate: (sql.Database database, int version) async {
  //     await createFirestTableSongs(database);
  //   });
  // }

  static Future<int> createSong(
      int fkid, String title, String description, String url) async {
    final db = await SqlHelper.db();

    final data = {
      'id': fkid,
      'title': title,
      'description': description,
      'url': url,
    };
    // 'isfavorit': isfavorit,
    // 'isfavorit': isfavorit
    final id = await db.insert('songs', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<int> createfirestSong(
      int fkid, String title, String description, String url) async {
    final db = await SqlHelper.db();

    final data = {
      'id': fkid,
      'title': title,
      'description': description,
      'url': url,
    };
    // 'isfavorit': isfavorit,
    // 'isfavorit': isfavorit
    final id = await db.insert('firestsongs', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getSongs() async {
    final db = await SqlHelper.db();
    // final r = db.query('songs', orderBy: "id DESC") as List<Playlist>;
    return db.query('songs', orderBy: "id DESC");
  }

  static Future<List<Map<String, dynamic>>> getfirestSongs() async {
    final db = await SqlHelper.db();
    // final r = db.query('songs', orderBy: "id DESC") as List<Playlist>;
    return db.query('firestsongs', orderBy: "id DESC");
  }

  static Future<List<Map<String, dynamic>>> getSong(int id) async {
    final db = await SqlHelper.db();
    return db.query('songs', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<List<Map<String, dynamic>>> getfirestSong(int id) async {
    final db = await SqlHelper.db();
    return db.query('firestsongs', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<List<Map<String, dynamic>>> getSongBufkid(int fkid) async {
    final db = await SqlHelper.db();
    return db.query('songs', where: "id = ?", whereArgs: [fkid], limit: 1);
  }

  static Future<List<Map<String, dynamic>>> getfirestSongBufkid(
      int fkid) async {
    final db = await SqlHelper.db();
    return db.query('firestsongs',
        where: "id = ?", whereArgs: [fkid], limit: 1);
  }

  static Future<bool> getSongByisfavoret() async {
    final db = await SqlHelper.db();
    try {
      final r = db.query('songs',
          where: "isfavorit = ?", whereArgs: [true], limit: 1);
      if (r == null || r == []) {
        return false;
      } else {
        return true;
      }
    } catch (ex) {
      return false;
    }
    // return
  }

  static Future<int> updateSong(
      int id, int fkid, String title, String description, String url) async {
    final db = await SqlHelper.db();
    final data = {
      'fkid': fkid,
      'title': title,
      'description': description,
      'url': url,
      'createAT': DateTime.now().toString()
    };
    // 'isfavorit': isfavorit,
    final result =
        await db.update('songs', data, where: 'id = ?', whereArgs: [id]);
    return result;
  }

  static Future<void> deleteSong(int id) async {
    final db = await SqlHelper.db();
    try {
      await db.delete('songs', where: "id = ?", whereArgs: [id]);
    } catch (er) {}
  }

  static Future<void> deletefirestSong(int id) async {
    final db = await SqlHelper.db();
    try {
      await db.delete('firestsongs', where: "id = ?", whereArgs: [id]);
    } catch (er) {}
  }

  static Future<int> isfavoritSong(int id, bool isfavorit) async {
    final db = await SqlHelper.db();
    try {
      final data = {
        'isfavorit': isfavorit,
      };
      final result =
          await db.update('songs', data, where: 'id = ?', whereArgs: [id]);
      return result;
    } catch (er) {
      return 0;
    }
  }

  static Future<bool> isfavoritSongByid(int fkid) async {
    final db = await SqlHelper.db();
    try {
      // final data = {
      //   'isfavorit': isfavorit,
      // };
      final result =
          db.query('songs', where: "id = ?", whereArgs: [fkid], limit: 1);
      if (result == null || result == []) {
        return false;
      } else {
        return true;
      }
      // final result =
      //     await db.query('song', data, where: 'id = ?', whereArgs: [id]);
      // return result;
    } catch (er) {
      return false;
    }
  }

  static Future<bool> isfavoritfirestSongByid(int fkid) async {
    final db = await SqlHelper.db();
    try {
      // final data = {
      //   'isfavorit': isfavorit,
      // };
      final result =
          db.query('firestsongs', where: "id = ?", whereArgs: [fkid], limit: 1);
      if ( result == []) {
        // print(result);
        return false;
      } else {
        return true;
      }
      // final result =
      //     await db.query('song', data, where: 'id = ?', whereArgs: [id]);
      // return result;
    } catch (er) {
      // print(er);
      return true;
    }
  }
}

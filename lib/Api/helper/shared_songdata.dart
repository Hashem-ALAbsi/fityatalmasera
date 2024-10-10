import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/playlist_model.dart';

class SharedSongdata {
  static const String _favoretsong = "favoretsong";
  static late List<Playlist> statecfavoretsong = [];

  static Future<void> setList(List<String> list) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      // final li = json.encode(list.toString());
      // responsedata.map((e) => Companyaddlast.fromJson(e)).toList();
      // json.encode(list.toString());
      await prefs.setStringList(_favoretsong, list);
      // print(li);
    } catch (ex) {
      print(ex);
    }
    //print(token);
  }

  static Future<List<String>> getList() async {
    final prefs = await SharedPreferences.getInstance();
    final li = prefs.getStringList(_favoretsong) ?? [];
    // if (li == "1") {
    //   return [];
    // } else {
    //   // final value = json.decode(li);
    // }
    return li;
  }

  static Future<void> clearList() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  // static Future<bool> checktoken() async {
  //   String? _checktiken = await ApiToken.getToken();
  //   if(_checktiken.isEmpty)
  // }

  //تخزين التوكن2
  static Future<void> savetoken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final keyes = 'token';
    final value = token;
    prefs.setString(keyes, value);
  }

  static Future<Object?> readToken() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    //print(value);
    return value;
  }

  static void saveFavorites(List<Playlist> favoritePlaylists) async {
    // final favoritePlaylists = _playlists.where((p) => p.isFavorite).toList();
    await _savePlaylistsToDevice(favoritePlaylists);
  }

  static Future<void> _savePlaylistsToDevice(List<Playlist> playlists) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/favorites.json');
    await file.writeAsString(jsonEncode(playlists));
  }

  static Future<void> loadFavorites() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/favorites.json');
    if (await file.exists()) {
      final favoritePlaylistsJson = await file.readAsString();
      statecfavoretsong = jsonDecode(favoritePlaylistsJson) as List<Playlist>;

      // final favoritePlaylists = (jsonDecode(favoritePlaylistsJson) as List)
      //     .map((p) => Playlist.fromJson(p))
      //     .toList();
      // statecfavoretsong = favoritePlaylists as List;
      // _playlists = _playlists.map((p) {
      //   final favorite =
      //       favoritePlaylists.firstWhereOrNull((fp) => fp.title == p.title);
      //   return favorite != null ? favorite : p;
      // }).toList();
      // setState(() {});
    }
  }
}

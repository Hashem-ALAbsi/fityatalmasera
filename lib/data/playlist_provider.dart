import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fityatalmasera/data/playlist_data.dart';
import 'package:fityatalmasera/models/playlist_model.dart';

class PlaylistProvider extends ChangeNotifier {
  static final List<Playlist> playlistsong = PlaylistData.playlists;
  static final List<Playlist> favoretsong = [];

  UnmodifiableListView get cartSongs => UnmodifiableListView(playlistsong);
  UnmodifiableListView get cartFavoretSongs => UnmodifiableListView(favoretsong);

  // double get price => _cartItems.fold<double>(
  //     0.0, (previousValue, element) => previousValue += element.price);

  // Add Item
   void addSongOrdelet(Playlist playlist) {
    // var _isfovaret = _favoretsong.firstWhere((trip) => trip.id == playlist.id);
    bool r = isFovarite(playlist.id);
    if (r) {
      playlistsong.remove(playlist);
    } else {
      playlistsong.add(playlist);
    }

    notifyListeners();
    log("Item Added");
  }

  // void addSong(Playlist playlist) {
  //   _favoretsong.add(playlist);
  //   notifyListeners();
  // }

  // void remove(Playlist playlist) {
  //   _favoretsong.remove(playlist);
  //   notifyListeners();
  // }

  static bool isFovarite(int id) {
    return favoretsong.any((song) => song.id == id);
  }

  // Reset Cart
  void reset() {
    playlistsong.clear();
    notifyListeners();
  }
  //////////////////////////////////////////////////////////////
  ///favoret
  void addFavoretSongOrdelet(Playlist playlist) {
    // var _isfovaret = _favoretsong.firstWhere((trip) => trip.id == playlist.id);
    bool r = isFovarite(playlist.id);
    if (r) {
      favoretsong.remove(playlist);
    } else {
      favoretsong.add(playlist);
    }

    notifyListeners();
    log("Item Added");
  }


  // Reset Cart
  void resetfavoret() {
    favoretsong.clear();
    notifyListeners();
  }
}


// export 'playlist_card.dart';
/////////////////////////////////////////
// import 'dart:collection';
// import 'dart:math';

// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:technical_center/Api/sql_helper.dart';

// import '../Api/helper/shared_songdata.dart';
// import '../models/playlist_model.dart';
// import '../widgets/flutter_toast.dart';
// import 'playlist_data.dart';

// class PlayerController with ChangeNotifier {
//   final List<Playlist> playlistsong = PlaylistData.playlists;
//   // late List<Playlist> favoretsong = SharedSongdata.statecfavoretsong;
//   late List<Map<String, dynamic>> favoretsong = [];
//   late List<Playlist> filteredsong = PlaylistData.playlists;
//   late List<Map<String, dynamic>> filterfavoretsong = favoretsong;
//   bool isPlaying = false;
//   bool isLoop = false;
//   bool isShuffleEnabled = false;
//   bool isFavoritesMode = false;
//   int currentIndex = 0;
//   String titelsong = "قم باختيار نشيد لتشغيلة";
//   String titel = "الرئيسية";
//   late AudioPlayer player = AudioPlayer();
//   late AssetSource path;
//   Duration duration = Duration();
//   Duration position = Duration();

//   UnmodifiableListView get cartSongs => UnmodifiableListView(playlistsong);
//   UnmodifiableListView get cartFavoretSongs =>
//       UnmodifiableListView(favoretsong);
//   UnmodifiableListView get cartfilteredsong =>
//       UnmodifiableListView(filteredsong);
//   UnmodifiableListView get cartfilterfavoretsong =>
//       UnmodifiableListView(filterfavoretsong);

//   bool get isPlayings => isPlaying;
//   bool get isLoops => isLoop;
//   bool get isFavoritesModes => isFavoritesMode;
//   bool get isShuffleEnableds => isShuffleEnabled;
//   int get currentIndexs => currentIndex;
//   String get titelsongs => titelsong;
//   String get titels => titel;

//   void inopen() async {
//     filteredsong = playlistsong;
//     notifyListeners();
//   }
//   // Future<void> _getnumber() async {
//   //   int i = await SharedSongdata.getNumber();
//   //   if(i == 0){

//   //   }
//   // }

//   Future<void> playSelectedSong(int index) async {
//     try {
//       currentIndex = index;
//       notifyListeners();
//       await initPlayer();
//     } catch (ex) {}
//   }

//   Future<void> initPlayer() async {
//     try {
      
//       path = AssetSource(isFavoritesMode
//           ? filterfavoretsong[currentIndex]['url']
//           : filteredsong[currentIndex].url);
//       titelsong = isFavoritesMode
//           ? filterfavoretsong[currentIndex]['title']
//           : filteredsong[currentIndex].title;
//       notifyListeners();

//       if (isLoop) {
//         player.setReleaseMode(ReleaseMode.loop);
//       } else {
//         player.setReleaseMode(ReleaseMode.stop);
//       }
//       // notifyListeners();

//       player.onDurationChanged.listen((Duration d) {
//         duration = d;
//         notifyListeners();
//       });
//       player.onPositionChanged.listen((Duration p) {
//         position = p;
//         notifyListeners();
//       });
//       // player..listen((Duration p) {
//       //   position = p;
//       //   notifyListeners();
//       // });
//       // player.onPlayerComplete.listen((_) {
//       //   // skipNext();
//       //   if (isShuffleEnabled) {
//       //     currentIndex = Random().nextInt(filteredsong.length);
//       //   } else {
//       //     currentIndex = (currentIndex + 1) % filteredsong.length;
//       //   }
//       // });

//       await player.play(path);
//       isPlaying = true;
//       // await playPause();
//       notifyListeners();
//       // player.onPlayerComplete.listen((_) {
//       //   skipNext();
//       // });
//     } catch (ex) {}
//   }

//   Future<void> playPause() async {
//     try {
//       // print(path);

//       if (isPlaying || player.state == PlayerState.playing) {
//         player.pause();
//         // player.resume();
//         isPlaying = false;
//       } else {
//         // player.resume();
//         await player.play(path);
//         isPlaying = true;
//       }
//       notifyListeners();
//     } catch (ex) {
//       ShowMasseg.ShowToastMasseg("قم باختيار نشيد لتشغيلة", Colors.grey);
//       // print(ex);
//     }
//   }

//   // static Future<void>
//   wheneFinsh() {
//     player.onPlayerComplete.listen((_) {
//       skipNext();
//     });
//     // player.onPlayerStateChanged.listen((_) {
//     //   if (player.state == PlayerState.playing) {
//     //     isPlaying = true;
//     //   } else if (player.state == PlayerState.paused) {
//     //     isPlaying = false;
//     //     player.pause();
//     //   } else if (player.state == PlayerState.stopped) {
//     //     isPlaying = false;
//     //     player.stop();
//     //   } else if (player.state == PlayerState.stopped) {
//     //     isPlaying = false;
//     //     player.stop();
//     //   }
//     //   notifyListeners();
//     // });
//   }

//   Future<void> skipNext() async {
//     if (isShuffleEnabled) {
//       currentIndex = Random().nextInt(
//           isFavoritesMode ? filterfavoretsong.length : filteredsong.length);
//     } else {
//       currentIndex = (currentIndex + 1) %
//           (isFavoritesMode ? filterfavoretsong.length : filteredsong.length);
//     }
//     // player.stop();
//     notifyListeners();
//     // setState(() {});
//     // print(currentIndex);
//     await initPlayer();
//   }

//   Future<void> skipPrevious() async {
//     if (isShuffleEnabled) {
//       currentIndex = Random().nextInt(
//           isFavoritesMode ? filterfavoretsong.length : filteredsong.length);
//     } else {
//       currentIndex = (currentIndex - 1) %
//           (isFavoritesMode ? filterfavoretsong.length : filteredsong.length);
//     }
//     notifyListeners();
//     // setState(() {});
//     await initPlayer();
//   }

//   void toggleShuffle() {
//     if (isShuffleEnabled) {
//       isShuffleEnabled = false;
//       ShowMasseg.ShowToastMasseg("تم الغاء التشغيل العشوائي", Colors.grey);
//     } else {
//       isShuffleEnabled = true;
//       ShowMasseg.ShowToastMasseg("تم تفعيل التشغيل العشوائي", Colors.grey);
//     }
//     notifyListeners();
//   }

//   Future<void> toggleRepeat() async {
//     if (isLoop) {
//       isLoop = false;
//       ShowMasseg.ShowToastMasseg("تم الغاء التشغيل المتكرر", Colors.grey);
//     } else {
//       isLoop = true;
//       ShowMasseg.ShowToastMasseg("تم تفعيل التشغيل المتكرر", Colors.grey);
//     }
//     notifyListeners();
//     // setState(() {});
//     // isLoop = !isLoop;
//     await initPlayer();
//   }

//   Future<void> seekTo(int seconds) async {
//     player.seek(Duration(seconds: seconds));
//     notifyListeners();
//   }

//   bool isFovarite(int id) {
//     return favoretsong.any((song) => song['id'] == id);
//     // notifyListeners();
//     // return PlaylistProvider.isFovarite(id);
//   }

//   void searchAndFilter(String query) {
//     if (query.isEmpty) {
//       // isFavoritesMode?(favoretsong = playlistsong):
//       // If the search query is empty, show all hotels
//       isFavoritesMode
//           ? filterfavoretsong = favoretsong
//           : filteredsong = playlistsong;
//       notifyListeners();
//     } else {
//       // If the search query is not empty, filter the list of hotels
//       isFavoritesMode
//           ? filterfavoretsong = favoretsong.where((favoritesongs) {
//               return favoritesongs['title']
//                   .toLowerCase()
//                   .contains(query.toLowerCase());
//             }).toList()
//           : filteredsong = playlistsong.where((favoritesongs) {
//               return favoritesongs.title
//                   .toLowerCase()
//                   .contains(query.toLowerCase());
//             }).toList();
//       notifyListeners();
//     }
//   }

//   void onCancelSearch() {
//     isFavoritesMode
//         ? filterfavoretsong = favoretsong
//         : filteredsong = playlistsong;
//     notifyListeners();
//     // setState(() {
//     //   _searchController.clear();
//     // });
//   }

//   String formatDuration(Duration duration) {
//     final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
//     final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
//     return '$minutes:$seconds';
//   }

//   Future<void> inclose() async {
//     player.stop();
//     // player.pause();
//     player.dispose();
//     notifyListeners();
//   }

//   Future<void> addFavoretSongOrdelet(Playlist playlist) async {
//     // var _isfovaret = _favoretsong.firstWhere((trip) => trip.id == playlist.id);
//     bool r = isFovarite(playlist.id);
//     // if (r) {
//     //   favoretsong.remove(playlist);
//     // } else {
//     //   favoretsong.add(playlist);
//     // }
//     // for (var i = 0; i < favoretsong.length; i++) {
//     // }
//     // await SharedSongdata.setList(favoretsong[0] as List<String>);
//     await refreshfavoret(playlist, r);

//     notifyListeners();
//     // SqlHelper.

//     // log("Item Added");
//   }

//   Future<void> refreshfavoret(Playlist playlist, bool r) async {
//     // bool r = isFovarite(playlist.id);
//     if (r) {
//       await SqlHelper.deleteSong(playlist.id);
//     } else {
//       await SqlHelper.createSong(playlist.id, playlist.title,
//           playlist.description, playlist.url, playlist.coverUrl);
//     }
//     await CreateFristFavoretData();
//     notifyListeners();
//     // await SharedSongdata.clearList();
//     // await SharedSongdata.setList(filterfavoretsong);
//     // await SharedSongdata.getList();
//     // SharedSongdata.saveFavorites(filterfavoretsong);
//   }

//   Future<void> openscreen(bool favoretscren, String tit) async {
//     isFavoritesMode = favoretscren;
//     titel = tit;
//     // favoretscren == false ? titel = "الرئيسية" : titel = "المفضلة";
//     // if (favoretscren) {
//     //   titel = "المفضلة";
//     // } else {
//     //   titel = "الرئيسية";
//     // }
//     notifyListeners();
//   }

//   // Reset Cart
//   void resetfavoret() {
//     favoretsong.clear();
//     notifyListeners();
//   }

//   static Future<void> getallsong() async {
//     // final r = SharedSongdata.setList(list)
//     // SharedSongdata.statecfavoretsong = await SqlHelper.getSongs();
//   }

//   Future<void> CreateFristData() async {
//     var rr;
//     var firestdata = playlistsong;
//     try {
//       for (var i = 0; i < firestdata.length; i++) {
//         rr = await SqlHelper.isfavoritfirestSongByid(firestdata[i].id);
//         if (rr) {
//           await SqlHelper.createfirestSong(
//             firestdata[i].id,
//             firestdata[i].title,
//             firestdata[i].description,
//             firestdata[i].url,
//             firestdata[i].coverUrl,
//           );
//         }
//         // rr
//         //     ? await SqlHelper.createfirestSong(
//         //         firestdata[i].id,
//         //         firestdata[i].title,
//         //         firestdata[i].description,
//         //         firestdata[i].url,
//         //         firestdata[i].coverUrl,
//         //       )
//         //     : print(rr);
//       }
//       // notifyListeners();
//     } catch (ex) {
//       // print(ex);
//     }
//     await CreateFristSongsData();
//     notifyListeners();
//   }

//   Future<void> CreateFristFavoretData() async {
//     // var rr;
//     final firestdata = await SqlHelper.getSongs();
//     // as List<Playlist>;
//     // print(firestdata);
//     // final firestdata = filterfavoretsong;
//     try {
//       favoretsong.clear();
//       favoretsong.addAll(firestdata);

//       // for (var i = 0; i < firestdata.length; i++) {
//       //   favoretsong.add(firestdata[i].map() as );
//       // }
//       // rr = await SqlHelper.isfavoritSongByid(firestdata[i].id);
//       // if (rr = false) {
//       // await SqlHelper.createSong(
//       //     firestdata[i].id,
//       //     firestdata[i].title,
//       //     firestdata[i].description,
//       //     firestdata[i].url,
//       //     firestdata[i].coverUrl,
//       //     );
//       // }
//       // print(firestdata);
//     } catch (ex) {
//       // print(ex);
//     }
//     notifyListeners();
//   }

//   Future<void> CreateFristSongsData() async {
//     // var rr;
//     final firestdata = await SqlHelper.getfirestSongs();
//     // as List<Playlist>;
//     // print(firestdata);
//     // final firestdata = filterfavoretsong;
//     try {
//       playlistsong.clear();
//       // playlistsong.addAll(List.from(firestdata));
//       playlistsong
//           .addAll(firestdata.map((row) => Playlist.fromMap(row)).toList());
//       // for (var i = 0; i < firestdata.length; i++) {
//       //   favoretsong.add(firestdata[i].map() as );
//       // }
//       // rr = await SqlHelper.isfavoritSongByid(firestdata[i].id);
//       // if (rr = false) {
//       // await SqlHelper.createSong(
//       //     firestdata[i].id,
//       //     firestdata[i].title,
//       //     firestdata[i].description,
//       //     firestdata[i].url,
//       //     firestdata[i].coverUrl,
//       //     );
//       // }
//       // print(firestdata);
//     } catch (ex) {
//       // print(ex);
//     }
//     notifyListeners();
//   }
// }

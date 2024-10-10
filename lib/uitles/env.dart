// // // GOOGLE_MAPS_API_KEY = "AIzaSyAqCemC02PSqTfoVnKtz41L57u6rrczEzw"
// <manifest xmlns:android="http://schemas.android.com/apk/res/android">
//    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
//    <uses-permission android:name="android.permission.WAKE_LOCK" />
//     <application
//         android:label="فتية المسيرة"
//         android:name="${applicationName}"
//         android:icon="@mipmap/launcher_icon">
//         <activity
//             android:name=".MainActivity"
//             android:exported="true"
//             android:launchMode="singleTop"
//             android:taskAffinity=""
//             android:theme="@style/LaunchTheme"
//             android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
//             android:hardwareAccelerated="true"
//             android:windowSoftInputMode="adjustResize">
//             <!-- Specifies an Android theme to apply to this Activity as soon as
//                  the Android process has started. This theme is visible to the user
//                  while the Flutter UI initializes. After that, this theme continues
//                  to determine the Window background behind the Flutter UI. -->
//             <meta-data
//               android:name="io.flutter.embedding.android.NormalTheme"
//               android:resource="@style/NormalTheme"
//               />
//             <intent-filter>
//                 <action android:name="android.intent.action.MAIN"/>
//                 <category android:name="android.intent.category.LAUNCHER"/>
//             </intent-filter>
//         </activity>
//         <!-- Don't delete the meta-data below.
//              This is used by the Flutter tool to generate GeneratedPluginRegistrant.java -->
//         <meta-data
//             android:name="flutterEmbedding"
//             android:value="2" />
//     </application>
//     <!-- Required to query activities that can process text, see:
//          https://developer.android.com/training/package-visibility and
//          https://developer.android.com/reference/android/content/Intent#ACTION_PROCESS_TEXT.

//          In particular, this is used by the Flutter engine in io.flutter.plugin.text.ProcessTextPlugin. -->
//     <queries>
//         <intent>
//             <action android:name="android.intent.action.PROCESS_TEXT"/>
//             <data android:mimeType="text/plain"/>
//         </intent>
//     </queries>
// </manifest>

// // ////////////////////////////////////////////
// <manifest xmlns:android="http://schemas.android.com/apk/res/android">
//     <!-- <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
//     <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
//     <uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
//     <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
//     <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
//     <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
//     <uses-permission android:name="android.permission.VIBRATE"/>
//     <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/> -->

//     <application
//         android:label="فتية المسيرة"
//         android:name="${applicationName}"
//         android:icon="@mipmap/launcher_icon">
//         <activity
//             android:name=".MainActivity"
//             android:exported="true"
//             android:launchMode="singleTop"
//             android:taskAffinity=""
//             android:theme="@style/LaunchTheme"
//             android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
//             android:hardwareAccelerated="true"
//             android:windowSoftInputMode="adjustResize">
//             <!-- Specifies an Android theme to apply to this Activity as soon as
//                  the Android process has started. This theme is visible to the user
//                  while the Flutter UI initializes. After that, this theme continues
//                  to determine the Window background behind the Flutter UI. -->
//             <meta-data
//               android:name="io.flutter.embedding.android.NormalTheme"
//               android:resource="@style/NormalTheme"
//               />
//             <intent-filter>
//                 <action android:name="android.intent.action.MAIN"/>
//                 <category android:name="android.intent.category.LAUNCHER"/>
//             </intent-filter>
//         </activity>
//         <!-- Don't delete the meta-data below.
//              This is used by the Flutter tool to generate GeneratedPluginRegistrant.java -->
//         <meta-data
//             android:name="flutterEmbedding"
//             android:value="2" />
//     </application>
//     <!-- Required to query activities that can process text, see:
//          https://developer.android.com/training/package-visibility and
//          https://developer.android.com/reference/android/content/Intent#ACTION_PROCESS_TEXT.

//          In particular, this is used by the Flutter engine in io.flutter.plugin.text.ProcessTextPlugin. -->
//     <queries>
//         <intent>
//             <action android:name="android.intent.action.PROCESS_TEXT"/>
//             <data android:mimeType="text/plain"/>
//         </intent>
//     </queries>
// </manifest>
// /////////////////////////////////////////////////////////////////////
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
//   AudioPlayer player = AudioPlayer();
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
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////
///mainifast justaudio
// <manifest xmlns:android="http://schemas.android.com/apk/res/android">
//     <!-- <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
//     <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
//     <uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
//     <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
//     <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
//     <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
//     <uses-permission android:name="android.permission.VIBRATE"/>
//     <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/> -->
//     <!-- <uses-permission android:name="android.permission.WAKE_LOCK"/>
//     <uses-permission android:name="android.permission.FOREGROUND_SERVICE"/>
//     <uses-permission android:name="android.permission.FOREGROUND_SERVICE_MEDIA_PLAYBACK"/> -->
//     <uses-permission android:name="android.permission.INTERNET"/>
//     <uses-permission android:name="android.permission.WAKE_LOCK"/>
//     <uses-permission android:name="android.permission.FOREGROUND_SERVICE"/>
//     <uses-permission android:name="android.permission.FOREGROUND_SERVICE_MEDIA_PLAYBACK"/>

//             <!-- android:name=".MainActivity" -->
//     <application
//         android:label="فتية المسيرة"
//         android:name="${applicationName}"
//         android:icon="@mipmap/launcher_icon">
//         <activity
//             android:name="com.ryanheise.audioservice.AudioServiceActivity"
//             android:launchMode="singleTop"
//             android:theme="@style/LaunchTheme"
//             android:configChanges="orientation|keyboardHidden|keyboard|screenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
//             android:hardwareAccelerated="true"
//             android:windowSoftInputMode="adjustResize"
//             android:exported="true">
//             <intent-filter>
//                 <action android:name="android.intent.action.MAIN"/>
//                 <category android:name="android.intent.category.LAUNCHER"/>
//             </intent-filter>
//         </activity>

//         <service
//             android:name="com.ryanheise.audioservice.AudioService"
//             android:foregroundServiceType="mediaPlayback"
//             android:exported="true">
//             <intent-filter>
//                 <action android:name="android.media.browse.MediaBrowserService" />
//             </intent-filter>
//         </service>

//         <receiver
//             android:name="com.ryanheise.audioservice.MediaButtonReceiver"
//             android:exported="true">
//             <intent-filter>
//                 <action android:name="android.intent.action.MEDIA_BUTTON" />
//             </intent-filter>
//         </receiver> 

//         <meta-data
//             android:name="flutterEmbedding"
//             android:value="2" />
//     </application>
// </manifest>
////////////////////////////////////////////////////////////////////////
///controll Justaudio
//////////////////////////////////////////////////////////////////////////
// import 'dart:collection';
// import 'dart:math';

// // import 'package:audioplayers/audioplayers.dart';
// // import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:just_audio_background/just_audio_background.dart';
// import 'package:technical_center/Api/sql_helper.dart';

// import '../Api/helper/shared_songdata.dart';
// import '../models/playlist_model.dart';
// import '../widgets/flutter_toast.dart';
// import 'playlist_data.dart';

// class PlayerController with ChangeNotifier {
//   final List<Playlist> playlistsong = PlaylistData.playlists;
//   // late List<Playlist> favoretsong = SharedSongdata.statecfavoretsong;
//   late List<Map<String, dynamic>> favoretsong = [];
//   late List<Playlist> filteredsong = [];
//   late List<Map<String, dynamic>> filterfavoretsong = favoretsong;
//   bool isPlaying = false;
//   bool isLoop = false;
//   bool isShuffleEnabled = false;
//   bool isFavoritesMode = false;
//   int currentIndex = 0;
//   String titelsong = "قم باختيار نشيد لتشغيلة";
//   String titel = "الرئيسية";
//   // AudioPlayer player = AudioPlayer();
//   late AudioPlayer player;
//   // late setAudioSource;
//   late ConcatenatingAudioSource pathsong =
//       ConcatenatingAudioSource(children: []);
//   // = ConcatenatingAudioSource(children: []);
//   // late AssetSource path;
//   // late AudioPlayer player;
//   // final player = AudioPlayer();
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
//   Duration get durations => duration;
//   Duration get positions => position;

//   void inopen() async {
//     filteredsong = playlistsong;

//     notifyListeners();
//   }

//   Future<void> playsong() async {
//     await player.play();
//     notifyListeners();
//   }

//   Future<void> stopsong() async {
//     await player.stop();
//     notifyListeners();
//   }

//   Future<void> pausesong() async {
//     await player.pause();
//     notifyListeners();
//   }

//   void initAudioPlayer() {
//     player = AudioPlayer();
//     notifyListeners();
//   }

//   // Future<void> loadAudioSource(int sourceId) async {
//   //   final audioSource =
//   //       filteredsong.firstWhere((source) => source.id == sourceId);
//   //   await player.setAudioSource(
//   //       AudioSource.uri(Uri.parse('asset:///${audioSource.url.toString()}')));
//   // }
//   // Future<void> _getnumber() async {
//   //   int i = await SharedSongdata.getNumber();
//   //   if(i == 0){

//   //   }
//   // }

//   Future<void> playSelectedSong(int index) async {
//     try {
//       currentIndex = index;
//       // pathsong.clear();
//       isPlaying = true;

//       // player.stop();
//       // player.currentIndex! = index;
//       // await player.stop();
//       // await stopsong();
//       await selectedsong();
//       await playsong();
//       // await player.play();
//       // if (player.playerState.playing) {
//       notifyListeners();
//       // await player.stop();
//       //   player.stop();
//       // }
//     } catch (ex) {
//       print(ex);
//     }
//   }

//   Future<void> selectedsong() async {
//     try {
//       await player.currentIndexStream.where(
//         (element) => element == currentIndex,
//       );
//       notifyListeners();
//       // final currentSongIndex = await player.currentIndexStream.first;
//       // if (currentSongIndex == currentIndex) {
//       //   notifyListeners();
//       // }
//     } catch (ex) {
//       print(ex);
//     }
//   }

//   Future<void> initPlayer() async {
//     try {
//       // player.currentIndex = currentIndex;
//       // player.setAudioSource(source)
//       // await player.stop();
//       // pathsong.clear();
//       // await player.setAudioSource(ConcatenatingAudioSource(children: []),
//       //     initialIndex: currentIndex);
//       if (isFavoritesMode) {
//         for (var i = 0; i < filterfavoretsong.length; i++) {
//           pathsong.addAll([
//             AudioSource.uri(
//                 Uri.parse('asset:///${filterfavoretsong[i]['url']}'),
//                 tag: MediaItem(
//                   id: '${filterfavoretsong[i]['id']}',
//                   title: "${filterfavoretsong[i]['title']}",
//                   album: "${filterfavoretsong[i]['description']}",
//                 )),
//           ]);
//         }
//         notifyListeners();
//       } else {
//         for (var i = 0; i < filteredsong.length; i++) {
//           pathsong.addAll([
//             AudioSource.uri(Uri.parse('asset:///${filteredsong[i].url}'),
//                 tag: MediaItem(
//                   id: '${filteredsong[i].id}',
//                   title: "${filteredsong[i].title}",
//                   album: "${filteredsong[i].description}",
//                 )),
//           ]);
//         }
//         notifyListeners();
//       }
//       await player.setAudioSource(pathsong);
//       print(pathsong);
//       notifyListeners();
//       wheneFinsh();
//       // ConcatenatingAudioSource(children: [
//       //   AudioSource.uri(
//       //     Uri.parse(isFavoritesMode
//       //         ? 'asset:///assets/${filterfavoretsong[currentIndex]['url']}'
//       //         : 'asset:///assets/${filteredsong[currentIndex].url}'),
//       //     tag: MediaItem(
//       //       // Specify a unique ID for each media item:
//       //       id: isFavoritesMode
//       //           ? '${filterfavoretsong[currentIndex]['id']}'
//       //           : '${filteredsong[currentIndex].id}',
//       //       // Metadata to display in the notification:
//       //       album: isFavoritesMode
//       //           ? "${filterfavoretsong[currentIndex]['description']}"
//       //           : "${filteredsong[currentIndex].description}",
//       //       title: isFavoritesMode
//       //           ? "${filterfavoretsong[currentIndex]['title']}"
//       //           : "${filteredsong[currentIndex].title}",
//       //       // artUri: Uri.parse('https://example.com/albumart.jpg'),
//       //       // artUri: Uri.parse(
//       //       //     'asset:///assets/images/Logo_of_the_technical_center.jpg'),
//       //     ),
//       //   )
//       // ]),

//       // player = AudioPlayer()
//       //   ..setAsset(isFavoritesMode
//       //       ? 'assets/${filterfavoretsong[currentIndex]['url']}'
//       //       : 'assets/${filteredsong[currentIndex].url}');
//       // path = AssetSource(isFavoritesMode
//       //     ? filterfavoretsong[currentIndex]['url']
//       //     : filteredsong[currentIndex].url);

//       // titelsong = isFavoritesMode
//       //     ? filterfavoretsong[currentIndex]['title']
//       //     : filteredsong[currentIndex].title;
//       // notifyListeners();

//       // if (isLoop) {
//       //   player.setLoopMode(LoopMode.one);
//       // } else {
//       //   player.setLoopMode(LoopMode.all);
//       // }

//       // notifyListeners();

//       // player.playerStateStream.listen((event) {
//       //   switch (event.processingState) {
//       //     case ProcessingState.completed:
//       //       // player.seekToNext();
//       //       skipNext();
//       //       notifyListeners();
//       //     // break;
//       //     default:
//       //   }
//       // });
//       //   player.playerStateStream.listen((event) {
//       //   switch (event) {
//       //     case ProcessingState.completed:

//       //       skipNext();
//       //     //   break;
//       //     // default:
//       //   }
//       // });
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

//       // await playPause();
//       // notifyListeners();
//       // player.onPlayerComplete.listen((_) {
//       //   skipNext();
//       // });
//     } catch (ex) {}
//   }

//   Future<void> playPause() async {
//     try {
//       // print(path);
//       //|| player.state == PlayerState.playing
// // || player.playerState.playing
//       if (isPlaying || player.playerState.playing) {
//         isPlaying = false;
//         // await player.pause();
//         await pausesong();

//         // player.resume();
//       } else {
//         // player.resume();
//         isPlaying = true;
//         await playsong();
//         // await player.play();
//       }
//       notifyListeners();
//     } catch (ex) {
//       ShowMasseg.ShowToastMasseg("قم باختيار نشيد لتشغيلة", Colors.grey);
//       print(ex);
//     }
//   }

//   // static Future<void>
//   Future<void> wheneFinsh() async {
//     // player = AudioPlayer();

//     // notifyListeners();
//     await player.currentIndexStream.listen((e) {
//       // currentIndex = e ?? 0;
//       titelsong = isFavoritesMode
//           ? filterfavoretsong[e ?? 0]['title']
//           : filteredsong[e ?? 0].title;
//       notifyListeners();
//       print(e);
//       // currentIndex = e!;
//       // if (event.processingState == ProcessingState.completed) {
//       //   titelsong = isFavoritesMode
//       //       ? filterfavoretsong[player.currentIndex!]['title']
//       //       : filteredsong[player.currentIndex!].title;
//       //   notifyListeners();
//       // }
//     });
//     await player.positionStream.listen((p) {
//       position = p;
//       notifyListeners();
//     });
//     await player.durationStream.listen((d) {
//       duration = d ?? Duration.zero;
//       notifyListeners();
//     });
//     // await player.setLoopMode(LoopMode.all);
//     // notifyListeners();
//     // player.setLoopMode(LoopMode.all);
//     // await player.playerStateStream.listen((event) {
//     //   if (event.processingState == ProcessingState.completed) {
//     //     // player.stop();
//     //     skipNext();
//     //   }
//     //   // notifyListeners();
//     //   // switch (event.processingState) {
//     //   //   case ProcessingState.completed:
//     //   //     skipNext;
//     //   //   // player.seekToNext();
//     //   //   // break;
//     //   //   default:
//     //   // }
//     // });
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
//     // });
//     // notifyListeners();
//   }

//   Future<void> skipNext() async {
//     // player.seekToNext();
//     pathsong.clear();
//     isPlaying = true;
//     if (isShuffleEnabled) {
//       currentIndex = Random().nextInt(
//           isFavoritesMode ? filterfavoretsong.length : filteredsong.length);
//     } else {
//       currentIndex = (currentIndex + 1) %
//           (isFavoritesMode ? filterfavoretsong.length : filteredsong.length);
//     }
//     // setState(() {});
//     // print(currentIndex);
//     await stopsong();
//     await selectedsong();
//     await playsong();
//     notifyListeners();
//   }

//   Future<void> skipPrevious() async {
//     pathsong.clear();
//     isPlaying = true;
//     if (isShuffleEnabled) {
//       currentIndex = Random().nextInt(
//           isFavoritesMode ? filterfavoretsong.length : filteredsong.length);
//     } else {
//       currentIndex = (currentIndex - 1) %
//           (isFavoritesMode ? filterfavoretsong.length : filteredsong.length);
//     }
//     await stopsong();
//     await selectedsong();
//     await playsong();
//     // setState(() {});
//     notifyListeners();
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
//       await player.setLoopMode(LoopMode.all);
//     } else {
//       isLoop = true;
//       ShowMasseg.ShowToastMasseg("تم تفعيل التشغيل المتكرر", Colors.grey);
//       await player.setLoopMode(LoopMode.one);
//     }
//     notifyListeners();
//     // setState(() {});
//     // isLoop = !isLoop;
//     // initPlayer();
//   }

//   Future<void> seekTo(int seconds) async {
//     // await pausesong();
//     await player.seek(Duration(milliseconds: seconds));
//     // await playsong();
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
//     // if (duration == Duration.zero) {
//     //   return '00:00';
//     // } else {
//     //   String minutes = duration!.inMinutes.toString().padLeft(2, '0');
//     //   String seconds =
//     //       duration.inSeconds.remainder(60).toString().padLeft(2, '0');
//     //   return '$minutes:$seconds';
//     // }
//     final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
//     final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
//     return '$minutes:$seconds';
//   }

//   Future<void> inclose() async {
//     // player.stop();
//     // player.pause();
//     await player.dispose();
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
//       filteredsong.clear();
//       // playlistsong.addAll(List.from(firestdata));
//       filteredsong
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

// import 'dart:async';
import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fityatalmasera/Api/sql_helper.dart';
import 'package:fityatalmasera/data/network_app_data.dart';

// import '../Api/helper/shared_songdata.dart';
import '../models/network_app.dart';
import '../models/playlist_model.dart';
import '../widgets/flutter_toast.dart';
import 'playlist_data.dart';

class PlayerController with ChangeNotifier {
  final List<Playlist> playlistsong = PlaylistData.playlists;
  final List<NetworkApp> networkapp = NetworkAppData.networkapps;
  // late List<Playlist> favoretsong = SharedSongdata.statecfavoretsong;
  // late List<Map<String, dynamic>> favoretsong = [];
  late List<Playlist> favoretsong = [];
  late List<Playlist> filteredsong = playlistsong;
  // late List<Map<String, dynamic>> filterfavoretsong = favoretsong;
  late List<Playlist> filterfavoretsong = favoretsong;
  bool isPlaying = false;
  bool isPause = false;
  bool isLoop = false;
  bool isShuffleEnabled = false;
  bool isFavoritesMode = false;
  bool isSoon = false;
  int currentIndex = 0;
  String titelsong = "قم بإختيار نشيد لتشغيله";
  String titel = "الرئيسية";
  late AudioPlayer player = AudioPlayer();
  // late AudioCache cache = AudioCache();
  // late AudioPlayer player;
  late AssetSource path;
  late PlayerState playerstate = PlayerState.stopped;
  // late String path2 ;
  Duration duration = Duration();
  Duration position = Duration();
  // late VoidCallback _onPlaybackStateChanged;
  // StreamSubscription? _durationSubscription;
  // StreamSubscription? _positionSubscription;
  // StreamSubscription? _playerCompleteSubscription;
  // StreamSubscription? _playerStateChangeSubscription;

  UnmodifiableListView get cartSongs => UnmodifiableListView(playlistsong);
  UnmodifiableListView get cartFavoretSongs =>
      UnmodifiableListView(favoretsong);
  UnmodifiableListView get cartfilteredsong =>
      UnmodifiableListView(filteredsong);
  UnmodifiableListView get cartfilterfavoretsong =>
      UnmodifiableListView(filterfavoretsong);
  UnmodifiableListView get cartnetworkapps => UnmodifiableListView(networkapp);

  bool get isPlayings => isPlaying;
  bool get isPauses => isPause;
  bool get isLoops => isLoop;
  bool get isFavoritesModes => isFavoritesMode;
  bool get isSoons => isSoon;
  bool get isShuffleEnableds => isShuffleEnabled;
  int get currentIndexs => currentIndex;
  String get titelsongs => titelsong;
  String get titels => titel;
  // String get path22 => path2;
  Duration get durations => duration;
  Duration get positions => position;
  // VoidCallback get onPlaybackStateChanged => _onPlaybackStateChanged;
  // set onPlaybackStateChanged(VoidCallback callback) {
  //   _onPlaybackStateChanged = callback;
  //   notifyListeners();
  // }
  //  Duration get durations => duration;
  // set durations(Duration value) {
  //   duration = value;
  //   notifyListeners();
  // }
  // AudioPlayer get players => player;
  // AssetSource get pathes => path;

  // void inopen() {
  //   // player = AudioPlayer();
  //   // cache = AudioCache();
  //   // cache.play();
  //   // filteredsong = playlistsong;
  //   notifyListeners();
  // }

  // void initAudioPlayer() async {
  //   player = await AudioPlayer();

  //   notifyListeners();
  // }
  // Future<void> _getnumber() async {
  //   int i = await SharedSongdata.getNumber();
  //   if(i == 0){

  //   }
  // }

  Future<void> playsong() async {
    // await player.setUrl(path2);
    isPlaying = true;
    isPause = false;
    playerstate = PlayerState.playing;
    await player.play(path);
    notifyListeners();
    // return;
  }

  Future<void> resumesong() async {
    isPlaying = true;
    isPause = false;
    playerstate = PlayerState.playing;
    await player.resume();
    // if (_onPlaybackStateChanged != null) {
    //   _onPlaybackStateChanged();
    // }
    notifyListeners();
    // return;
  }

  Future<void> stopsong() async {
    isPlaying = false;
    playerstate = PlayerState.stopped;
    await player.stop();
    // position = Duration.zero;
    // if (_onPlaybackStateChanged != null) {
    //   _onPlaybackStateChanged();
    // }
    notifyListeners();
    // return;
  }

  Future<void> pausesong() async {
    isPlaying = false;
    isPause = true;
    await player.pause();
    playerstate = PlayerState.paused;
    // if (_onPlaybackStateChanged != null) {
    //   _onPlaybackStateChanged();
    // }
    notifyListeners();
    // return;
  }

  void playSelectedSong(int index) {
    try {
      // if (isPlaying) {
      //   player.stop();
      // }
      currentIndex = index;
      // if (isPlaying) {
      // }
      // stopsong();

      initPlayer();
      // isPlaying = true;
      // await resumesong();
      // playsong();
      // await player.play(path);
      notifyListeners();
      // return;
    } catch (ex) {
      // print(ex);
    }
  }

  void initPlayer() async {
    // path.setOnPlayer(player);

    try {
      path = await AssetSource(isFavoritesMode
          ? filterfavoretsong[currentIndex].url
          : filteredsong[currentIndex].url);
      // for (var songName in filterfavoretsong) {
      //   await player.setSource(AssetSource(songName.url));
      //   await player.resume();
      // }
      // await player.setSource(AssetSource(isFavoritesMode
      //     ? filterfavoretsong[currentIndex].url
      //     : filteredsong[currentIndex].url));
      // notifyListeners();

      titelsong = isFavoritesMode
          ? filterfavoretsong[currentIndex].title
          : filteredsong[currentIndex].title;
      player.onDurationChanged.listen((Duration d) {
        duration = d;
        notifyListeners();
      });
      player.onPositionChanged.listen((Duration p) {
        position = p;
        notifyListeners();
      });
      // isPlaying = true;
      await playsong();
      // await resumesong();
      notifyListeners();
      // print("object========================");
      // notifyListeners();
      // if (isPlaying == true) {
      //   // player.state = PlayerState.completed;
      //   stopsong();
      // }
      // player.onPlaybackStateChanged.listen((event) => event.,);

      // if (isLoop) {
      //   player.setReleaseMode(ReleaseMode.loop);
      // } else {
      //   player.setReleaseMode(ReleaseMode.stop);
      // }
      // notifyListeners();

      // player..listen((Duration p) {
      //   position = p;
      //   notifyListeners();
      // });
      // player.onPlayerComplete.listen((_) {
      //   // skipNext();
      //   if (isShuffleEnabled) {
      //     currentIndex = Random().nextInt(filteredsong.length);
      //   } else {
      //     currentIndex = (currentIndex + 1) % filteredsong.length;
      //   }
      // });

      // await playPause();
      // notifyListeners();
      // player.onPlayerComplete.listen((_) {
      //   skipNext();
      // });
    } catch (ex) {
      // print(ex);
    }
  }

  Future<void> playPause() async {
    try {
      // print(path);

      if (playerstate == PlayerState.stopped) {
        if (isPause) {
          await playsong();
        } else {
          ShowMasseg.ShowToastMasseg("قم بإختيار نشيد لتشغيله", Colors.green);
        }
        // player.resume();
        // await resumesong();

        // playsong();
      } else if (isPlaying || playerstate == PlayerState.playing) {
        // await player.resume();

        await pausesong();
        // notifyListeners();
      } else {
        // playsong();
        await resumesong();
      }
      notifyListeners();
    } catch (ex) {
      // print(ex);
      notifyListeners();
      return ShowMasseg.ShowToastMasseg(
          "قم بإختيار نشيد لتشغيله", Colors.green);
      // print(ex);
    }
  }

  void playPauseBackgraoung() {
    try {
      if (!isPlaying) {
        // titelsong = "قم بإختيار نشيد لتشغيله";
        duration = Duration.zero;
        position = Duration.zero;
        player.stop();
        // isPlaying = false;
      }
      notifyListeners();
    } catch (ex) {
      // print(ex);
    }
  }

  // static Future<void>
  // void initStreams() {
  //   try {
  //     // player = AudioPlayer();
  //     playerstate = PlayerState.stopped;
  //     // playerstate = player.state;
  //     player.getDuration().then(
  //           (value) => duration = value!,
  //         );
  //     notifyListeners();
  //     player.getCurrentPosition().then(
  //           (value) => position = value!,
  //         );
  //     player.onDurationChanged.listen((Duration d) {
  //       duration = d;
  //       notifyListeners();
  //     });
  //     player.onPositionChanged.listen((Duration p) {
  //       position = p;
  //       notifyListeners();
  //     });
  //     // player.onPlayerStateChanged.listen((state) {
  //     //   // Call the onPlaybackStateChanged callback when the player state changes
  //     //   if (_onPlaybackStateChanged != null) {
  //     //     _onPlaybackStateChanged();
  //     //   }
  //     // });
  //     player.onPlayerComplete.listen((event) {
  //       skipNext();
  //       // if (player.state == PlayerState.completed) {
  //       // }
  //     });

  //     player.onPlayerStateChanged.listen((state) {
  //       playerstate = state;
  //       notifyListeners();
  //     });
  //     // wheneFinsh();
  //     notifyListeners();
  //   } catch (er) {
  //     print(er);
  //   }
  // }

  void wheneOpen() {
    // player.onDurationChanged.listen((Duration d) {
    //   duration = d;
    //   notifyListenerqs();
    // });
    // player.onPositionChanged.listen((Duration p) {
    //   position = p;
    //   notifyListeners();
    // });
    try {
      player = AudioPlayer();
      // playerstate = PlayerState.stopped;
      // player.onDurationChanged.listen((Duration d) {
      //   duration = d;
      //   notifyListeners();
      // });
      // player.onPositionChanged.listen((Duration p) {
      //   position = p;
      //   notifyListeners();
      // });
      // player.onPlayerStateChanged.listen((state) {
      //   // Call the onPlaybackStateChanged callback when the player state changes
      //   if (_onPlaybackStateChanged != null) {
      //     _onPlaybackStateChanged();
      //   }
      // });
      player.onPlayerComplete.listen((_) {
        skipNext();
        // if (player.state == PlayerState.completed) {
        // }
      });

      player.onPlayerStateChanged.listen((state) {
        playerstate = state;
        notifyListeners();
      });
      // player.audioFocusStream.listen((event) {
      //   if (event == AudioFocus.lossTransient || event == AudioFocus.lossTransientCanDuckOthers) {
      //     _audioPlayer.pause();
      //   } else if (event == AudioFocus.gainTransient || event == AudioFocus.gainTransientMayDuck) {
      //     _audioPlayer.play();
      //   }
      // });
      // player.eventStream.listen((event) {
      //   if (event.eventType == AudioEventType.log) {
      //     player.pause();
      //   }
      // });
      //   _playerCompleteSubscription = player.onPlayerComplete.listen((event) {
      //   setState(() {
      //     _playerState = PlayerState.stopped;
      //     _position = Duration.zero;
      //   });
      // });
    } catch (ex) {
      // print(ex);
    }
  }
  // wheneFinsh() async {
  //   player.onPlayerComplete.listen((_) {
  //     skipNext();
  //   });
  // }

  Future<void> skipNext() async {
    if (playerstate == PlayerState.stopped) {
      return ShowMasseg.ShowToastMasseg(
          "قم بإختيار نشيد لتشغيله", Colors.green);
    }
    try {
      if (isShuffleEnabled) {
        currentIndex = Random().nextInt(
            isFavoritesMode ? filterfavoretsong.length : filteredsong.length);
      } else {
        currentIndex = (currentIndex + 1) %
            (isFavoritesMode ? filterfavoretsong.length : filteredsong.length);
      }
      // player.stop();
      notifyListeners();
      playSelectedSong(currentIndex);
    } catch (ex) {
      // print(ex);
    }
    // setState(() {});
    // print(currentIndex);
    // return;
  }

  Future<void> skipPrevious() async {
    if (playerstate == PlayerState.stopped) {
      return ShowMasseg.ShowToastMasseg(
          "قم بإختيار نشيد لتشغيله", Colors.green);
    }
    try {
      if (isShuffleEnabled) {
        currentIndex = Random().nextInt(
            isFavoritesMode ? filterfavoretsong.length : filteredsong.length);
      } else {
        currentIndex = (currentIndex - 1) %
            (isFavoritesMode ? filterfavoretsong.length : filteredsong.length);
      }
      notifyListeners();
      // setState(() {});
      playSelectedSong(currentIndex);
    } catch (ex) {
      // print(ex);
    }
    // return;
  }

  void toggleShuffle() {
    try {
      if (isShuffleEnabled) {
        isShuffleEnabled = false;
        notifyListeners();
        return ShowMasseg.ShowToastMasseg(
            "تم الغاء التشغيل العشوائي", Colors.green);
      } else {
        isShuffleEnabled = true;
        notifyListeners();
        return ShowMasseg.ShowToastMasseg(
            "تم تفعيل التشغيل العشوائي", Colors.green);
      }
    } catch (ex) {
      // print(ex);
    }
    // notifyListeners();
  }

  void toggleRepeat() {
    try {
      if (isLoop) {
        isLoop = false;
        player.setReleaseMode(ReleaseMode.stop);
        notifyListeners();
        return ShowMasseg.ShowToastMasseg(
            "تم الغاء التشغيل المتكرر", Colors.green);
      } else {
        isLoop = true;
        player.setReleaseMode(ReleaseMode.loop);
        notifyListeners();
        return ShowMasseg.ShowToastMasseg(
            "تم تفعيل التشغيل المتكرر", Colors.green);
      }
    } catch (ex) {
      // print(ex);
    }

    // setState(() {});
    // isLoop = !isLoop;
    // await initPlayer();
  }

  Future<void> seekTo(int seconds) async {
    await player.seek(Duration(seconds: seconds));
    notifyListeners();
  }

  bool isFovarite(int id) {
    return favoretsong.any((song) => song.id == id);
  }

  // notifyListeners();
  // return PlaylistProvider.isFovarite(id);
  void searchAndFilter(String query) {
    if (query.isEmpty) {
      // isFavoritesMode?(favoretsong = playlistsong):
      // If the search query is empty, show all hotels
      isFavoritesMode
          ? filterfavoretsong = favoretsong
          : filteredsong = playlistsong;
      notifyListeners();
    } else {
      // If the search query is not empty, filter the list of hotels
      isFavoritesMode
          ? filterfavoretsong = favoretsong.where((favoritesongs) {
              return favoritesongs.title
                  .toLowerCase()
                  .contains(query.toLowerCase());
            }).toList()
          : filteredsong = playlistsong.where((favoritesongs) {
              return favoritesongs.title
                  .toLowerCase()
                  .contains(query.toLowerCase());
            }).toList();
      notifyListeners();
    }
  }

  void searchAndFiltersong(String query) {
    if (query.isEmpty) {
      // isFavoritesMode?(favoretsong = playlistsong):
      // If the search query is empty, show all hotels
      filteredsong = playlistsong;
      notifyListeners();
    } else {
      // If the search query is not empty, filter the list of hotels
      filteredsong = playlistsong.where((favoritesongs) {
        return favoritesongs.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
      notifyListeners();
    }
  }

  void searchAndFilterfavoretsong(String query) {
    if (query.isEmpty) {
      // isFavoritesMode?(favoretsong = playlistsong):
      // If the search query is empty, show all hotels
      filterfavoretsong = favoretsong;
      notifyListeners();
    } else {
      // If the search query is not empty, filter the list of hotels
      filterfavoretsong = favoretsong.where((favoritesongs) {
        return favoritesongs.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
      notifyListeners();
    }
  }

  void onCancelSearch() {
    isFavoritesMode
        ? filterfavoretsong = favoretsong
        : filteredsong = playlistsong;
    notifyListeners();
    // player.audioCache.
    // setState(() {
    //   _searchController.clear();
    // });
  }

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void inclose() {
    // await stopsong();
    // player.pause();
    // _durationSubscription?.cancel();
    // _positionSubscription?.cancel();
    // _playerCompleteSubscription?.cancel();
    // _playerStateChangeSubscription?.cancel();
    player.stop();
    player.dispose();
    // notifyListeners();
  }

  Future<void> addFavoretSongOrdelet(Playlist playlist) async {
    // var _isfovaret = _favoretsong.firstWhere((trip) => trip.id == playlist.id);
    bool r = isFovarite(playlist.id);
    // if (r) {
    //   favoretsong.remove(playlist);
    // } else {
    //   favoretsong.add(playlist);
    // }
    // for (var i = 0; i < favoretsong.length; i++) {
    // }
    // await SharedSongdata.setList(favoretsong[0] as List<String>);
    await refreshfavoret(playlist, r);

    notifyListeners();
    // SqlHelper.

    // log("Item Added");
  }

  Future<void> refreshfavoret(Playlist playlist, bool r) async {
    // bool r = isFovarite(playlist.id);
    if (r) {
      await SqlHelper.deleteSong(playlist.id);
      ShowMasseg.ShowToastMasseg("تم الحذف من المفضلة", Colors.green);
    } else {
      await SqlHelper.createSong(
          playlist.id, playlist.title, playlist.description, playlist.url);
      ShowMasseg.ShowToastMasseg("تم الإضافة الى المفضلة", Colors.green);
    }
    notifyListeners();
    await CreateFristFavoretData();
    // await SharedSongdata.clearList();
    // await SharedSongdata.setList(filterfavoretsong);
    // await SharedSongdata.getList();
    // SharedSongdata.saveFavorites(filterfavoretsong);
  }

  void openscreen(bool favoretscren, String tit) {
    isSoon = false;
    isFavoritesMode = favoretscren;
    titel = tit;
    // favoretscren == false ? titel = "الرئيسية" : titel = "المفضلة";
    // if (favoretscren) {
    //   titel = "المفضلة";
    // } else {
    //   titel = "الرئيسية";
    // }
    notifyListeners();
  }

  void opensoonscreen(bool soonscren, String tit) {
    isSoon = soonscren;
    titel = tit;
    // favoretscren == false ? titel = "الرئيسية" : titel = "المفضلة";
    // if (favoretscren) {
    //   titel = "المفضلة";
    // } else {
    //   titel = "الرئيسية";
    // }
    notifyListeners();
  }

  // Reset Cart
  void resetfavoret() {
    favoretsong.clear();
    notifyListeners();
  }

  static Future<void> getallsong() async {
    // final r = SharedSongdata.setList(list)
    // SharedSongdata.statecfavoretsong = await SqlHelper.getSongs();
  }

  Future<void> CreateFristData() async {
    // var rr;
    // var firestdata = playlistsong;
    try {
      for (var i = 0; i < playlistsong.length; i++) {
        bool rr = await SqlHelper.isfavoritfirestSongByid(playlistsong[i].id);
        if (rr) {
          await SqlHelper.createfirestSong(
            playlistsong[i].id,
            playlistsong[i].title,
            playlistsong[i].description,
            playlistsong[i].url,
          );
        }
        // rr
        //     ? await SqlHelper.createfirestSong(
        //         firestdata[i].id,
        //         firestdata[i].title,
        //         firestdata[i].description,
        //         firestdata[i].url,
        //         firestdata[i].coverUrl,
        //       )
        //     : print(rr);
      }
      // notifyListeners();
      // notifyListeners();
    } catch (ex) {
      // print(ex);
    }
    await CreateFristSongsData();
    notifyListeners();
  }

  Future<void> CreateFristFavoretData() async {
    // var rr;
    final firestdata = await SqlHelper.getSongs();
    // as List<Playlist>;
    // print(firestdata);
    // final firestdata = filterfavoretsong;
    try {
      favoretsong.clear();
      favoretsong
          .addAll(firestdata.map((row) => Playlist.fromMap(row)).toList());

      // for (var i = 0; i < firestdata.length; i++) {
      //   favoretsong.add(firestdata[i].map() as );
      // }
      // rr = await SqlHelper.isfavoritSongByid(firestdata[i].id);
      // if (rr = false) {
      // await SqlHelper.createSong(
      //     firestdata[i].id,
      //     firestdata[i].title,
      //     firestdata[i].description,
      //     firestdata[i].url,
      //     firestdata[i].coverUrl,
      //     );
      // }
      // print(firestdata);
    } catch (ex) {
      // print(ex);
    }
    notifyListeners();
  }

  Future<void> CreateFristSongsData() async {
    // var rr;
    final firestdata = await SqlHelper.getfirestSongs();
    // as List<Playlist>;
    // print(firestdata);
    // final firestdata = filterfavoretsong;
    try {
      playlistsong.clear();
      // playlistsong.addAll(List.from(firestdata));
      playlistsong
          .addAll(firestdata.map((row) => Playlist.fromMap(row)).toList());
      // print("============================");
      // print(firestdata.length);
      // for (var i = 0; i < firestdata.length; i++) {
      //   favoretsong.add(firestdata[i].map() as );
      // }
      // rr = await SqlHelper.isfavoritSongByid(firestdata[i].id);
      // if (rr = false) {
      // await SqlHelper.createSong(
      //     firestdata[i].id,
      //     firestdata[i].title,
      //     firestdata[i].description,
      //     firestdata[i].url,
      //     firestdata[i].coverUrl,
      //     );
      // }
      // print(firestdata);
    } catch (ex) {
      // print(ex);
    }
    notifyListeners();
  }
}

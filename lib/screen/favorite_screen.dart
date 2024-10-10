// import 'package:flutter/material.dart';
// // import 'package:audioplayers/audioplayers.dart';
// import 'package:just_audio/just_audio.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Music Player',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MusicPlayerPage(),
//     );
//   }
// }

// class MusicPlayerPage extends StatefulWidget {
//   @override
//   _MusicPlayerPageState createState() => _MusicPlayerPageState();
// }

// class _MusicPlayerPageState extends State<MusicPlayerPage> {
//   late AudioPlayer _audioPlayer;
//   bool _isPlaying = false;
//   double _volume = 1.0;
//   List<String> _playlists = [
//     'Playlist 1',
//     'Playlist 2',
//     'Playlist 3',
//   ];
//   List<List<String>> _songs = [
//     ['assets/music/song1.mp3', 'assets/music/song2.mp3', 'assets/music/song3.mp3'],
//     ['assets/music/song4.mp3', 'assets/music/song5.mp3', 'assets/music/song6.mp3'],
//     ['assets/music/song7.mp3', 'assets/music/song8.mp3', 'assets/music/song9.mp3'],
//   ];
//   int _currentPlaylistIndex = 0;
//   int _currentSongIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     _audioPlayer = AudioPlayer();
//     _audioPlayer.onPlayerStateChanged.listen((state) {
//       setState(() {
//         _isPlaying = state == PlayerState.playing;
//       });
//     });
    
//     // 监听其他应用程序播放的音乐
//     _audioPlayer.onAudioSessionActivation.listen((event) {
//       if (event.event == AudioSessionActivation.interruption) {
//         _audioPlayer.pause();
//       }
//     });
//   }

//   void _playNextSong() {
//     _currentSongIndex = (_currentSongIndex + 1) % _songs[_currentPlaylistIndex].length;
//     _audioPlayer.play(AssetSource(_songs[_currentPlaylistIndex][_currentSongIndex]));
//   }

//   void _switchPlaylist(int index) {
//     setState(() {
//       _currentPlaylistIndex = index;
//       _currentSongIndex = 0;
//       _audioPlayer.stop();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Music Player'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Now Playing',
//               style: TextStyle(
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 16.0),
//             Slider(
//               value: _volume,
//               onChanged: (value) {
//                 setState(() {
//                   _volume = value;
//                   _audioPlayer.setVolume(_volume);
//                 });
//               },
//               min: 0.0,
//               max: 1.0,
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 if (_isPlaying) {
//                   _audioPlayer.pause();
//                 } else {
//                   _audioPlayer.play(AssetSource(_songs[_currentPlaylistIndex][_currentSongIndex]));
//                 }
//               },
//               child: Text(_isPlaying ? 'Pause' : 'Play'),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: _playNextSong,
//               child: Text('Next'),
//             ),
//             SizedBox(height: 16.0),
//             DropdownButton<int>(
//               value: _currentPlaylistIndex,
//               onChanged: _switchPlaylist,
//               items: List.generate(_playlists.length, (index) {
//                 return DropdownMenuItem<int>(
//                   value: index,
//                   child: Text(_playlists[index]),
//                 );
//               }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // import 'dart:async';

// // import 'package:audioplayers/audioplayers.dart';
// // import 'package:flutter/material.dart';

// // class PlayerWidget extends StatefulWidget {
// //   final AudioPlayer player;

// //   const PlayerWidget({
// //     required this.player,
// //     super.key,
// //   });

// //   @override
// //   State<StatefulWidget> createState() {
// //     return _PlayerWidgetState();
// //   }
// // }

// // class _PlayerWidgetState extends State<PlayerWidget> {
// //   PlayerState? _playerState;
// //   Duration? _duration;
// //   Duration? _position;

// //   StreamSubscription? _durationSubscription;
// //   StreamSubscription? _positionSubscription;
// //   StreamSubscription? _playerCompleteSubscription;
// //   StreamSubscription? _playerStateChangeSubscription;

// //   bool get _isPlaying => _playerState == PlayerState.playing;

// //   bool get _isPaused => _playerState == PlayerState.paused;

// //   String get _durationText => _duration?.toString().split('.').first ?? '';

// //   String get _positionText => _position?.toString().split('.').first ?? '';

// //   AudioPlayer get player => widget.player;

// //   @override
// //   void initState() {
// //     super.initState();
// //     // Use initial values from player
// //     _playerState = player.state;
// //     player.getDuration().then(
// //           (value) => setState(() {
// //             _duration = value;
// //           }),
// //         );
// //     player.getCurrentPosition().then(
// //           (value) => setState(() {
// //             _position = value;
// //           }),
// //         );
// //     _initStreams();
// //   }

// //   @override
// //   void setState(VoidCallback fn) {
// //     // Subscriptions only can be closed asynchronously,
// //     // therefore events can occur after widget has been disposed.
// //     if (mounted) {
// //       super.setState(fn);
// //     }
// //   }

// //   @override
// //   void dispose() {
// //     _durationSubscription?.cancel();
// //     _positionSubscription?.cancel();
// //     _playerCompleteSubscription?.cancel();
// //     _playerStateChangeSubscription?.cancel();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final color = Theme.of(context).primaryColor;
// //     return Column(
// //       mainAxisSize: MainAxisSize.min,
// //       children: <Widget>[
// //         Row(
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             IconButton(
// //               key: const Key('play_button'),
// //               onPressed: _isPlaying ? null : _play,
// //               iconSize: 48.0,
// //               icon: const Icon(Icons.play_arrow),
// //               color: color,
// //             ),
// //             IconButton(
// //               key: const Key('pause_button'),
// //               onPressed: _isPlaying ? _pause : null,
// //               iconSize: 48.0,
// //               icon: const Icon(Icons.pause),
// //               color: color,
// //             ),
// //             IconButton(
// //               key: const Key('stop_button'),
// //               onPressed: _isPlaying || _isPaused ? _stop : null,
// //               iconSize: 48.0,
// //               icon: const Icon(Icons.stop),
// //               color: color,
// //             ),
// //           ],
// //         ),
// //         Slider(
// //           onChanged: (value) {
// //             final duration = _duration;
// //             if (duration == null) {
// //               return;
// //             }
// //             final position = value * duration.inMilliseconds;
// //             player.seek(Duration(milliseconds: position.round()));
// //           },
// //           value: (_position != null &&
// //                   _duration != null &&
// //                   _position!.inMilliseconds > 0 &&
// //                   _position!.inMilliseconds < _duration!.inMilliseconds)
// //               ? _position!.inMilliseconds / _duration!.inMilliseconds
// //               : 0.0,
// //         ),
// //         Text(
// //           _position != null
// //               ? '$_positionText / $_durationText'
// //               : _duration != null
// //                   ? _durationText
// //                   : '',
// //           style: const TextStyle(fontSize: 16.0),
// //         ),
// //       ],
// //     );
// //   }

// //   void _initStreams() {
// //     _durationSubscription = player.onDurationChanged.listen((duration) {
// //       setState(() => _duration = duration);
// //     });

// //     _positionSubscription = player.onPositionChanged.listen(
// //       (p) => setState(() => _position = p),
// //     );

// //     _playerCompleteSubscription = player.onPlayerComplete.listen((event) {
// //       setState(() {
// //         _playerState = PlayerState.stopped;
// //         _position = Duration.zero;
// //       });
// //     });

// //     _playerStateChangeSubscription =
// //         player.onPlayerStateChanged.listen((state) {
// //       setState(() {
// //         _playerState = state;
// //       });
// //     });
// //   }

// //   Future<void> _play() async {
// //     await player.resume();
// //     setState(() => _playerState = PlayerState.playing);
// //   }

// //   Future<void> _pause() async {
// //     await player.pause();
// //     setState(() => _playerState = PlayerState.paused);
// //   }

// //   Future<void> _stop() async {
// //     await player.stop();
// //     setState(() {
// //       _playerState = PlayerState.stopped;
// //       _position = Duration.zero;
// //     });
// //   }
// // }

// // // // import 'package:flutter/foundation.dart';
// // // import 'package:flutter/material.dart';
// // // // import 'package:flutter/widgets.dart';
// // // import 'package:provider/provider.dart';

// // // import '../data/player_controller.dart';
// // // import '../widgets/custombottomplayer.dart';
// // // import '../widgets/customlistview.dart';
// // // import '../widgets/customsearchfield.dart';

// // // class FavoriteScreen extends StatefulWidget {
// // //   FavoriteScreen({super.key});

// // //   @override
// // //   State<FavoriteScreen> createState() => _FavoriteScreenState();
// // // }

// // // class _FavoriteScreenState extends State<FavoriteScreen> {
// // //   final TextEditingController _searchController = TextEditingController();
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final screenSize = MediaQuery.of(context).size;
// // //     final appBarHeight = AppBar().preferredSize.height;
// // //     return Consumer<PlayerController>(
// // //       builder: (context, value, child) => Container(
// // //         height: screenSize.height -
// // //             appBarHeight -
// // //             10.0, // Subtract the height of the AppBar and the TextField
// // //         width: screenSize.width,
// // //         child: Stack(
// // //           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //           children: [
// // //             SingleChildScrollView(
// // //               child: Column(
// // //                 children: [
// // //                   Padding(
// // //                     padding: const EdgeInsets.all(10.0),
// // //                     child: Column(
// // //                       children: [
// // //                         /////searchfield
// // //                         CustomSearchField(
// // //                           searchController: _searchController,
// // //                           onChanged: value.searchAndFilter,
// // //                           onCancelSearch: value.onCancelSearch,
// // //                         ),
// // //                         /////list view
// // //                         ListView.builder(
// // //                           shrinkWrap: true,
// // //                           padding: const EdgeInsets.only(top: 10),
// // //                           physics: const NeverScrollableScrollPhysics(),
// // //                           itemCount:
// // //                               // value.filterfavoretsong.length,
// // //                               value.isFavoritesMode
// // //                                   ? value.filterfavoretsong.length
// // //                                   : value.filteredsong.length,
// // //                           itemBuilder: ((context, index) => CustomListView(
// // //                                 index: index,
// // //                                 playlist: value.isFavoritesMode
// // //                                     ? value.filterfavoretsong[index]
// // //                                     : value.filteredsong[index],
// // //                               )),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                   SizedBox(
// // //                     height: 160,
// // //                   ),
// // //                   // NavBarScreen(),
// // //                 ],
// // //               ),
// // //             ),
// // //             CustomBottomPlayer(),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

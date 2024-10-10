// import 'dart:math';
// import 'dart:ui';

// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// // import 'package:just_audio/just_audio.dart' as jj;

// import '../data/playlist_data.dart';
// import '../data/playlist_provider.dart';
// import '../models/playlist_model.dart';
// import '../models/song_model.dart';
// // import '../widget/widgets.dart';
// import '../uitles/colors.dart';
// import '../widgets/flutter_toast.dart';
// import '../widgets/nav_bar_audio_player.dart';
// import '../widgets/widgets.dart';

// class HomeScreen extends StatefulWidget {
//   HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   bool isPlaying = false;
//   bool isLoop = false;
//   bool _isShuffleEnabled = false;
//   int _currentIndex = 0;
//   final AudioPlayer player = AudioPlayer();

//   late AssetSource path;
//   late AudioCache cache;
//   Duration _duration = Duration();
//   Duration _postion = Duration();

//   List<Song> songs = Song.songs;
//   List<Playlist> playlists = PlaylistProvider.playlistsong;
//   late List<Playlist> _filteredsong = [];
//   String titelsong = "قم باختيار نشيد لتشغيلة";

//   final TextEditingController _searchController = TextEditingController();


//   void _loadAudio() async {
//     await player.play(AssetSource(_filteredsong[_currentIndex].url));
//     isPlaying = true;
//     setState(() {});
//   }

//   Future<void> _playSelectedSong(int index) async {
//     try {
//       setState(() {
//         _currentIndex = index;
//       });
//       await initplayer();
//     } catch (ex) {}
//   }

//   Future<void> initplayer() async {
//     try {
//       setState(() {
//         path = AssetSource(_filteredsong[_currentIndex].url);
//         titelsong = _filteredsong[_currentIndex].title;
//       });

//       if (isLoop) {
//         player.setReleaseMode(ReleaseMode.loop);
//       } else {
//         player.setReleaseMode(ReleaseMode.stop);
//       }

//       player.onDurationChanged.listen((Duration d) {
//         setState(() => _duration = d);
//       });
//       player.onPositionChanged.listen((Duration p) {
//         setState(() => _postion = p);
//       });

//       // player.onPositionChanged.listen((Duration p) {
//       //   setState(() => _postion = p);
//       // });

//       await player.play(path);
//       isPlaying = true;
//       setState(() {});
//     } catch (ex) {}
//   }

//   void wheneFinsh() {
//     player.onPlayerComplete.listen((_) {
    
//       _skipNext();
//     });
//   }

//   Future<void> playPuse() async {
//     try {
//       // print(path);

//       if (isPlaying || player.state == PlayerState.playing) {
//         player.pause();
//         isPlaying = false;
//       } else {
//         player.play(path);
//         isPlaying = true;
//       }
//       setState(() {});
//     } catch (ex) {
//       ShowMasseg.ShowToastMasseg("قم باختيار نشيد لتشغيلة", Colors.grey);
      
//     }
//   }

  

//   Future<void> _skipPrevious() async {
//     if (_isShuffleEnabled) {
//       _currentIndex = Random().nextInt(playlists.length);
//     } else {
//       _currentIndex = (_currentIndex - 1) % playlists.length;
//     }
//     setState(() {});
//     await initplayer();
//   }

//   Future<void> _skipNext() async {
//     if (_isShuffleEnabled) {
//       _currentIndex = Random().nextInt(playlists.length);
//     } else {
//       _currentIndex = (_currentIndex + 1) % playlists.length;
//     }
//     setState(() {});
//     print(_currentIndex);
//     await initplayer();
//   }

//   void _toggleShuffle() {
//     if (_isShuffleEnabled) {
//       _isShuffleEnabled = false;
//       ShowMasseg.ShowToastMasseg("تم الغاء التشغيل العشوائي", Colors.grey);
//     } else {
//       _isShuffleEnabled = true;
//       ShowMasseg.ShowToastMasseg("تم تفعيل التشغيل العشوائي", Colors.grey);
//     }
//     setState(() {});
//   }

//   void _toggleRepeat() async {
//     if (isLoop) {
//       isLoop = false;
//       ShowMasseg.ShowToastMasseg("تم الغاء التشغيل المتكرر", Colors.grey);
//     } else {
//       isLoop = true;
//       ShowMasseg.ShowToastMasseg("تم تفعيل التشغيل المتكرر", Colors.grey);
//     }
//     setState(() {});
//     await initplayer();
//   }

//   void seekTo(int sec) {
//     player.seek(Duration(seconds: sec));
//   }

//   bool _isfov(int id) {
//     return PlaylistProvider.isFovarite(id);
//   }

//   void _searchAndFilter(String query) {
//     if (query.isEmpty) {
//       setState(() {
//         _filteredsong = playlists;
//       });
//     } else {
//       setState(() {
//         _filteredsong = playlists.where((favoritecompan) {
//           return favoritecompan.title
//               .toLowerCase()
//               .contains(query.toLowerCase());
//         }).toList();
//       });
//     }
//   }

//   void _onCancelSearch() {
//     setState(() {
//       _searchController.clear();
//       playlists = playlists;
//     });
//   }

//   String _formatDuration(Duration duration) {
//     final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
//     final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
//     return '$minutes:$seconds';
//   }

//   @override
//   void initState() {
//     _filteredsong = playlists;
//     wheneFinsh();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     player.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     final appBarHeight = AppBar().preferredSize.height;
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             Colors.green.shade800.withOpacity(0.8),
//             Colors.green.shade200.withOpacity(0.8),
//           ],
//         ),
//       ),
//       child: Scaffold(
//         // backgroundColor: LigthColor.whiteColor,
//         backgroundColor: Colors.transparent,
//         // drawerScrimColor: LigthColor.whiteColor,
//         appBar: _CustomAppBar(),
//         drawer: _CustomDrawer(),
//         // bottomNavigationBar:
//         //     // NavBarScreen(),
//         //     const _CustomNavBar(),
//         body: Container(
//           height: screenSize.height -
//               appBarHeight -
//               10.0, // Subtract the height of the AppBar and the TextField
//           width: screenSize.width,
//           child: Stack(
//             children: [
//               SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     // const _DiscoverMusic(),
//                     // _TrendingMusic(songs: songs),
//                     // _PlaylistMusic(playlists: playlists),
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         children: [
//                           // Searchbar(searchAndFilter: (p0) =>_searchAndFilter ,),
//                           Container(
//                             margin: EdgeInsets.all(10),
//                             height: 45,
//                             decoration: BoxDecoration(
//                                 color: LigthColor.whiteColor,
//                                 borderRadius: BorderRadius.circular(10),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: LigthColor.massegeColor
//                                         .withOpacity(0.1),
//                                     spreadRadius: 1,
//                                     blurRadius: 3,
//                                   )
//                                 ]),
//                             child: Row(
//                               children: [
//                                 IconButton(
//                                     icon: FaIcon(
//                                       FontAwesomeIcons.x,
//                                       size: 15,
//                                       color: LigthColor.iconlist,
//                                     ),
//                                     onPressed: () {
//                                       _searchController.clear();
//                                       _searchAndFilter('');
//                                     }),
//                                 Expanded(
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: TextField(
//                                       style: TextStyle(
//                                           color: LigthColor.maingreencolor,
//                                           fontFamily: "Rubik"),
//                                       textInputAction: TextInputAction.search,
//                                       controller: _searchController,
//                                       textAlign: TextAlign.right,
//                                       textAlignVertical:
//                                           TextAlignVertical.center,
//                                       onChanged: _searchAndFilter,
//                                       decoration: InputDecoration(
//                                           hintText: ' ...البحث عن ',
//                                           border: InputBorder.none,
//                                           hintStyle: TextStyle(
//                                               fontSize: 12,
//                                               fontFamily: "Rubik")),
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Icon(
//                                     Icons.search,
//                                     color: LigthColor.bieagcolor,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),

//                           // const SectionHeader(title: 'Playlists'),
//                           Consumer<PlaylistProvider>(
//                             builder: (context, value, child) =>
//                                 ListView.builder(
//                               shrinkWrap: true,
//                               padding: const EdgeInsets.only(top: 10),
//                               physics: const NeverScrollableScrollPhysics(),
//                               itemCount: _filteredsong.length,
//                               itemBuilder: ((context, index) {
//                                 return InkWell(
//                                   onTap: () async {
//                                     await _playSelectedSong(index);
//                                   },
//                                   child: Container(
//                                     height: 75,
//                                     margin: const EdgeInsets.only(bottom: 10),
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 20),
//                                     decoration: BoxDecoration(
//                                       color: LigthColor.whiteColor,
//                                       borderRadius: BorderRadius.circular(15.0),
//                                     ),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceAround,
//                                       children: [
//                                         ClipRRect(
//                                           borderRadius:
//                                               BorderRadius.circular(10.0),
//                                           child: Image.asset(
//                                             // playlists[index].coverUrl,
//                                             _filteredsong[index].coverUrl,
//                                             height: 50,
//                                             width: 50,
//                                             fit: BoxFit.cover,
//                                           ),
//                                         ),
//                                         SizedBox(width: 20),
//                                         Expanded(
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: [
//                                               Text(
//                                                 // playlists[index].title,
//                                                 _filteredsong[index].title,
//                                                 textDirection:
//                                                     TextDirection.rtl,
//                                                 style: Theme.of(context)
//                                                     .textTheme
//                                                     .bodyLarge!
//                                                     .copyWith(
//                                                         fontWeight:
//                                                             FontWeight.bold),
//                                               ),
//                                               Text(
//                                                 // playlists[index].description,
//                                                 '${_filteredsong[index].description}',
//                                                 textDirection:
//                                                     TextDirection.rtl,
//                                                 maxLines: 2,
//                                                 style: Theme.of(context)
//                                                     .textTheme
//                                                     .bodySmall,
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         SizedBox(width: 20),
//                                         IconButton(
//                                           onPressed: () {
//                                             value.addFavoretSongOrdelet(
//                                                 _filteredsong[index]);
//                                           },
//                                           icon: _isfov(_filteredsong[index].id)
//                                               ? FaIcon(
//                                                   FontAwesomeIcons
//                                                       .heartCircleCheck,
//                                                   // size: 22,

//                                                   color: LigthColor.maincolor,
//                                                   //color: LigthColor.maingreencolor,
//                                                 )
//                                               : FaIcon(
//                                                   FontAwesomeIcons.heart,
//                                                   // size: 22,

//                                                   color: LigthColor.maincolor,
//                                                   //color: LigthColor.maingreencolor,
//                                                 ),
//                                         ),
//                                         // icon: Icon(
//                                         //   Icons.favorite,

//                                         //   // Icons.play_circle,
//                                         //   color: LigthColor.maincolor,
//                                         //   // color: Colors.black,
//                                         // ),
//                                         // ),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                                 // return PlaylistCard(playlist: playlists[index]);
//                               }),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 180,
//                     ),
//                     // NavBarScreen(),
//                   ],
//                 ),
//               ),
//               Positioned(
//                 bottom: 0,
//                 right: 0,
//                 left: 0,
//                 height: 200,
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: LigthColor.whiteColor,
                     
//                       borderRadius: BorderRadius.circular(15.0)),
//                   child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Text(
//                               titelsong,
//                               style: TextStyle(
//                                 color: LigthColor.massegeColor,
//                                 // color: LigthColor.maincolor,
//                                 fontSize: 20,
//                                 // fontWeight: FontWeight.bold
//                               ),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Text(
//                               "${_formatDuration(_duration)}",
//                               style: TextStyle(color: LigthColor.massegeColor),
//                             ),
//                             Expanded(
//                               child: Container(
//                                 // width: 300,
//                                 child: SliderTheme(
//                                   data: SliderThemeData(
//                                     activeTrackColor: LigthColor.maincolor,
//                                     inactiveTrackColor: Colors.grey,
//                                     thumbColor: Colors.white,
//                                     overlayColor: Colors.green.withAlpha(50),
//                                   ),
//                                   child: Slider(
//                                     value: _postion.inSeconds.toDouble(),
//                                     max: _duration.inSeconds.toDouble(),

//                                     // min: 0,
//                                     onChanged: (value) async {
//                                       await player.seek(
//                                           Duration(seconds: value.toInt()));
//                                       setState(() {});
//                                     },

//                                     // inactiveColor: ,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Text(
//                               "${_formatDuration(_postion)}",
//                               style: TextStyle(color: LigthColor.massegeColor),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             IconButton(
//                               onPressed: () {
//                                 _toggleShuffle();
//                                 // player.stop();
//                               },
//                               icon: Icon(
//                                 Icons.shuffle,
//                                 size: 30,

//                                 // opticalSize: 30,
//                                 color: _isShuffleEnabled
//                                     ? LigthColor.maincolor
//                                     : LigthColor.graycolor,
//                               ),
//                             ),
//                             IconButton(
//                                 onPressed: () async {
//                                   await _skipNext();
//                                 },
//                                 icon: const Icon(
//                                   Icons.skip_next,
//                                   size: 30,
//                                   color: LigthColor.maincolor,
//                                 )),
//                             IconButton(
//                                 onPressed: () {
//                                   playPuse();
//                                 },
//                                 icon: isPlaying
//                                     ? Icon(
//                                         Icons.pause_circle,
//                                         size: 30,
//                                         color: LigthColor.maincolor,
//                                       )
//                                     : Icon(
//                                         Icons.play_circle,
//                                         size: 30,
//                                         color: LigthColor.maincolor,
//                                       )),
//                             IconButton(
//                               onPressed: () async {
//                                 await _skipPrevious();
//                                 // player.stop();
//                               },
//                               icon: const Icon(
//                                 Icons.skip_previous,
//                                 size: 30,

//                                 // opticalSize: 30,
//                                 color: LigthColor.maincolor,
//                               ),
//                             ),
//                             IconButton(
//                               onPressed: () {
//                                 _toggleRepeat();
//                                 // player.stop();
//                               },
//                               icon: Icon(
//                                 Icons.loop,
//                                 size: 30,

//                                 // opticalSize: 30,
//                                 color: isLoop
//                                     ? LigthColor.maincolor
//                                     : LigthColor.graycolor,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Image(
//                           image: AssetImage('assets/images/blutt2.png'),
//                         ),
//                       ]),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Searchbar extends StatefulWidget {
//   // final String text;
//   final GestureTapCallback? press;
//   // final TextEditingController searchController ;
//   final Function(String)? searchAndFilter;
//   Searchbar({
//     super.key,
//     // required this.text,
//     this.press,
//     // required void ,
//     this.searchAndFilter,
//     // required this.searchController
//   });

//   @override
//   State<Searchbar> createState() => _SearchbarState();
// }

// class _SearchbarState extends State<Searchbar> {
//   final TextEditingController _searchController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(10),
//       height: 45,
//       decoration: BoxDecoration(
//           color: LigthColor.whiteColor,
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: [
//             BoxShadow(
//               color: LigthColor.massegeColor.withOpacity(0.1),
//               spreadRadius: 1,
//               blurRadius: 3,
//             )
//           ]),
//       child: Row(
//         children: [
//           IconButton(
//               icon: FaIcon(
//                 FontAwesomeIcons.x,
//                 size: 15,
//                 color: LigthColor.iconlist,
//               ),
//               onPressed: () {
//                 _searchController.clear();
//                 widget.searchAndFilter!('');
//               }),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 style: TextStyle(
//                     color: LigthColor.maingreencolor, fontFamily: "Rubik"),
//                 textInputAction: TextInputAction.search,
//                 controller: _searchController,
//                 textAlign: TextAlign.right,
//                 textAlignVertical: TextAlignVertical.center,
//                 onChanged: widget.searchAndFilter,
//                 decoration: InputDecoration(
//                     hintText: ' ...البحث عن ',
//                     border: InputBorder.none,
//                     hintStyle: TextStyle(fontSize: 12, fontFamily: "Rubik")),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Icon(
//               Icons.search,
//               color: LigthColor.bieagcolor,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _PlaylistMusic extends StatelessWidget {
//   const _PlaylistMusic({
//     Key? key,
//     required this.playlists,
//   }) : super(key: key);

//   final List<Playlist> playlists;
//   // final List<Song> playlists;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         children: [
//           const SectionHeader(title: 'Playlists'),
//           ListView.builder(
//             shrinkWrap: true,
//             padding: const EdgeInsets.only(top: 20),
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: playlists.length,
//             itemBuilder: ((context, index) {
//               return PlaylistCard(playlist: playlists[index]);
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _TrendingMusic extends StatelessWidget {
//   const _TrendingMusic({
//     Key? key,
//     required this.songs,
//   }) : super(key: key);

//   final List<Song> songs;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(
//         left: 20.0,
//         top: 20.0,
//         bottom: 20.0,
//       ),
//       child: Column(
//         children: [
//           const Padding(
//             padding: EdgeInsets.only(right: 20.0),
//             child: SectionHeader(title: 'Trending Music'),
//           ),
//           const SizedBox(height: 20),
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.27,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: songs.length,
//               itemBuilder: (context, index) {
//                 return SongCard(song: songs[index]);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _DiscoverMusic extends StatelessWidget {
//   const _DiscoverMusic({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Welcome',
//             style: Theme.of(context).textTheme.bodyLarge,
//           ),
//           const SizedBox(height: 5),
//           Text(
//             'Enjoy your favorite music',
//             style: Theme.of(context)
//                 .textTheme
//                 .titleLarge!
//                 .copyWith(fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 20),
//           TextFormField(
//             decoration: InputDecoration(
//               isDense: true,
//               filled: true,
//               fillColor: Colors.white,
//               hintText: 'Search',
//               hintStyle: Theme.of(context)
//                   .textTheme
//                   .bodyMedium!
//                   .copyWith(color: Colors.grey.shade400),
//               prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(15.0),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _CustomNavBar extends StatelessWidget {
//   const _CustomNavBar({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//       backgroundColor: Colors.deepPurple.shade800,
//       unselectedItemColor: Colors.white,
//       selectedItemColor: Colors.white,
//       showUnselectedLabels: false,
//       showSelectedLabels: false,
//       items: const [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           label: 'Home',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.favorite_outline),
//           label: 'Favorites',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.play_circle_outline),
//           label: 'Play',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.people_outline),
//           label: 'Profile',
//         ),
//       ],
//     );
//   }
// }

// class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   _CustomAppBar({
//     Key? key,
//   }) : super(key: key);
//   final String titleappbar = "الرئيسية";

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       foregroundColor: LigthColor.whiteColor,
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       // leading:
//       // Padding(
//       //   padding: const EdgeInsets.all(5),
//       //   child: Row(
//       //     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       //     children: [
//       //       IconButton(
//       //         onPressed: () {
//       //           // Navigator.push(
//       //           //     context,
//       //           //     new MaterialPageRoute(
//       //           //         builder: (context) => new Notiation_Screen()));
//       //         },
//       //         icon: Icon(
//       //           Icons.grid_view_rounded,
//       //           color: Colors.white,
//       //         ),
//       //         // icon: Image.asset(
//       //         //   "assets/images/bell.png",
//       //         //   height: 25,
//       //         // ),
//       //       ),
//       //       SizedBox(
//       //         width: 5,
//       //       ),
//       //       IconButton(
//       //         icon: FaIcon(
//       //           FontAwesomeIcons.search,
//       //           // size: 22,
//       //           color: Colors.white,
//       //           //color: LigthColor.maingreencolor,
//       //         ),
//       //         onPressed: () {
//       //           // Navigator.push(
//       //           //     context,
//       //           //     new MaterialPageRoute(
//       //           //         builder: (context) => new Companies_screen()));
//       //         },
//       //       ),
//       //     ],
//       //   ),
//       // ),
//       //     IconButton(
//       //   icon: FaIcon(
//       //     FontAwesomeIcons.search,
//       //     // size: 22,
//       //     color: Colors.white,
//       //     //color: LigthColor.maingreencolor,
//       //   ),
//       //   onPressed: () {
//       //     // Navigator.push(
//       //     //     context,
//       //     //     new MaterialPageRoute(
//       //     //         builder: (context) => new Companies_screen()));
//       //   },
//       // ),
//       title: Text(
//         titleappbar,
//         style: TextStyle(
//             color: LigthColor.whiteColor,
//             fontSize: 25,
//             fontWeight: FontWeight.bold),
//       ),
//       centerTitle: true,
//       actions: [
//         Container(
//           margin: const EdgeInsets.only(right: 20),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(20.0),
//             child: Image.asset(
//               'assets/images/Logo_of_the_technical_center.jpg',
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(56.0);
// }

// class _CustomDrawer extends StatelessWidget {
//   _CustomDrawer({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       surfaceTintColor: LigthColor.whiteColor,
//       backgroundColor: LigthColor.whiteColor,
//       child: Container(
//         decoration: BoxDecoration(
//             color: LigthColor.whiteColor,
//             borderRadius: BorderRadius.circular(10.0)),
//         child: ListView(children: [
//           DrawerHeader(
//             child: Center(
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10.0),
//                 child: Image.asset(
//                   'assets/images/Logo_of_the_technical_center.jpg',
//                   height: 150,
//                   width: 150,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.symmetric(vertical: 10.0),
//             child: ListTile(
//               leading: Icon(
//                 Icons.home,
//                 color: LigthColor.maincolor,
//                 size: 22,
//               ),
//               title: Text(
//                 'الرئيسية',
//                 style: TextStyle(
//                   fontSize: 22,
//                   color: LigthColor.maincolor,
//                 ),
//               ),
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.symmetric(vertical: 10.0),
//             child: ListTile(
//               leading: Icon(
//                 Icons.favorite,
//                 color: LigthColor.maincolor,
//                 size: 22,
//               ),
//               title: Text(
//                 'المفضلة',
//                 style: TextStyle(
//                   fontSize: 22,
//                   color: LigthColor.maincolor,
//                 ),
//               ),
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.symmetric(vertical: 10.0),
//             child: ListTile(
//               leading: Icon(
//                 Icons.money_sharp,
//                 color: LigthColor.maincolor,
//                 size: 22,
//               ),
//               title: Text(
//                 'الاناشيد القديمة+الجديده',
//                 style: TextStyle(
//                   fontSize: 22,
//                   color: LigthColor.maincolor,
//                 ),
//               ),
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.symmetric(vertical: 10.0),
//             child: ListTile(
//               leading: Icon(
//                 Icons.download,
//                 color: LigthColor.maincolor,
//                 size: 22,
//               ),
//               title: Text(
//                 'التنزيلات',
//                 style: TextStyle(
//                   fontSize: 22,
//                   color: LigthColor.maincolor,
//                 ),
//               ),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }

//   // @override
//   // Size get preferredSize => const Size.fromHeight(56.0);
// }

// // import 'package:flutter/material.dart';

// // import '../uitles/colors.dart';
// // import '../widget/nav_bar_audio_player.dart';

// // class HomeScreen extends StatefulWidget {
// //   const HomeScreen({super.key});

// //   @override
// //   State<HomeScreen> createState() => _HomeScreenState();
// // }

// // class _HomeScreenState extends State<HomeScreen> {
// //   final String titleappbar = "الرئيسية";
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: LigthColor.whiteColor,
// //       appBar: AppBar(
// //         foregroundColor: LigthColor.maincolor,
// //         backgroundColor: LigthColor.whiteColor,
// //         elevation: 0,
// //         title: Text(
// //           titleappbar,
// //           style: TextStyle(color: LigthColor.maincolor, fontSize: 25),
// //         ),
// //         centerTitle: true,
// //         actions: [
// //           IconButton(
// //             onPressed: () {},
// //             icon: const Icon(Icons.search),
// //             color: LigthColor.maincolor,
// //           ),
// //         ],
// //       ),
// //       drawer: Drawer(
// //         surfaceTintColor: LigthColor.whiteColor,
// //         backgroundColor: LigthColor.whiteColor,
// //         child: Container(
// //           decoration: BoxDecoration(
// //               color: LigthColor.whiteColor,
// //               borderRadius: BorderRadius.circular(10.0)),
// //           child: ListView(children: [
// //             DrawerHeader(
// //               child: Center(
// //                 child: ClipRRect(
// //                   borderRadius: BorderRadius.circular(10.0),
// //                   child: Image.asset(
// //                     'assets/images/Logo_of_the_technical_center.jpg',
// //                     height: 150,
// //                     width: 150,
// //                     fit: BoxFit.cover,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             const Padding(
// //               padding: EdgeInsets.symmetric(vertical: 10.0),
// //               child: ListTile(
// //                 leading: Icon(
// //                   Icons.home,
// //                   color: LigthColor.maincolor,
// //                   size: 22,
// //                 ),
// //                 title: Text(
// //                   'الرئيسية',
// //                   style: TextStyle(
// //                     fontSize: 22,
// //                     color: LigthColor.maincolor,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             const Padding(
// //               padding: EdgeInsets.symmetric(vertical: 10.0),
// //               child: ListTile(
// //                 leading: Icon(
// //                   Icons.favorite,
// //                   color: LigthColor.maincolor,
// //                   size: 22,
// //                 ),
// //                 title: Text(
// //                   'المفضلة',
// //                   style: TextStyle(
// //                     fontSize: 22,
// //                     color: LigthColor.maincolor,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             const Padding(
// //               padding: EdgeInsets.symmetric(vertical: 10.0),
// //               child: ListTile(
// //                 leading: Icon(
// //                   Icons.money_sharp,
// //                   color: LigthColor.maincolor,
// //                   size: 22,
// //                 ),
// //                 title: Text(
// //                   'الاناشيد القديمة+الجديده',
// //                   style: TextStyle(
// //                     fontSize: 22,
// //                     color: LigthColor.maincolor,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             const Padding(
// //               padding: EdgeInsets.symmetric(vertical: 10.0),
// //               child: ListTile(
// //                 leading: Icon(
// //                   Icons.download,
// //                   color: LigthColor.maincolor,
// //                   size: 22,
// //                 ),
// //                 title: Text(
// //                   'التنزيلات',
// //                   style: TextStyle(
// //                     fontSize: 22,
// //                     color: LigthColor.maincolor,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ]),
// //         ),
// //       ),
// //       body: NavBarScreen(),
// //     );
// //   }
// // }

/////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class Searchbar extends StatefulWidget {
//   final String text;
//   final GestureTapCallback? press;
//   const Searchbar(
//       {super.key,
//       required this.text,
//       this.press,
//       required void Function(String query) onChanged,
//       required TextEditingController searchcontroller});

//   @override
//   State<Searchbar> createState() => _SearchbarState();
// }

// class _SearchbarState extends State<Searchbar> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(15),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               spreadRadius: 1,
//               blurRadius: 1,
//             )
//           ]),
//       child: Row(children: [
//         IconButton(
//             icon: FaIcon(
//               FontAwesomeIcons.sliders,
//               size: 22,
//               color: Color.fromARGB(255, 87, 124, 163),
//             ),
//             onPressed: () {
//               widget.press;
//             }),
//         Expanded(
//             child: TextField(
//           textInputAction: TextInputAction.search,
//           textAlignVertical: TextAlignVertical.center,
//           textAlign: TextAlign.right,
//           decoration: InputDecoration(
//             border: InputBorder.none,
//             hintText: widget.text,
//           ),
//         )),
//         IconButton(
//             icon: Icon(
//               Icons.search,
//             ),
//             onPressed: () {}),
//       ]),
//     );
//   }
// }

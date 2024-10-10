class Playlist {
  final int id;
  final String title;
  final String description;
  final String url;
  // final String coverUrl;

  Playlist({
    required this.id,
    required this.title,
    required this.description,
    required this.url,
    // required this.coverUrl,
  });
  factory Playlist.fromMap(Map<String, dynamic> map) {
    return Playlist(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      url: map['url'] as String,
      // coverUrl: map['coverUrl'] as String,
    );
  }
  static fromJson(p) {}

  // static List<Playlist> playlists = [
  //   Playlist(
  //     id: 1,
  //     title: 'انا الشجاع',
  //     description: 'فتية المسيرة',
  //     url: 'music/1.mp3',
  //     coverUrl: 'assets/images/Logo_of_the_technical_center.jpg',
  //   ),
  //   Playlist(
  //     id: 2,
  //     title: 'ان حدثتني النفس',
  //     description: 'فتية المسيرة',
  //     url: 'music/2.mp3',
  //     coverUrl: 'assets/images/Logo_of_the_technical_center.jpg',
  //   ),
  //   Playlist(
  //     id: 3,
  //     title: 'زدني شكرا',
  //     description: 'فتية المسيرة',
  //     url: 'music/3.mp3',
  //     coverUrl: 'assets/images/Logo_of_the_technical_center.jpg',
  //   ),
  //   Playlist(
  //     id: 4,
  //     title: 'لي باهل البيت',
  //     description: 'فتية المسيرة',
  //     url: 'music/4.mp3',
  //     coverUrl: 'assets/images/Logo_of_the_technical_center.jpg',
  //   ),
  //   Playlist(
  //     id: 5,
  //     title: 'شكر الله',
  //     description: 'فتية المسيرة',
  //     url: 'music/5.mp3',
  //     coverUrl: 'assets/images/Logo_of_the_technical_center.jpg',
  //   ),
  //   Playlist(
  //     id: 6,
  //     title: 'شفتك',
  //     description: 'حسين الجسمي',
  //     url: 'music/Hassen_sheftak.mp3',
  //     coverUrl: 'assets/images/Logo_of_the_technical_center.jpg',
  //   ),
  //   Playlist(
  //     id: 7,
  //     title: 'نغمه واحد',
  //     description: 'موسيقى',
  //     url: 'music/illusions.mp3',
  //     coverUrl: 'assets/images/Logo_of_the_technical_center.jpg',
  //   ),
  //   Playlist(
  //     id: 8,
  //     title: 'نغمة اثنين',
  //     description: 'موسيقى',
  //     url: 'music/glass.mp3',
  //     coverUrl: 'assets/images/Logo_of_the_technical_center.jpg',
  //   ),
  //   Playlist(
  //     id: 9,
  //     title: 'نغمة ثلاثه',
  //     description: 'موسيقى',
  //     url: 'music/pray.mp3',
  //     coverUrl: 'assets/images/Logo_of_the_technical_center.jpg',
  //   )
  // ];
}





// import 'song_model.dart';

// class Playlist {
//   final String title;
//   final List<Song> songs;
//   final String imageUrl;

//   Playlist({
//     required this.title,
//     required this.songs,
//     required this.imageUrl,
//   });

//   static List<Playlist> playlists = [
//     Playlist(
//       title: 'Hip-hop R&B Mix',
//       songs: Song.songs,
//       imageUrl:
//           'assets/images/Logo_of_the_technical_center.jpg',
//     ),
//     Playlist(
//       title: 'Rock & Roll',
//       songs: Song.songs,
//       imageUrl:
//           'assets/images/Logo_of_the_technical_center.jpg',
//     ),
//     Playlist(
//       title: 'Techno',
//       songs: Song.songs,
//       imageUrl:
//           'assets/images/Logo_of_the_technical_center.jpg',
//     )
//   ];
// }

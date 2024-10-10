import 'package:dio/dio.dart';
import 'package:fityatalmasera/widgets/flutter_toast.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:provider/provider.dart';

// import '../data/player_controller.dart';
import '../Api/api_url.dart';
import '../data/allsongapi_controller.dart';
import '../models/apisong_model.dart';
// import '../models/playlist_model.dart';
import '../uitles/colors.dart';

// ignore: must_be_immutable
class CustomListViewAllSong extends StatefulWidget {
  CustomListViewAllSong({super.key, required this.index, this.songall});
  int index;
  List<SongApi>? songall;

  @override
  State<CustomListViewAllSong> createState() => _CustomListViewAllSongState();
}

class _CustomListViewAllSongState extends State<CustomListViewAllSong> {
  BaseUrl _baseUrl = new BaseUrl();
  bool didDispose = true;

  Future<void> _generatefile(int? id) async {
    try {
      bool response = await AllSongs_Api.generatefile(id);
      setState(() {
        if (response) {
          _launchUrl(Uri.parse(
              "${_baseUrl.baseurl.trim()}${_baseUrl.getAudioFile.trim()}${id}"));
        }
        didDispose = true;
      });
    } on DioException catch (e) {
      didDispose = true;
      ShowMasseg.ShowToastMasseg(
          "لايوجد اتصال بالانترنت", LigthColor.favorColor);
      // print(e);
    }
  }

  Future<void> _launchUrl(Uri _launchurl) async {
    if (!await launchUrl(_launchurl)) {
      throw Exception('Could not launch $_launchurl');
    }
  }

  Future<void> _onDownlodfile(int? id) async {
    bool r = await ShowMasseg.onDownlodfile(context, 'هل أنت متأكد؟',
        'هل تريد تحميل هذا النشيد ${widget.songall![widget.index].name}؟');
    if (r) {
      setState(() {
        didDispose = false;
      });
      _generatefile(id);
    }
    // bool r = await

    // if (!r) {
    //   // return exit(0);
    //   return r;
    // } else {
    //   exit(0);
    //   // return r;
    // }
  }

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<PlayerController>(context, listen: false);
    return InkWell(
      onTap: () async {
        // didDispose = false;
        await _onDownlodfile(widget.songall![widget.index].id);
        // await _generatefile(widget.songall[widget.index].id);
        // await _launchUrl(Uri.parse(songall[index].songUrl.toString()));
        // print(widget.songall[widget.index].songUrl);
        // provider.playSelectedSong(index);
      },
      child: didDispose == false
          ? Center(
              child: CircularProgressIndicator(
              color: LigthColor.maincolor,
              backgroundColor: LigthColor.whiteColor,
            ))
          : Container(
              height: 75,
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: LigthColor.whiteColor,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'assets/images/Main_Logo.jpg',
                      height: 50,
                      width: 50,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.songall![widget.index].name.toString(),
                          textDirection: TextDirection.rtl,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.songall![widget.index].description.toString(),
                          textDirection: TextDirection.rtl,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  IconButton(
                    onPressed: () async {
                      await _onDownlodfile(widget.songall![widget.index].id);
                      // await provider.addFavoretSongOrdelet(playlist);
                      // if (provider.isFavoritesMode) {
                      //   // setState(() {});
                      // }
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.arrowDown,
                      // size: 22,

                      color: LigthColor.maincolor,
                      //color: LigthColor.maingreencolor,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

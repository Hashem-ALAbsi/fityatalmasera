import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../data/player_controller.dart';
import '../models/playlist_model.dart';
import '../uitles/colors.dart';

// ignore: must_be_immutable
class CustomListView extends StatelessWidget {
  CustomListView({super.key, required this.index, required this.playlist});
  int index;
  Playlist playlist;

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<PlayerController>(context, listen: false);
    return Consumer<PlayerController>(
      builder: (context, provider, child) => InkWell(
        onTap: () async {
          provider.playSelectedSong(index);
        },
        child: Container(
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
                      playlist.title,
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      playlist.description,
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
                  await provider.addFavoretSongOrdelet(playlist);
                  // if (provider.isFavoritesMode) {
                  //   // setState(() {});
                  // }
                },
                icon: provider.isFavoritesMode
                    ? FaIcon(
                        FontAwesomeIcons.heartCircleCheck,
                        // size: 22,

                        color: LigthColor.maincolor,
                        //color: LigthColor.maingreencolor,
                      )
                    : provider.isFovarite(playlist.id)
                        ? FaIcon(
                            FontAwesomeIcons.heartCircleCheck,
                            // size: 22,

                            color: LigthColor.maincolor,
                            //color: LigthColor.maingreencolor,
                          )
                        : FaIcon(
                            FontAwesomeIcons.heart,
                            // size: 22,

                            color: LigthColor.maincolor,
                            //color: LigthColor.maingreencolor,
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

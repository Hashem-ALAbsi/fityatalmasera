import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/player_controller.dart';
import '../uitles/colors.dart';

class CustomBottomPlayer extends StatelessWidget {
  CustomBottomPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    // final value = Provider.of<PlayerController>(context, listen: false);
    return Consumer<PlayerController>(
      builder: (context, provider, child) => Positioned(
        bottom: 0,
        right: 0,
        left: 0,
        height: 170,
        child: Container(
          decoration: BoxDecoration(
              color: LigthColor.whiteColor,
              image: DecorationImage(
                image: AssetImage('assets/images/blutt3.png'),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(15.0)),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  provider.titelsong,
                  style: TextStyle(
                    color: LigthColor.massegeColor,
                    // color: LigthColor.maincolor,
                    fontSize: 20,
                    // fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${provider.formatDuration(provider.duration)}",
                    // "${_duration.inMinutes}:${_duration.inSeconds > 60 ? 60 : _duration.inSeconds}",
                    // "${_duration.inSeconds.toDouble()}",
                    style: TextStyle(color: LigthColor.massegeColor),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: SliderTheme(
                        data: SliderThemeData(
                          activeTrackColor: LigthColor.maincolor,
                          inactiveTrackColor: Colors.grey,
                          thumbColor: Colors.white,
                          overlayColor: Colors.green.withAlpha(50),
                        ),
                        child: Slider(
                          value: provider.position.inSeconds.toDouble(),

                          max: provider.duration.inSeconds.toDouble(),

                          min: 0.0,
                          onChanged: (value) async {
                            await provider.seekTo(value.toInt());
                          },

                          // inactiveColor: ,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${provider.formatDuration(provider.position)}",
                    // "${_postion.inMinutes}:${_postion.inSeconds > 60 ? 60 : _postion.inSeconds}",
                    style: TextStyle(color: LigthColor.massegeColor),
                  ),
                ),
              ],
            ),
            const SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    provider.toggleShuffle();
                    // _toggleShuffle();
                    // player.stop();
                  },
                  icon: Icon(
                    Icons.shuffle,
                    size: 30,

                    // opticalSize: 30,
                    color: provider.isShuffleEnabled
                        ? LigthColor.maincolor
                        : LigthColor.graycolor,
                  ),
                ),
                IconButton(
                    onPressed: () async {
                      await provider.skipNext();
                      // await _skipNext();
                    },
                    icon: Icon(
                      Icons.skip_next,
                      size: 40,
                      color: LigthColor.maincolor,
                    )),
                // AnimationButton(),
                IconButton(
                  onPressed: () async {
                    await provider.playPause();
                    // playPuse();
                  },
                  icon: provider.isPlaying
                      // isPlaying
                      ? Icon(
                          Icons.pause_rounded,
                          size: 50,
                          // color: Colors.transparent,
                          color: LigthColor.maincolor,
                        )
                      : Icon(
                          Icons.play_arrow_rounded,
                          size: 50,
                          color: LigthColor.maincolor,
                        ),
                ),
                IconButton(
                  onPressed: () async {
                    await provider.skipPrevious();
                  },
                  icon: Icon(
                    Icons.skip_previous,
                    size: 40,
                    color: LigthColor.maincolor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    provider.toggleRepeat();
                  },
                  icon: Icon(
                    Icons.loop,
                    size: 30,
                    color: provider.isLoop
                        ? LigthColor.maincolor
                        : LigthColor.graycolor,
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/network_app.dart';
import '../uitles/colors.dart';

// ignore: must_be_immutable
class AppUrlCustomListView extends StatelessWidget {
  AppUrlCustomListView({
    super.key,
    required this.index,
    required this.networkApp,
  });
  int index;
  NetworkApp networkApp;

  void launchApp(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw "Could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    // final appBarHeight = AppBar().preferredSize.height;
    // final provider = Provider.of<PlayerController>(context, listen: false);
    return GestureDetector(
      onTap: () {
        if (index == 0) {
          Navigator.of(context).pushNamed("/home_screen");
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
          //   return HomeScreen();
          // }));
        } else {
          launchApp(networkApp.url);
        }
      },
      child: Container(
        // height: screenSize.height - appBarHeight - 50.0,
        // width: screenSize.width - 50.0,
        height: 75,
        // width: 50,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: LigthColor.whiteColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              networkApp.coverUrl,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  networkApp.title,
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  networkApp.description,
                  textDirection: TextDirection.rtl,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          SizedBox(width: 20),
          IconButton(
            onPressed: () {
              if (index == 0) {
                Navigator.of(context).pushNamed("/home_screen");
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => HomeScreen()));
                ////////////////////////
                //   Navigator.push(context,
                //     MaterialPageRoute(builder: (_) {
                //   return HomeScreen();
                // }));
                /////////////////////////
                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: (_) {
                //   return HomeScreen();
                // }));
              } else {
                launchApp(networkApp.url);
              }
            },
            icon: FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: LigthColor.maincolor,
            ),
          ),
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/player_controller.dart';
import '../uitles/colors.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PlayerController>(context, listen: false);
    return Drawer(
      surfaceTintColor: LigthColor.whiteColor,
      // backgroundColor: Colors.transparent,
      child: Container(
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(10.0),
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: [
        //       Colors.green.shade800.withOpacity(0.8),
        //       LigthColor.whiteColor,
        //       // Colors.green.shade200.withOpacity(0.8),
        //     ],
        //   ),
        // ),
        decoration: BoxDecoration(
            color: LigthColor.whiteColor,
            borderRadius: BorderRadius.circular(10.0)),
        child: ListView(children: [
          DrawerHeader(
            // decoration: BoxDecoration(
            //   gradient: LinearGradient(
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter,
            //     colors: [
            //       Colors.green.shade800.withOpacity(0.8),
            //       Colors.green.shade200.withOpacity(0.8),
            //     ],
            //   ),
            // ),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  'assets/images/Logo.png',
                  height: 150,
                  width: 150,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: listitemtile(
              provider: provider,
              titel: "الرئيسية",
              isfavoret: false,
              lengthsong: '${provider.playlistsong.length}',
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: listitemtile(
              provider: provider,
              titel: "المفضلة",
              isfavoret: true,
              lengthsong: '${provider.favoretsong.length}',
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: listitemsoontile(
              provider: provider,
              titel: "الاناشيد القديمة+الجديده",
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: listitemsoontile(
              provider: provider,
              titel: "التنزيلات",
            ),
          ),
        ]),
      ),
    );
  }
}

class listitemtile extends StatelessWidget {
  const listitemtile({
    super.key,
    required this.provider,
    required this.titel,
    required this.isfavoret,
    required this.lengthsong,
  });

  final PlayerController provider;
  final String titel;
  final bool isfavoret;
  final String lengthsong;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        provider.openscreen(isfavoret, titel);
        Navigator.pop(context);
      },
      leading: Icon(
        Icons.favorite,
        color: LigthColor.maincolor,
        size: 25,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titel,
            style: TextStyle(
              fontSize: 20,
              color: LigthColor.maincolor,
              fontFamily: "Rubik",
            ),
          ),
          Text(
            lengthsong,
            style: TextStyle(
              fontSize: 18,
              color: LigthColor.maincolor,
              fontFamily: "Rubik",
            ),
          ),
        ],
      ),
    );
  }
}

class listitemsoontile extends StatelessWidget {
  listitemsoontile({
    super.key,
    required this.provider,
    required this.titel,
    // required this.isfavoret,
    // required this.issoon,
  });

  final PlayerController provider;
  final String titel;
  // final bool isfavoret;
  // final bool issoon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        // issoon
        //     ? provider.opensoonscreen(issoon, titel)
        //     : provider.openscreen(isfavoret, titel);
        provider.opensoonscreen(true, titel);
        Navigator.pop(context);
        
      },
      leading: Icon(
        Icons.download,
        color: LigthColor.maincolor,
        size: 25,
      ),
      title: Text(
        titel,
        style: TextStyle(
          fontSize: 20,
          color: LigthColor.maincolor,
          fontFamily: "Rubik",
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/player_controller.dart';
import '../uitles/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
  }) : super(key: key);
  // final String titleappbar = "الرئيسية";

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<PlayerController>(context, listen: false);
    return Consumer<PlayerController>(
      builder: (context, value, child) => AppBar(
        foregroundColor: LigthColor.whiteColor,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          value.titel,
          style: TextStyle(
            color: LigthColor.whiteColor,
            fontSize: 25,
            fontWeight: FontWeight.w500,
            fontFamily: "Rubik",
            // fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.0, left: 8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: LigthColor.whiteColor,
                  borderRadius: BorderRadius.circular(10.0)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  'assets/images/Main_Logo.jpg',
                  // height: 50,
                  width: 55,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

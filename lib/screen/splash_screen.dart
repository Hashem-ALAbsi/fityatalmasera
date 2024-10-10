import 'package:flutter/material.dart';
// import 'package:new_version/new_version.dart';
import 'package:provider/provider.dart';

import '../data/player_controller.dart';
import '../widgets/appurlcustomlistview.dart';
import '../widgets/flutter_toast.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // List<NetworkApp> networkapps = NetworkAppData.networkapps;
  //SingleTickerProviderStateMixin
  Future<void> _inopen() async {
    try {
      await context.read<PlayerController>().CreateFristData();
      await context.read<PlayerController>().CreateFristFavoretData();
      context.read<PlayerController>().wheneOpen();
    } catch (e) {}
    // await SqlHelper.db();
    // networkapps = NetworkAppData.networkapps;

    // setState(() {});
    // context.read<PlayerController>().inopen();
    // await context.read<PlayerController>().initAudioPlayer();
    // context.read<PlayerController>().wheneFinsh();
    // await context.read<PlayerController>().initPlayer();
  }

  // void _checkappversion() async {
  //   try {
  //     final newVersion = NewVersion(
  //       androidId: "com.snapchat.android",
  //       // androidId: "com.example.fityatalmasera",
  //     );
  //     final status = await newVersion.getVersionStatus();
  //     newVersion.showUpdateDialog(
  //       context: context,
  //       versionStatus: status,
  //       dialogTitle: "تحديث جديد",
  //       dialogText: "يمكنك تحديث التطبيق الأن للحصول على الأناشيد الجديده",
  //       dismissButtonText: "تخطي",
  //       dismissAction: () {
  //         Navigator.of(context).pop(false);
  //       },
  //       updateButtonText: "تحديث الأن",
  //     );

  //     print("${status.localVersion}");
  //     print(status.storeVersion);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // void _inclose() async {
  //   // await DialogBuild(context);
  //   // showDialog(context: context, builder: builder)
  //   context.read<PlayerController>().inclose();
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _inopen();
    // _checkappversion();

    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    // Future.delayed(Duration(seconds: 3), () {
    //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
    //     return HomeScreen();
    //   }));
    // });
  }

  // @override
  // void dispose() {
  //   _inclose();
  //   super.dispose();
  // }

  Future<bool> _onWillPop() {
    return ShowMasseg.onWillPop(
        context, 'هل أنت متأكد؟', 'هل تريد الخروج من التطبيق؟');
    // bool r = await

    // if (!r) {
    //   // return exit(0);
    //   return r;
    // } else {
    //   exit(0);
    //   // return r;
    // }
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   // _inopen();
  //   super.dispose();
  //   // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //   //     overlays: SystemUiOverlay.values);
  // }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final appBarHeight = AppBar().preferredSize.height;
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Consumer<PlayerController>(
        builder: (context, value, child) => Container(
          height: screenSize.height - appBarHeight - 10.0,
          width: screenSize.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.green.shade800.withOpacity(0.8),
                Colors.green.shade200.withOpacity(0.8),
                // Colors.deepPurple.shade800.withOpacity(0.8),
                // Colors.deepPurple.shade200.withOpacity(0.8),
              ],
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image(
                              image: AssetImage('assets/images/Logo2.png'),
                              height: 320,
                              // height: screenSize.height - appBarHeight - 440.0,
                              // width: 320,
                              fit: BoxFit.fill),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(top: 10),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: value.networkapp.length,
                          itemBuilder: ((context, index) =>
                              AppUrlCustomListView(
                                index: index,
                                networkApp: value.networkapp[index],
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // ),
        ),
      ),
    );
  }
}




// class ContintsW extends StatelessWidget {
//   // final Widget child;
//   final String titel;
//   final String description;

//   const ContintsW({
//     super.key,
//     // required this.child,
//     required this.titel,
//     required this.description,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         // await provider.playSelectedSong(index);
//       },
//       child: Container(
//         height: 75,
//         margin: const EdgeInsets.only(bottom: 10),
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         decoration: BoxDecoration(
//           color: LigthColor.whiteColor,
//           borderRadius: BorderRadius.circular(15.0),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(10.0),
//               child: Image.asset(
//                 'assets/images/Logo1.png',
//                 height: 50,
//                 width: 50,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             SizedBox(width: 20),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     titel,
//                     textDirection: TextDirection.rtl,
//                     style: Theme.of(context)
//                         .textTheme
//                         .bodyLarge!
//                         .copyWith(fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     description,
//                     textDirection: TextDirection.rtl,
//                     maxLines: 2,
//                     style: Theme.of(context).textTheme.bodySmall,
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(width: 20),
//             IconButton(
//               onPressed: () async {
//                 // if (!provider.isFavoritesMode) {
//                 //   await provider.addFavoretSongOrdelet(playlist);
//                 // setState(() {});
//                 // }
//               },
//               icon: FaIcon(
//                 FontAwesomeIcons.archway,
//                 // size: 22,

//                 color: LigthColor.maincolor,
//                 //color: LigthColor.maingreencolor,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

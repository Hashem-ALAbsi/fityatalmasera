import 'package:flutter/material.dart';
import 'package:fityatalmasera/screen/songmain_screen.dart';

import '../widgets/customappbar.dart';
import '../widgets/customdrawer.dart';
import '../widgets/flutter_toast.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<bool> _onWillPop() async {
    return ShowMasseg.onWillPop(
        context, 'هل أنت متأكد؟', 'هل تريد الرجوع الى الصفحة الرئيسية؟');
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.green.shade800.withOpacity(0.8),
              Colors.green.shade200.withOpacity(0.8),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CustomAppBar(),
          drawer: CustomDrawer(),
          body: SongmainScreen(),
        ),
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:fityatalmasera/data/allsongapi_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:fityatalmasera/screen/splash_screen.dart';

import 'data/player_controller.dart';
import 'firebase_options.dart';
import 'screen/home.dart';
import 'widgets/flutter_toast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => PlayerController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  bool isAppInBackground = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _getAppVersion();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.paused:
        isAppInBackground = true;
        _handleAppInBackground();
        break;
      case AppLifecycleState.resumed:
        isAppInBackground = false;
        _handleAppInForeground();
        break;
      default:
        break;
    }
  }

  void _handleAppInBackground() {
    // قم بتنفيذ أي إجراءات تحتاجها عندما يكون التطبيق في الخلفية
    context.read<PlayerController>().playPauseBackgraoung();
    print('التطبيق في الخلفية');
  }

  void _handleAppInForeground() {
    // قم بتنفيذ أي إجراءات تحتاجها عندما يكون التطبيق في المقدمة
    print('التطبيق في المقدمة');
  }

  String _appVersion = '1.0.0';

  Future<void> _getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _appVersion = packageInfo.version;
    });
    await _checkappversion(_appVersion);
  }

  Future<void> _checkappversion(String version) async {
    try {
      final check = await AllSongs_Api.getappversion(version);
      if (!check) {
      } else {
        if (check['IsAuthenticated']) {
          bool r = await ShowMasseg.onDownlodfile(
              context, '${check['submassage']}', ' ${check['massage']}؟');
        }
      }
    } catch (e) {}
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   // TODO: implement didChangeAppLifecycleState
  //   super.didChangeAppLifecycleState(state);
  //   _isAppInBackground = state == AppLifecycleState.paused;
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        // Locale('en'), // English
        Locale('ar', 'AE'), // Spanish
      ],
      debugShowCheckedModeBanner: false,
      title: 'فتية المسيرة',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 22, 160, 27)),
        useMaterial3: true,
      ),
      // home: SplashScreen(),
      initialRoute: "/splash_screen",
      routes: {
        "/home_screen": ((context) => HomeScreen()),
        "/splash_screen": ((context) => SplashScreen()),
      },
    );
  }
}

import 'package:chatgpt/consts/consts.dart';
import 'package:chatgpt/screen/splash_screen/splash_screen.dart';
import 'consts/export.dart';
import 'consts/pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // hive initialize
  Pref.initialize();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          shadowColor: Colors.blue,
          elevation: 1,
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.blue),
            titleTextStyle: TextStyle(
              color: Colors.blue.shade700,fontWeight: FontWeight.w500,fontSize: 18
            )
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

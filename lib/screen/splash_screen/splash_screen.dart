import 'package:chatgpt/screen/home_page.dart';
import 'package:chatgpt/screen/one_time_screens/onboard_screen.dart';
import 'package:chatgpt/screen/widgets/loading_screens.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../../consts/export.dart';
import '../../consts/pref.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.offAll(
          () => Pref.onboardEnd ? const HomePage() : const OnboardScreen(),
          transition: Transition.leftToRight);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/logo.png",
              scale: 4,
              color: Colors.blue,
            ),
            10.heightBox,
            const LoadingScreens(),
            20.heightBox,
            const Text(
              'Welcome to AiP!',
              style: TextStyle(
                fontSize: 24,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

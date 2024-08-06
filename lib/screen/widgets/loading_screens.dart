import 'package:chatgpt/consts/export.dart';

class LoadingScreens extends StatelessWidget {
  const LoadingScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset('assets/lottie_file/ailoading.json',width: 100);
  }
}

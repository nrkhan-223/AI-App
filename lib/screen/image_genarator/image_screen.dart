import 'package:chatgpt/consts/export.dart';

class ImageGeneratorScreen extends StatefulWidget {
  const ImageGeneratorScreen({super.key});

  @override
  State<ImageGeneratorScreen> createState() => _ImageGeneratorScreenState();
}

class _ImageGeneratorScreenState extends State<ImageGeneratorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: "image".text.makeCentered(),
    );
  }
}

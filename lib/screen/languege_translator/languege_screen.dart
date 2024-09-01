import 'package:chatgpt/consts/export.dart';
import 'package:chatgpt/screen/widgets/loading_screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../controllers/translate_controller.dart';
import '../widgets/bottomsheet_laguege.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  var controller = Get.put(TranslateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: "TRANSLATOR".text.make(),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.normal),
          padding: EdgeInsets.only(
              top: context.screenHeight * 0.03,
              bottom: context.screenHeight * 0.05,
              left: context.screenWidth * 0.04,
              right: context.screenWidth * 0.04),
          child: Column(
            children: [
              Obx(
                () => Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      width: context.screenWidth * 0.32,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.blue)),
                      child: controller.from.isEmpty
                          ? "From".text.blue700.makeCentered()
                          : controller.from.value.text.makeCentered(),
                    ).onTap(() {
                      Get.bottomSheet(
                          LanguageSheet(c: controller, s: controller.from));
                    }),
                    IconButton(
                        onPressed: () {
                          controller.swapLanguages();
                        },
                        icon: Icon(
                          CupertinoIcons.repeat,
                          color: controller.to.isNotEmpty &&
                                  controller.from.isNotEmpty
                              ? Colors.blue
                              : Colors.grey,
                        )),
                    Container(
                      height: 50,
                      width: context.screenWidth * 0.32,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.blue)),
                      child: controller.to.isEmpty
                          ? "To".text.makeCentered()
                          : controller.to.value.text.makeCentered(),
                    ).onTap(() {
                      Get.bottomSheet(
                          LanguageSheet(c: controller, s: controller.to));
                    }),
                  ],
                ),
              ),
              20.heightBox,
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.2,
                    color: Colors.orange.shade500,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(15.0) //
                      ),
                ),
                child: Column(
                  children: [
                    TextField(
                      maxLines: 5,
                      controller: controller.textC,
                      onTapOutside: (e) => FocusScope.of(context).unfocus(),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        hintText: 'Enter your Text...',
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          IconButton(onPressed: (){}, icon: const Icon(Icons.mic_none_outlined)),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.volume_up_rounded)),
                          const Spacer(),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.copy_all)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              20.heightBox,
              Obx(()=> _translateResult()),
              30.heightBox,
              ElevatedButton(
                  onPressed: controller.googleTranslate,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade400),
                  child: "TRANSLATE".text.white.make())
            ],
          ),
        ));
  }

  Widget _translateResult() => switch (controller.status.value) {
        Status.none => const SizedBox(),
        Status.complete => Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(width: 1.2, color: Colors.blue),
              borderRadius: const BorderRadius.all(Radius.circular(15.0) //
                  ),
            ),
            child: Column(
              children: [
                TextFormField(
                  readOnly: true,
                  controller: controller.resultC,
                  maxLines: 5,
                  onTapOutside: (e) => FocusScope.of(context).unfocus(),
                  decoration: const InputDecoration(
                    border: InputBorder.none
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      IconButton(onPressed: (){}, icon: const Icon(Icons.volume_up_rounded)),
                      const Spacer(),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.copy_all)),
                    ],
                  ),
                )
              ],
            ),
          ),
        Status.loading => const Align(child: LoadingScreens())
      };
}

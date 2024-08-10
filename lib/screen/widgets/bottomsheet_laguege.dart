import 'dart:developer';

import 'package:chatgpt/consts/export.dart';
import 'package:get/get.dart';

import '../../controllers/translate_controller.dart';

class LanguageSheet extends StatefulWidget {
  final TranslateController c;
  final RxString s;

  const LanguageSheet({super.key, required this.c, required this.s});

  @override
  State<LanguageSheet> createState() => _LanguageSheetState();
}

class _LanguageSheetState extends State<LanguageSheet> {
  final _search = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * .5,
      padding: EdgeInsets.only(
          left: context.screenWidth * .04,
          right: context.screenWidth * .04,
          top: context.screenHeight * .02),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Column(
        children: [
          TextFormField(
            onChanged: (s) => _search.value = s.toLowerCase(),

            onTapOutside: (e) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
              isDense: true,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.orange.shade500, width: 1.2),
                  borderRadius: BorderRadius.circular(
                    12.0,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderSide:  BorderSide(
                    width: 1.2,
                    color: Colors.orange.shade500,
                  ),
                  borderRadius: BorderRadius.circular(
                    12.0,
                  )),
              prefixIcon: const Icon(Icons.translate_rounded, color: Colors.blue),
              hintText: 'Search Language...',
              hintStyle: const TextStyle(fontSize: 14),
            ),
          ),

          //
          Expanded(
            child: Obx(
              () {
                final List<String> list = _search.isEmpty
                    ? widget.c.lang
                    : widget.c.lang
                        .where((e) => e.toLowerCase().contains(_search.value))
                        .toList();

                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: list.length,
                  padding:
                      EdgeInsets.only(top: context.screenHeight * .02, left: 10),
                  itemBuilder: (ctx, i) {
                    return InkWell(
                      onTap: () {
                        widget.s.value = list[i];
                        log(list[i]);
                        Get.back();
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.only(bottom: context.screenHeight * .02),
                        child: Text(list[i]),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:translate_app/models/translate_model.dart';
import 'package:translate_app/themes/colors.dart';
import 'package:translate_app/widgets/lang_selector.dart';

class LangControll extends StatelessWidget {
  final TranslateModel translate;
  final VoidCallback onSwap;
  final Function(String, String) onLangSelect;

  const LangControll(
      {super.key,
      required this.translate,
      required this.onSwap,
      required this.onLangSelect});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      color: MyColors.tertiary,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Row(children: [
          Expanded(
            flex: 1,
            child: LangSelector(
                value: translate.from,
                setValue: (value) {
                  onLangSelect("from", value ?? "");
                }),
          ),
          IconButton(
            icon: const Iconify(Ic.round_swap_horiz),
            onPressed: onSwap,
          ),
          Expanded(
            flex: 1,
            child: LangSelector(
                value: translate.to,
                setValue: (value) {
                  onLangSelect("to", value ?? "");
                }),
          ),
        ]),
      ),
    );
  }
}

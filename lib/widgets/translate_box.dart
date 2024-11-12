import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:translate_app/themes/colors.dart';
import 'package:translate_app/widgets/voice_input.dart';
import 'package:translate_app/widgets/my_card.dart';

class TranslateBox extends StatelessWidget {
  final String title;
  final TextEditingController textFieldController;
  final VoidCallback onClear;
  final ValueChanged<String> onInputChange;
  final VoidCallback onSubmit;

  const TranslateBox({
    super.key,
    required this.title,
    required this.onClear,
    required this.textFieldController,
    required this.onInputChange,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return MyCard(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  title,
                  style: TextStyle(
                      color: MyColors.primary,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
              ),
              IconButton(
                  onPressed: onClear, icon: const Iconify(Ic.round_close))
            ],
          ),
          TextField(
            maxLines: 4,
            decoration: const InputDecoration(
              hintText: "Enter text here...",
              border: InputBorder.none,
            ),
            onChanged: onInputChange,
            controller: textFieldController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              VoiceInput(
                setResult: onInputChange,
              ),
              TextButton(
                  onPressed: onSubmit,
                  style: TextButton.styleFrom(
                    backgroundColor: MyColors.secondary,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 10),
                  ),
                  child: const Text(
                    "Translate",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ))
            ],
          )
        ],
      ),
    );
  }
}

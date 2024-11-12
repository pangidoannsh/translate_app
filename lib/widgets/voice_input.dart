import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/eva.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:translate_app/themes/colors.dart';

class VoiceInput extends StatefulWidget {
  final ValueChanged<String> setResult;

  const VoiceInput({super.key, required this.setResult});

  @override
  State<VoiceInput> createState() => _VoiceInputState();
}

class _VoiceInputState extends State<VoiceInput> {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;

  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  void initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    widget.setResult("Listening...");
    await _speechToText.listen(
      onResult: (result) {
        widget.setResult(result.recognizedWords);
      },
      localeId: "id-ID",
    );
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        style: TextButton.styleFrom(backgroundColor: MyColors.primary),
        onPressed: _speechToText.isListening ? _stopListening : _startListening,
        icon: Iconify(
          _speechToText.isListening ? Eva.mic_off_fill : Eva.mic_fill,
          color: Colors.white,
        ),
        color: MyColors.primary);
  }
}

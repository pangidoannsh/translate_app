import 'package:flutter/material.dart';
import 'package:translate_app/models/translate_model.dart';
import 'package:translate_app/services/api_service.dart';
import 'package:translate_app/widgets/lang_controll.dart';
import 'package:translate_app/themes/colors.dart';
import 'package:translate_app/widgets/output_box.dart';
import 'package:translate_app/widgets/translate_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _controller;
  TranslateModel _translate = TranslateModel("Indonesia", "Wolio");
  final ApiService _apiService = ApiService();
  String _output = "";

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void swapLanguage() {
    setState(() {
      _translate = TranslateModel(_translate.to, _translate.from);
    });
  }

  void _handleSelectLanguage(String fromOrTo, String value) {
    final isFrom = fromOrTo == "from";
    final currentValue = isFrom ? _translate.to : _translate.from;

    if (value == currentValue) {
      swapLanguage();
    } else {
      setState(() {
        _translate = isFrom
            ? TranslateModel(value, _translate.to)
            : TranslateModel(_translate.from, value);
      });
    }
  }

  void _handleClearInput() {
    setState(() {
      _output = "";
      _controller.text = "";
    });
  }

  void _handleInput(String text) {
    setState(() {
      _controller.text = text;
    });
  }

  Future<void> submitTranslate() async {
    try {
      if (_controller.text.isEmpty) {
        return;
      }
      final result =
          await _apiService.fetchTranslate(_translate, _controller.text);
      setState(() {
        _output = result.to;
      });
    } catch (error) {
      setState(() {
        _output = error.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Kamus Buton",
          style: TextStyle(
              fontFamily: "Poppins",
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: MyColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          LangControll(
            translate: _translate,
            onSwap: swapLanguage,
            onLangSelect: _handleSelectLanguage,
          ),
          TranslateBox(
            title: _translate.from,
            onClear: _handleClearInput,
            onInputChange: _handleInput,
            textFieldController: _controller,
            onSubmit: submitTranslate,
          ),
          OutputBox(
            title: _translate.to,
            text: _output,
          )
        ]),
      ),
    );
  }
}

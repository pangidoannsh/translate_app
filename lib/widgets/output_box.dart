import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:translate_app/themes/colors.dart';
import 'package:translate_app/widgets/my_card.dart';

class OutputBox extends StatelessWidget {
  final String title;
  final String text;

  const OutputBox({super.key, required this.title, required this.text});

  void onCopy() {}

  void onFavorite() {}

  @override
  Widget build(BuildContext context) {
    return MyCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: MyColors.primary,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          Text(text),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: onCopy,
                icon:
                    const Iconify(MaterialSymbols.content_copy_outline_rounded),
              ),
              IconButton(
                onPressed: onFavorite,
                icon: const Iconify(Ic.round_star_border),
              ),
            ],
          )
        ],
      ),
    );
  }
}

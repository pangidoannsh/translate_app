import 'package:flutter/material.dart';
import 'package:translate_app/themes/colors.dart';

class MyCard extends StatelessWidget {
  final Widget? child;
  const MyCard({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      color: MyColors.tertiary,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 12, 8),
        child: child,
      ),
    );
  }
}

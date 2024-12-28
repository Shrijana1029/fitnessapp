import 'package:flutter/material.dart';
import 'package:fitnessapp/screens/activity/color.dart';

class SettingRow extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onPressed;
  const SettingRow(
      {super.key,
      required this.icon,
      required this.title,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(icon, height: 25, width: 25, fit: BoxFit.contain),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: TColor.black,
                  fontSize: 15,
                ),
              ),
            ),
            Image.asset("assets/img1/img/p_next.png",
                height: 16, width: 16, fit: BoxFit.contain)
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitterchallenge/constants/gaps.dart';
import 'package:twitterchallenge/constants/sizes.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final FaIcon icon;

  const AuthButton({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        padding: const EdgeInsets.all(Sizes.size14),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
            width: Sizes.size2,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: icon,
            ),
            Gaps.h10,
            Text(
              text,
              style: const TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

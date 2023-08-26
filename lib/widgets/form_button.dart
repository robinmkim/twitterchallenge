import 'package:flutter/material.dart';
import 'package:twitterchallenge/constants/sizes.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.disabled,
  });

  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: Sizes.size72,
      padding: const EdgeInsets.symmetric(vertical: Sizes.size10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size10 + Sizes.size40),
        color: disabled ? Colors.grey.shade300 : Theme.of(context).primaryColor,
      ),
      duration: const Duration(milliseconds: 300),
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 300),
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: disabled ? Colors.grey.shade400 : Colors.white,
        ),
        child: const Text(
          'Next',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

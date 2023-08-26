import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitterchallenge/constants/gaps.dart';
import 'package:twitterchallenge/constants/sizes.dart';

class CustomizeScreen extends StatefulWidget {
  const CustomizeScreen({super.key});

  @override
  State<CustomizeScreen> createState() => _CustomizeScreenState();
}

class _CustomizeScreenState extends State<CustomizeScreen> {
  bool _isAccepted = false;

  void onNextTap() {
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FaIcon(
          FontAwesomeIcons.twitter,
          size: Sizes.size40,
          color: Theme.of(context).primaryColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size40,
        ),
        child: Column(
          children: [
            Gaps.v96,
            const Text(
              "Customize your experience",
              style: TextStyle(
                fontSize: Sizes.size28,
                fontWeight: FontWeight.w900,
              ),
            ),
            Gaps.v44,
            const Text(
              "Track where you see Twitter content across the web",
              style: TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w900,
              ),
            ),
            Gaps.v20,
            Row(
              children: [
                const Expanded(
                  child: Text(
                    "Twitter uses this data to personalize your experience. This web brwosing history will never be stored with your name, email, or phone number.",
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.visible,
                  ),
                ),
                CupertinoSwitch(
                  value: _isAccepted,
                  onChanged: (bool newValue) {
                    setState(() {
                      _isAccepted = newValue;
                    });
                  },
                ),
              ],
            ),
            Gaps.v20,
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  const TextSpan(
                    text: 'By signing up, you agree to our ',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: "Terms",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const TextSpan(
                    text: ', ',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: "Privacy Policy",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const TextSpan(
                    text: ', and ',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: "Cookie Use",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const TextSpan(
                    text:
                        '. Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy. ',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: "Learn more",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Gaps.v96,
            Gaps.v96,
            Gaps.v80,
            GestureDetector(
              onTap: onNextTap,
              child: AnimatedContainer(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.symmetric(vertical: Sizes.size10),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Sizes.size10 + Sizes.size40),
                  color: !_isAccepted
                      ? Colors.grey.shade300
                      : Theme.of(context).primaryColor,
                ),
                duration: const Duration(milliseconds: 300),
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 300),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: !_isAccepted ? Colors.grey.shade400 : Colors.white,
                  ),
                  child: const Text(
                    'Next',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

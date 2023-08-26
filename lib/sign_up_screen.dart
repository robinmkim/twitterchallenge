import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitterchallenge/create_account_screen.dart';
import 'package:twitterchallenge/widgets/auth_button.dart';

import 'constants/gaps.dart';
import 'constants/sizes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
/*
  void onLoginTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    ));
  }
*/
  void onCreateTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const CreateAccountScreen(),
    ));
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size40,
          ),
          child: Column(
            children: [
              Gaps.v96,
              Gaps.v96,
              const Text(
                "See what's happening in the world right now.",
                style: TextStyle(
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Gaps.v96,
              Gaps.v40,
              GestureDetector(
                onTap: () {},
                child: const AuthButton(
                  icon: FaIcon(FontAwesomeIcons.google),
                  text: "Continue with Google",
                ),
              ),
              Gaps.v16,
              const AuthButton(
                icon: FaIcon(FontAwesomeIcons.apple),
                text: "Continue with Apple",
              ),
              Gaps.v10,
              Row(
                children: const [
                  Expanded(
                    child: Divider(
                      color: Colors.black45,
                      thickness: Sizes.size1,
                    ),
                  ),
                  Gaps.h5,
                  Text(
                    "or",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black45),
                  ),
                  Gaps.h5,
                  Expanded(
                    child: Divider(
                      color: Colors.black45,
                      thickness: Sizes.size1,
                    ),
                  ),
                ],
              ),
              Gaps.v16,
              GestureDetector(
                onTap: () => onCreateTap(context),
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: Container(
                    padding: const EdgeInsets.all(Sizes.size14),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Gaps.h10,
                        Text(
                          "Create Account",
                          style: TextStyle(
                            fontSize: Sizes.size16,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
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
                      text: '.',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 2,
        color: Colors.grey.shade200,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size32,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already have an accout?",
              ),
              Gaps.h5,
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Log in',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

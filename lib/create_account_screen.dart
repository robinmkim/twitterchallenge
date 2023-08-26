import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitterchallenge/constants/gaps.dart';
import 'package:twitterchallenge/constants/sizes.dart';
import 'package:twitterchallenge/customize_screen.dart';
import 'package:twitterchallenge/widgets/form_button.dart';
import 'package:flutter/cupertino.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({
    super.key,
  });

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();

  String _username = '';
  String _email = '';
  DateTime initialDate = DateTime.now();
  bool isDateSelected = false;
  bool _isDone = false;

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(() {
      setState(() {
        _username = _usernameController.text;
      });
    });
    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void onNextTap() async {
    final isDone = await Navigator.of(context).push(MaterialPageRoute<bool>(
      builder: (context) => const CustomizeScreen(),
    ));
    if (isDone == true) {
      setState(() {
        _isDone = true;
      });
    }
  }

  bool _isUsernameValid() {
    if (_username.length > 2) {
      return true;
    }
    return false;
  }

  bool _isEmailValid() {
    final regex = RegExp(r'^(?:\d{11}|[\w\.-]+@[\w\.-]+\.\w+)$');
    return regex.hasMatch(_email);
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
    setState(() {
      isDateSelected = true;
    });
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _showDatePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: const Text('Select a Date'),
          actions: <Widget>[
            SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: _setTextFieldDate,
              ),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text('Done'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Padding(
                padding: EdgeInsets.only(left: Sizes.size2),
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          title: FaIcon(
            FontAwesomeIcons.twitter,
            size: Sizes.size40,
            color: Theme.of(context).primaryColor,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              const Text(
                "Create your account",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v40,
              TextField(
                controller: _usernameController,
                autocorrect: false,
                decoration: InputDecoration(
                  suffix: FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: Sizes.size20,
                    color: _isUsernameValid()
                        ? Colors.green
                        : Colors.grey.shade400,
                  ),
                  hintText: "Username",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v20,
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: InputDecoration(
                  suffix: FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: Sizes.size20,
                    color:
                        _isEmailValid() ? Colors.green : Colors.grey.shade400,
                  ),
                  hintText: "Phone number or email address",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v20,
              GestureDetector(
                onTap: () => _showDatePicker(context),
                child: TextField(
                  enabled: false,
                  controller: _birthdayController,
                  decoration: InputDecoration(
                    suffix: FaIcon(
                      FontAwesomeIcons.circleCheck,
                      size: Sizes.size20,
                      color:
                          isDateSelected ? Colors.green : Colors.grey.shade400,
                    ),
                    hintText: "Date of birth",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                ),
              ),
              Gaps.v96,
              Gaps.v96,
              Gaps.v96,
              Container(
                child: _isDone
                    ? RichText(
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
                            const TextSpan(
                              text:
                                  '. Others will be able to find you by email or phone number, when provided unless you choose otherwise ',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: Sizes.size16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: "here",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: Sizes.size16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const TextSpan(
                              text: '. ',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: Sizes.size16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      )
                    : const Text(""),
              ),
              Expanded(
                child: _isDone
                    ? GestureDetector(
                        onTap: onNextTap,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          child: AnimatedContainer(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                vertical: Sizes.size10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  Sizes.size10 + Sizes.size40),
                              color: Theme.of(context).primaryColor,
                            ),
                            duration: const Duration(milliseconds: 300),
                            child: const AnimatedDefaultTextStyle(
                              duration: Duration(milliseconds: 300),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                              child: Text(
                                'Next',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: onNextTap,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              bottom: 20,
                            ),
                            child: FormButton(
                                disabled: !_isEmailValid() ||
                                    !_isUsernameValid() ||
                                    !isDateSelected),
                          ),
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

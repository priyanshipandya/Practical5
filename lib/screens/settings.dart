import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practical5/constants/string_constant.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool selValue = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${StringConstants.settings}",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${StringConstants.notification}", style: TextStyle(fontSize: 20)),
                      CupertinoSwitch(
                        value: selValue,
                        onChanged: (value) {
                          setState(() {
                            selValue = value;
                          });
                        },
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${StringConstants.aboutTheApp}", style: TextStyle(fontSize: 20)),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: TextButton(onPressed: () {}, child: Text(
                      "${StringConstants.login}",
                      style: TextStyle(fontSize: 17, color: Colors.black87),
                    ),),
                  ),
                  Divider(),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: TextButton(onPressed: () {}, child: Text(
                      "${StringConstants.signUp}",
                      style: TextStyle(fontSize: 17, color: Colors.black87),
                    ),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

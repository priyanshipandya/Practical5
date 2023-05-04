import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool selValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings",
            style: TextStyle(fontSize: 30, color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Notifications", style: TextStyle(fontSize: 20)),
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
                    Text("About the app", style: TextStyle(fontSize: 20)),
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
                TextButton(onPressed: () {}, child: Text(
                  "Login",
                  style: TextStyle(fontSize: 17, color: Colors.black87),
                ),),
                Divider(),
                TextButton(onPressed: () {}, child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 17, color: Colors.black87),
                ),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

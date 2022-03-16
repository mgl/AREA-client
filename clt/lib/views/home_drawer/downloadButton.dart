import 'dart:async';
import 'package:flutter/material.dart';
import 'package:clt/controller/subscribe_controller.dart';
import 'package:clt/views/home/home.dart';
import 'package:url_launcher/url_launcher.dart';

class ApkButton extends StatefulWidget {
  const ApkButton({Key? key, required this.god}) : super(key: key);
  final God god;
  @override
  State<ApkButton> createState() => _ApkButtonState();
}

class _ApkButtonState extends State<ApkButton> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        const Duration(seconds: 3), (Timer t) => setState(() {}));
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void downloadApk() async {
    const String url = 'https://area-37a17.web.app/client.apk';
    await launch(url);
  }

  void onClickDiscordLoginButton(BuildContext context) {
    AlertDialog dialog = AlertDialog(
        title: const Text('Download', style: TextStyle(color: Colors.black)),
        content: const Text('Click on this button to download the APK',
            style: TextStyle(color: Colors.black)),
        actions: [
          Row(children: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple)),
                child: const Text("APK"),
                onPressed: () {
                  downloadApk();
                  Navigator.of(context).pop('OK');
                })
          ], mainAxisAlignment: MainAxisAlignment.end)
        ]);
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < widget.god.globalContainer.service.length; i++) {
      if (widget.god.globalContainer.service[i].name == "discord") {
        widget.god.connectedToDiscord = true;
      }
    }
    return TextButton(
        onPressed: () {
          onClickDiscordLoginButton(context);
        },
        style: TextButton.styleFrom(
            backgroundColor: Colors.grey[200],
            primary: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        child: Row(children: [
          Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/logout.png'), fit: BoxFit.cover),
                shape: BoxShape.circle),
          ),
          const SizedBox(width: 20),
          const Text('Download APK', style: TextStyle(color: Colors.black))
        ]));
  }
}

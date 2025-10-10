import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Mylauncher extends StatefulWidget {
  const Mylauncher({super.key});

  @override
  State<Mylauncher> createState() => _MylauncherState();
}

class _MylauncherState extends State<Mylauncher> {
  callphone(num phone) async {
    // Uri url = Uri.parse('tel:$phone');
    Uri url = Uri(scheme: 'tel', path: "$phone");

    if (await canLaunchUrl(url)) {
      launchUrl(url);
    } else {
      throw "Could not launch phone call";
    }
  }

  weblaunch(String link) async {
    Uri url = Uri.parse(link);

    if (await canLaunchUrl(url)) {
      launchUrl(url);
    } else {
      throw "Could not launch $link";
    }
  }

  smslaunch({required String phone, required String msg}) async {
    Uri url = Uri(
      scheme: 'sms',
      path: phone,
      query: msg != null ? 'body=$msg' : null,
    );

    if (await canLaunchUrl(url)) {
      launchUrl(url);
    } else {
      throw "Could not launch sms";
    }
  }

  emaillaunch({
    required String toaddress,
    required String body,
    required String subject,
  }) async {
    Uri url = Uri(
      scheme: 'mailto',
      path: toaddress,
      query: 'subject=$subject&body=$body',
    );

    if (await canLaunchUrl(url)) {
      launchUrl(url);
    } else {
      throw "Could not launch email";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50),
          ListTile(
            leading: CircleAvatar(),
            title: Text("Fays Aruka"),
            subtitle: Text("9605174832"),
            trailing: IconButton(
              onPressed: () {
                callphone(9605174832);
              },
              icon: Icon(Icons.call),
            ),
          ),
          ListTile(
            leading: CircleAvatar(),
            title: Text("Luminar"),
            trailing: IconButton(
              onPressed: () {
                weblaunch("https://pub.dev/packages/url_launcher");
              },
              icon: Icon(Icons.arrow_circle_right_outlined),
            ),
          ),
          ListTile(
            leading: CircleAvatar(),
            title: Text("SMS"),
            trailing: IconButton(
              onPressed: () {
                smslaunch(phone: "9605174832", msg: "Hello");
              },
              icon: Icon(Icons.arrow_circle_right_outlined),
            ),
          ),
          ListTile(
            leading: CircleAvatar(),
            title: Text("email"),
            trailing: IconButton(
              onPressed: () {
                emaillaunch(
                  toaddress: 'faysaruka@gmail.com',
                  body: 'hi respected,sir ,....',
                  subject: 'regarding..',
                );
              },
              icon: Icon(Icons.arrow_circle_right_outlined),
            ),
          ),
        ],
      ),
    );
  }
}

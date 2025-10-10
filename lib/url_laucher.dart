import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Mylauncher extends StatefulWidget {
  const Mylauncher({super.key});

  @override
  State<Mylauncher> createState() => _MylauncherState();
}

class _MylauncherState extends State<Mylauncher> {
  Future<void> callphone(num phone) async {
    Uri url = Uri(scheme: 'tel', path: '$phone');
    if (await canLaunchUrl(url)) {
      launchUrl(url);
    } else {
      throw "Could not lauch phone call";
    }
  }

  Future<void> weblaunch(String urll) async {
    Uri url = Uri.parse(urll);
    if (await canLaunchUrl(url)) {
      launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw "Could not lauch $urll";
    }
  }

  Future<void> sendsms({required String phone, required String msg}) async {
    final Uri url = Uri(scheme: 'sms', path: phone, query: 'body=$msg');
    if (await canLaunchUrl(url)) {
      launchUrl(url);
    } else {
      throw "Could not lauch sms";
    }
  }

  Future<void> sendemail({
    required String toaddress,
    required String body,
    required String subject,
  }) async {
    final Uri url = Uri(
      scheme: 'mailto',
      path: toaddress,
      query: 'subject=$subject&body=$body',
    );
    if (await canLaunchUrl(url)) {
      launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw "Could not lauch email";
    }
  }

  Future<void> sendwhatsapp(String no, String msg) async {
    Uri url = Uri.parse("https://wa.me/$no?text=$msg");
    if (await canLaunchUrl(url)) {
      launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw "Could not lauch whatsapp";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: CircleAvatar(),
            title: Text("Sreejith"),
            subtitle: Text("8943134357"),
            trailing: IconButton(
              onPressed: () {
                callphone(8943134357);
              },
              icon: Icon(Icons.call),
            ),
          ),
          ListTile(
            leading: CircleAvatar(),
            title: Text("https://maps.app.goo.gl/E66iCEiEmENrHAjA7"),
            trailing: IconButton(
              onPressed: () {
                weblaunch(
                  "https://www.google.com/maps?q=10.0276941,76.3074054",
                );
              },
              icon: Icon(Icons.arrow_circle_right_outlined),
            ),
          ),
          ListTile(
            leading: CircleAvatar(),
            title: Text("9987654320"),
            subtitle: Text("hai"),
            trailing: IconButton(
              onPressed: () {
                sendsms(phone: "9987654320", msg: "hai");
              },
              icon: Icon(Icons.send),
            ),
          ),
          ListTile(
            leading: CircleAvatar(),
            title: Text("hr@luminartechnolab.com"),
            subtitle: Text("hai"),
            trailing: IconButton(
              onPressed: () {
                sendemail(
                  toaddress: 'hr@luminartechnolab.com',
                  body: 'haii',
                  subject: 'testing',
                );
              },
              icon: Icon(Icons.send),
            ),
          ),
          ListTile(
            leading: CircleAvatar(),
            title: Text("9876543200"),
            subtitle: Text("hai"),
            trailing: IconButton(
              onPressed: () {
                sendwhatsapp("8111821148", "hai");
              },
              icon: Icon(Icons.send),
            ),
          ),
        ],
      ),
    );
  }
}

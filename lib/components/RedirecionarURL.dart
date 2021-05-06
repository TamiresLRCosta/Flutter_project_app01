import 'package:url_launcher/url_launcher.dart';

dynamic redirecionarURL() async {
  const url = "https://google.com";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

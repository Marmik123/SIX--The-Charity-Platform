import 'package:url_launcher/url_launcher.dart';

Future<void> sendMail(String? mailId) async {
  if (mailId != null) {
    final params = Uri(
      scheme: 'mailto',
      path: mailId,
    );
    var url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }
}

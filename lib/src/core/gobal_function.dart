import 'package:url_launcher/url_launcher.dart';

Future<void> hotlineSupport(String phobeNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phobeNumber,
  );
  await urlLauncher(
    launchUri.toString(),
  );
}

// Email Support
Future<void> emailSupport(String email) async {
  final Uri launchUri = Uri(
    scheme: 'mailto',
    path: email,
  );
  await urlLauncher(
    launchUri.toString(),
  );
}

Future<void> urlLauncher(String link) async {
  final Uri uriLink = Uri.parse(link);
  if (await canLaunchUrl(uriLink)) {
    await launchUrl(
      uriLink,
      mode: LaunchMode.externalApplication,
    );
  }
}

import 'dart:developer';

import 'package:bookly_app/core/utils/functions/custom_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> customLauchUrl(context, String? url) async {
  if (url != null) {
    Uri toLaunchUrl = Uri.parse(url);

    if (await canLaunchUrl(toLaunchUrl)) {
      await launchUrl(toLaunchUrl);
    } else {
      customSnckBar(context, "Cannot launch $url");
    }
  } else {
    log("Cannot launch Null url");
  }
}

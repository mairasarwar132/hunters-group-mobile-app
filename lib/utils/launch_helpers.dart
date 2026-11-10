import 'package:url_launcher/url_launcher.dart';
import '../data/app_data.dart';

class LaunchHelpers {
  static Future<void> openWhatsApp({String? prefilledMessage}) async {
    final message = Uri.encodeComponent(
      prefilledMessage ??
          'Hello Hunters Group, I would like to discuss your services.',
    );
    final uri = Uri.parse('https://wa.me/${AppData.whatsappNumber.replaceAll('+', '')}?text=$message');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  static Future<void> openPhone() async {
    final uri = Uri.parse('tel:${AppData.whatsappNumber}');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  static Future<void> openInstagram() async {
    final uri = Uri.parse('https://www.instagram.com/hunters_group71/');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  static Future<void> openFacebook() async {
    // Official page name from client request – opens search / page
    final uri = Uri.parse('https://www.facebook.com/search/top?q=Hunters%20Group');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  static Future<void> openMailto({
    required String name,
    required String email,
    required String phone,
    required String service,
    required String message,
  }) async {
    // No official email published on the website.
    // Using placeholder so the client can replace it later.
    const placeholder = AppData.emailPlaceholder;
    final subject = Uri.encodeComponent('Business Inquiry – $service');
    final body = Uri.encodeComponent(
      'Name: $name\nEmail: $email\nPhone: $phone\nService: $service\n\n$message',
    );
    final uri = Uri.parse('mailto:$placeholder?subject=$subject&body=$body');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
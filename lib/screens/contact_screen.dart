import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/section_header.dart';

class ContactScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final ThemeMode themeMode;

  const ContactScreen({
    super.key,
    required this.onToggleTheme,
    required this.themeMode,
  });

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();

  String? _selectedService;

  final List<String> _services = [
    'Company Registration',
    'Import / Export',
    'E-commerce Setup',
    'Digital Marketing',
    'Other',
  ];

  static const _whatsappNumber = '+923238874539';
  static const _whatsappTextPrefix = 'Hello Hunters Group,\n\nI would like to make an inquiry.\n\nName: ';
  static const _whatsappTextSuffix = '\nEmail: ';
  static const _whatsappPhoneLabel = 'Phone: ';
  static const _whatsappServiceLabel = 'Service: ';
  static const _whatsappMessageLabel = 'Message: ';
  static const _whatsappThankYou = '\n\nThank you.';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  // Build the full WhatsApp prefilled text
  String _buildWhatsAppText() {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final phone = _phoneController.text.trim();
    final message = _messageController.text.trim();
    return '$_whatsappTextPrefix$name$_whatsappTextSuffix$email$_whatsappPhoneLabel$phone$_whatsappServiceLabel${_selectedService ?? ''}$_whatsappMessageLabel$message$_whatsappThankYou';
  }

  Future<void> _launchWhatsApp() async {
    final text = _buildWhatsAppText();
    final encodedText = Uri.encodeComponent(text);
    final uri = Uri.parse('https://wa.me/${_whatsappNumber.replaceAll('+', '')}?text=$encodedText');

    // Try external application first (LaunchMode.externalApplication)
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
      // Clear form after successful launch
      if (mounted) {
        _nameController.clear();
        _emailController.clear();
        _phoneController.clear();
        _messageController.clear();
        setState(() => _selectedService = null);
      }
      return;
    }

    // Fallback 1: whatsapp:// send intent
    final whatsappIntentUri = Uri.parse('whatsapp://send?phone=${_whatsappNumber.replaceAll('+', '')}&text=$encodedText');
    if (await canLaunchUrl(whatsappIntentUri)) {
      await launchUrl(whatsappIntentUri);
      // Clear form after successful launch
      if (mounted) {
        _nameController.clear();
        _emailController.clear();
        _phoneController.clear();
        _messageController.clear();
        setState(() => _selectedService = null);
      }
      return;
    }

    // Fallback 2: Show SnackBar
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open WhatsApp. Please make sure it is installed.')),
      );
    }
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your full name';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
    if (!value.contains('@') || !value.contains('.')) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    // Allow plus sign and digits only
    final trimmed = value.trim();
    if (!RegExp(r'^[+\d\s]+$').hasMatch(trimmed)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  String? _validateService(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a service';
    }
    return null;
  }

  String? _validateMessage(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your message';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: CustomAppBar(
        onToggleTheme: widget.onToggleTheme,
        themeMode: widget.themeMode,
        showGetQuote: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'GET IN TOUCH',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.0,
                color: AppColors.primaryBlue,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Let\'s Build Something\nGreat Together',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    height: 1.2,
                    color: isDark ? Colors.white : AppColors.deepNavy,
                  ),
            ),
            const SizedBox(height: 12),
            Text(
              'Have a question or ready to start your project? Fill out the form below and our team will get back to you shortly.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.5,
                    color: isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.lightTextSecondary,
                  ),
            ),

            const SizedBox(height: 32),
            const SectionHeader(title: 'Send us a Message'),
            const SizedBox(height: 16),

            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                    validator: _validateName,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email Address',
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    validator: _validateEmail,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      prefixIcon: Icon(Icons.phone_outlined),
                    ),
                    validator: _validatePhone,
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Service Interested In',
                      prefixIcon: Icon(Icons.work_outline),
                    ),
                    validator: _validateService,
                    initialValue: _selectedService,
                    items: _services.map((service) {
                      return DropdownMenuItem(
                        value: service,
                        child: Text(service),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() => _selectedService = value);
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _messageController,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      labelText: 'Your Message',
                      alignLabelWithHint: true,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(bottom: 60),
                        child: Icon(Icons.message_outlined),
                      ),
                    ),
                    validator: _validateMessage,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _launchWhatsApp();
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          'Send Message',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
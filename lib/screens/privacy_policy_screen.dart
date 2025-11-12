import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/keya_allbg.webp',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(color: Colors.white);
              },
            ),
          ),
          Column(
            children: [
              AppBar(
                title: const Text('Privacy Policy'),
                backgroundColor: AppTheme.primaryColor,
                foregroundColor: Colors.white,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
            Text(
              'Privacy Policy',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryColor,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Last updated: 2025-11',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 32),
            _buildSection(
              context,
              '1. Introduction',
              'Keya ("we", "our", or "us") is committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our fitness application.',
            ),
            const SizedBox(height: 24),
            _buildSection(
              context,
              '2. Information We Collect',
              'We collect information that you provide directly to us, including:\n\n• Account information (name, email address, password)\n• Profile information (age, gender, fitness goals)\n• Workout data (exercises, duration, calories burned)\n• Content you post or share (photos, comments, posts)\n• Device information (device type, operating system, unique device identifiers)\n• Usage data (how you interact with the App)',
            ),
            const SizedBox(height: 24),
            _buildSection(
              context,
              '3. How We Use Your Information',
              'We use the information we collect to:\n\n• Provide, maintain, and improve our services\n• Personalize your experience and deliver content relevant to your interests\n• Process transactions and send related information\n• Send you technical notices, updates, and support messages\n• Respond to your comments, questions, and requests\n• Monitor and analyze trends, usage, and activities\n• Detect, prevent, and address technical issues',
            ),
            const SizedBox(height: 24),
            _buildSection(
              context,
              '4. Information Sharing and Disclosure',
              'We do not sell your personal information. We may share your information in the following circumstances:\n\n• With your consent or at your direction\n• With service providers who perform services on our behalf\n• To comply with legal obligations or respond to legal requests\n• To protect the rights, property, or safety of Keya, our users, or others\n• In connection with a business transfer or merger',
            ),
            const SizedBox(height: 24),
            _buildSection(
              context,
              '5. Data Security',
              'We implement appropriate technical and organizational measures to protect your personal information against unauthorized access, alteration, disclosure, or destruction. However, no method of transmission over the Internet or electronic storage is 100% secure, and we cannot guarantee absolute security.',
            ),
            const SizedBox(height: 24),
            _buildSection(
              context,
              '6. Your Rights and Choices',
              'You have the right to:\n\n• Access and receive a copy of your personal data\n• Rectify inaccurate or incomplete data\n• Request deletion of your personal data\n• Object to or restrict processing of your data\n• Data portability (receive your data in a structured format)\n• Withdraw consent at any time\n\nYou can exercise these rights by contacting us at support@keya.app',
            ),
            const SizedBox(height: 24),
            _buildSection(
              context,
              '7. Children\'s Privacy',
              'Our App is not intended for children under the age of 13. We do not knowingly collect personal information from children under 13. If you are a parent or guardian and believe your child has provided us with personal information, please contact us immediately.',
            ),
            const SizedBox(height: 24),
            _buildSection(
              context,
              '8. Cookies and Tracking Technologies',
              'We use cookies and similar tracking technologies to track activity on our App and hold certain information. You can instruct your device to refuse all cookies or to indicate when a cookie is being sent.',
            ),
            const SizedBox(height: 24),
            _buildSection(
              context,
              '9. Third-Party Links',
              'Our App may contain links to third-party websites or services. We are not responsible for the privacy practices of these third parties. We encourage you to read their privacy policies.',
            ),
            const SizedBox(height: 24),
            _buildSection(
              context,
              '10. Changes to This Privacy Policy',
              'We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page and updating the "Last updated" date. You are advised to review this Privacy Policy periodically for any changes.',
            ),
            const SizedBox(height: 24),
            _buildSection(
              context,
              '11. Contact Us',
              'If you have any questions about this Privacy Policy, please contact us at:\n\nEmail: privacy@keya.app\n\nWe will respond to your inquiry as soon as possible.',
            ),
            const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
        const SizedBox(height: 12),
        Text(
          content,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                height: 1.6,
                color: Colors.white,
              ),
        ),
      ],
    );
  }
}


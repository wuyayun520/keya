import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

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
                title: const Text('Terms of Service'),
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
              'Terms of Service',
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
              '1. Acceptance of Terms',
              'By accessing and using the Keya fitness application ("App"), you accept and agree to be bound by the terms and provision of this agreement. If you do not agree to abide by the above, please do not use this service.',
            ),
            const SizedBox(height: 24),
            _buildSection(
              context,
              '2. Use License',
              'Permission is granted to temporarily download one copy of the materials on Keya\'s App for personal, non-commercial transitory viewing only. This is the grant of a license, not a transfer of title, and under this license you may not:\n\n• Modify or copy the materials\n• Use the materials for any commercial purpose or for any public display\n• Attempt to decompile or reverse engineer any software contained in the App\n• Remove any copyright or other proprietary notations from the materials',
            ),
            const SizedBox(height: 24),
            _buildSection(
              context,
              '3. User Accounts',
              'You are responsible for maintaining the confidentiality of your account and password. You agree to accept responsibility for all activities that occur under your account or password. You must notify us immediately of any unauthorized use of your account.',
            ),
            const SizedBox(height: 24),
            _buildSection(
              context,
              '4. User Content',
              'You retain ownership of any content you post, upload, or share on the App ("User Content"). By posting User Content, you grant Keya a worldwide, non-exclusive, royalty-free license to use, reproduce, modify, and distribute your User Content for the purpose of operating and promoting the App.',
            ),
            const SizedBox(height: 24),
            _buildSection(
              context,
              '5. Prohibited Uses',
              'You may not use the App:\n\n• In any way that violates any applicable law or regulation\n• To transmit any malicious code or viruses\n• To harass, abuse, or harm other users\n• To impersonate any person or entity\n• To collect or store personal data about other users without their permission',
            ),
            const SizedBox(height: 24),
            _buildSection(
              context,
              '6. Health and Safety Disclaimer',
              'The App provides fitness and health information for educational purposes only. It is not intended as a substitute for professional medical advice, diagnosis, or treatment. Always seek the advice of your physician or other qualified health provider with any questions you may have regarding a medical condition. Never disregard professional medical advice or delay in seeking it because of something you have read in this App.',
            ),
            const SizedBox(height: 24),
            _buildSection(
              context,
              '7. Limitation of Liability',
              'In no event shall Keya or its suppliers be liable for any damages (including, without limitation, damages for loss of data or profit, or due to business interruption) arising out of the use or inability to use the materials on Keya\'s App, even if Keya or a Keya authorized representative has been notified orally or in writing of the possibility of such damage.',
            ),
            const SizedBox(height: 24),
            _buildSection(
              context,
              '8. Revisions',
              'Keya may revise these terms of service at any time without notice. By using this App you are agreeing to be bound by the then current version of these terms of service.',
            ),
            const SizedBox(height: 24),
            _buildSection(
              context,
              '9. Contact Information',
              'If you have any questions about these Terms of Service, please contact us at:\n\nEmail: support@keya.app\n\nWe will respond to your inquiry as soon as possible.',
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


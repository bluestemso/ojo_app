import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  Future<void> _launchPlayStore() async {
    final String packageName = 'solutions.bluestem.ojo202020'; // Replace with your app's package name
    try {
      // Try to open the Play Store app first
      if (Platform.isAndroid) {
        final Uri playStoreAppUri = Uri.parse('market://details?id=$packageName');
        if (await canLaunchUrl(playStoreAppUri)) {
          await launchUrl(playStoreAppUri);
          return;
        }
      }
      
      // Fallback to web URL
      final Uri playStoreWebUri = Uri.parse('https://play.google.com/store/apps/details?id=$packageName');
      if (await canLaunchUrl(playStoreWebUri)) {
        await launchUrl(playStoreWebUri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch store page';
      }
    } catch (e) {
      debugPrint('Error launching store: $e');
      // You might want to show a snackbar or dialog here to inform the user
      // that the store couldn't be opened
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.feedback_outlined),
            title: const Text('Provide Feedback'),
            subtitle: const Text('Rate us on the Play Store'),
            onTap: _launchPlayStore,
          ),
        ],
      ),
    );
  }
} 
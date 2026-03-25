import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class NotificationPage extends ConsumerStatefulWidget {
  const NotificationPage({super.key});

  @override
  ConsumerState<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends ConsumerState<NotificationPage> {
  final List<Map<String, String>> _samples = [
    {
      'title': 'Appointment confirmed',
      'description':
          'Your appointment with Dr. Nguyen on 28 Mar at 10:00 is confirmed.',
      'time': '2h',
      'url': 'https://hih.vn/',
    },
    {
      'title': 'New message from clinic',
      'description':
          'Please complete your pre-visit questionnaire before the appointment.',
      'time': '6h',
      'url': 'https://hih.vn/',
    },
    {
      'title': 'Prescription ready',
      'description': 'Your prescription for Amoxicillin is ready for pickup.',
      'time': '1d',
      'url': 'https://hih.vn/',
    },
    {
      'title': 'Vaccine schedule',
      'description': 'New vaccine slots are available next week. Book now.',
      'time': '3d',
      'url': 'https://hih.vn/',
    },
  ];

  Future<void> _onRefresh() async {
    // mock refresh
    await Future.delayed(const Duration(milliseconds: 600));
    // in real app, trigger provider refresh here
    setState(() {});
  }

  Widget _buildItem(Map<String, String> item) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue.shade50,
        child: Icon(IconsaxPlusLinear.notification, color: Colors.blue),
      ),
      title: Text(
        item['title'] ?? '',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(item['description'] ?? ''),
      trailing: Text(
        item['time'] ?? '',
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
      onTap: () {
        launchUrl(
          Uri.parse(item['url'] ?? ''),
          mode: LaunchMode.externalApplication,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications'), centerTitle: true),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: _samples.length,
          itemBuilder: (_, index) => _buildItem(_samples[index]),
        ),
      ),
    );
  }
}

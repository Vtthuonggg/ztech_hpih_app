import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ztech_hpih_app/core/localization/l10n_extension.dart';

class NotificationPage extends ConsumerStatefulWidget {
  const NotificationPage({super.key});

  @override
  ConsumerState<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends ConsumerState<NotificationPage> {
  Future<void> _onRefresh() async {
    // mock refresh
    await Future.delayed(const Duration(milliseconds: 600));
    // in real app, trigger provider refresh here
    setState(() {});
  }

  List<Map<String, String>> _samples(BuildContext context) {
    final l10n = context.l10n;
    return [
      {
        'title': l10n.notification_sample_appointment_confirmed_title,
        'description': l10n.notification_sample_appointment_confirmed_desc,
        'time': '2h',
        'url': 'https://hih.vn/',
      },
      {
        'title': l10n.notification_sample_clinic_message_title,
        'description': l10n.notification_sample_clinic_message_desc,
        'time': '6h',
        'url': 'https://hih.vn/',
      },
      {
        'title': l10n.notification_sample_prescription_ready_title,
        'description': l10n.notification_sample_prescription_ready_desc,
        'time': '1d',
        'url': 'https://hih.vn/',
      },
      {
        'title': l10n.notification_sample_vaccine_schedule_title,
        'description': l10n.notification_sample_vaccine_schedule_desc,
        'time': '3d',
        'url': 'https://hih.vn/',
      },
    ];
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
    final samples = _samples(context);
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.notification_title), centerTitle: true),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: samples.length,
          itemBuilder: (_, index) => _buildItem(samples[index]),
        ),
      ),
    );
  }
}

// ...new file...
class NotificationItem {
  NotificationItem({
    required this.id,
    required this.title,
    required this.description,
    this.createdAt,
    this.read = false,
  });

  final String id;
  final String title;
  final String description;
  final DateTime? createdAt;
  final bool read;

  factory NotificationItem.fromJson(Map<String, dynamic> json) {
    return NotificationItem(
      id: (json['id'] ?? json['notification_id'] ?? '').toString(),
      title: (json['title'] ?? '') as String,
      description: (json['description'] ?? json['body'] ?? '') as String,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'] as String)
          : (json['created_at'] != null
                ? DateTime.tryParse(json['created_at'] as String)
                : null),
      read: json['read'] == true || json['is_read'] == true,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'createdAt': createdAt?.toIso8601String(),
    'read': read,
  };
}

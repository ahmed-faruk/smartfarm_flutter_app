class Notification {
  final String userId;
  final String notificationType;
  final String notificationMessage;
  final DateTime timestamp;

  Notification({
    required this.userId,
    required this.notificationType,
    required this.notificationMessage,
    required this.timestamp,
  });
}

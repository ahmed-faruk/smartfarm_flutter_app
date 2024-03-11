class Recommendation {
  final String userId;
  final String cropId;
  final String recommendationType;
  final String recommendationDetails;
  final DateTime timestamp;

  Recommendation({
    required this.userId,
    required this.cropId,
    required this.recommendationType,
    required this.recommendationDetails,
    required this.timestamp,
  });
}

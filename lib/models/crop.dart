class Crop {
  final String id;
  final String userId;
  final String cropType;
  final DateTime plantingDate;
  final DateTime expectedHarvestDate;
  final DateTime? lastWateringDate;
  final DateTime? lastFertilizationDate;
  final String? pestManagementNotes;

  Crop({
    required this.id,
    required this.userId,
    required this.cropType,
    required this.plantingDate,
    required this.expectedHarvestDate,
    this.lastWateringDate,
    this.lastFertilizationDate,
    this.pestManagementNotes,
  });
}

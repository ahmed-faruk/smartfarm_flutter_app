/*class PlantModel  {

  final String id;
  final String userId;
  final String cropType;
  final DateTime plantingDate;
  final DateTime expectedHarvestDate;
  final DateTime? lastWateringDate;
  final DateTime? lastFertilizationDate;
  final String? pestManagementNotes;
  final String imageAsset;

  PlantModel({
    required this.id,
    required this.userId,
    required this.cropType,
    required this.plantingDate,
    required this.expectedHarvestDate,
    this.lastWateringDate,
    this.lastFertilizationDate,
    this.pestManagementNotes,
    required this.imageAsset,
  });
}
*/
class PlantModel {
  final int id;
  final String name;
  final String imageAsset;

  PlantModel({required this.id, required this.name, required this.imageAsset});
}
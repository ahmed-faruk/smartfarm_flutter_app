class User {
  final String id;
  final String email;
  final String password; // Note: In production, passwords should be stored securely.
  final String name;
  final double farmLatitude;
  final double farmLongitude;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.farmLatitude,
    required this.farmLongitude,
  });
}

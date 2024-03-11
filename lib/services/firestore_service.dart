import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartfarm_flutter_app/models/user.dart';
import 'package:smartfarm_flutter_app/models/crop.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(User user) async {
    await _firestore.collection('users').doc(user.id).set({
      'email': user.email,
      'password': user.password,
      'name': user.name,
      'farmLatitude': user.farmLatitude,
      'farmLongitude': user.farmLongitude,
    });
  }

  Future<User?> getUser(String userId) async {
    DocumentSnapshot userSnapshot = await _firestore.collection('users').doc(userId).get();
    if (userSnapshot.exists) {
      return User(
        id: userId,
        email: userSnapshot['email'],
        password: userSnapshot['password'],
        name: userSnapshot['name'],
        farmLatitude: userSnapshot['farmLatitude'],
        farmLongitude: userSnapshot['farmLongitude'],
      );
    } else {
      return null;
    }
  }

  Future<void> addCrop(Crop crop) async {
    await _firestore.collection('crops').doc(crop.id).set({
      'userId': crop.userId,
      'cropType': crop.cropType,
      'plantingDate': crop.plantingDate,
      'expectedHarvestDate': crop.expectedHarvestDate,
      'lastWateringDate': crop.lastWateringDate,
      'lastFertilizationDate': crop.lastFertilizationDate,
      'pestManagementNotes': crop.pestManagementNotes,
    });
  }

// Add additional Firestore-related methods as needed.
}

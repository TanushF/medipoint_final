import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

class User {
  final bool? isDoctor;

  User({
    this.isDoctor,
  });

  factory User.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return User(
      isDoctor: data?['isDoctor'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (isDoctor != null) "name": isDoctor,
    };
  }
}

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  Future<bool> isUserDoctor(String uid) async {
    final ref = await db.collection("users").doc(uid).withConverter(
          fromFirestore: User.fromFirestore,
          toFirestore: (User user, _) => user.toFirestore(),
        );
    final docSnap = await ref.get();
    print(docSnap.get('isDoctor'));
    return docSnap.get('isDoctor');
  }

  Future<dynamic> getUserInfo(String uid) async {
    await db.collection("users").doc(uid).get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        return data;
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  Future<void> setUserInfo(String uid, bool isDoctor) async {
    final userInfo = <String, bool>{
      "isDoctor": isDoctor,
    };

    db
        .collection("users")
        .doc(uid)
        .set(userInfo)
        .onError((e, _) => print("Error writing document: $e"));
  }

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e);
    }
  }
}

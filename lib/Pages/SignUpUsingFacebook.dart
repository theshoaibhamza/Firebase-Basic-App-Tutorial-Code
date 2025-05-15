// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<User?> signInWithFacebook() async {
//     try {
//       // Trigger the Facebook sign-in flow
//       final LoginResult result = await FacebookAuth.instance.login();

//       if (result.status == LoginStatus.success) {
//         // Get the user's Facebook AccessToken
//         final AccessToken? accessToken = result.accessToken;

//         if (accessToken != null) {
//           // Create a credential from the access token
//           final facebookAuthCredential =
//               FacebookAuthProvider.credential(accessToken.token);

//           // Use the credential to sign in with Firebase
//           final UserCredential userCredential =
//               await _auth.signInWithCredential(facebookAuthCredential);

//           return userCredential.user;
//         } else {
//           print("AccessToken is null");
//           return null;
//         }
//       } else {
//         print("Login failed: ${result.status}");
//         return null;
//       }
//     } catch (e) {
//       print("Error during Facebook sign-in: $e");
//       return null;
//     }
//   }

//   Future<void> signOut() async {
//     await _auth.signOut();
//     await FacebookAuth.instance.logOut();
//   }
// }

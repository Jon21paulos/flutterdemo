import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneAuthService with ChangeNotifier {
  final FirebaseAuth _firebaseAuth;
  PhoneAuthService(this._firebaseAuth);

  Stream<User?> get authStateChanges =>  _firebaseAuth.idTokenChanges();

  String? _verId;
  String? _phone;
  bool _codeSent = false;
  String _errorMessage = "";
  bool _isLoading = false;

  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;
  String? get verId => _verId;
  String? get phone => _phone;
  bool get codeSent => _codeSent;

  void setIsLoading(val){
    _isLoading = val;
    notifyListeners();
  }

  void setErrorMessage(e){
    _errorMessage = e;
    notifyListeners();
  }

  void setcodeSent(bool value) {
    _codeSent = value;
    notifyListeners();
  }

  void setverId(String value) {
    _verId = value;
    notifyListeners();
  }

  void setphone(String value) {
    _phone = value;
    notifyListeners();
  }


  Future<void> verifyPhone(BuildContext context) async {
    setIsLoading(true);
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phone.toString(),

      timeout: const Duration(seconds: 120),

      verificationCompleted: (PhoneAuthCredential credential) async {
        await _firebaseAuth.signInWithCredential(credential);
        setIsLoading(false);
        showSnackBar(context, "Verification Completed");
      },

      verificationFailed: (FirebaseAuthException e) {
        setIsLoading(false);
        if (e.code == 'invalid-phone-number') {
          setErrorMessage('The provided phone number is not valid.');
        }else{
          print(e.toString());
          setErrorMessage("oops! something went wrong");
        }
      },

      codeSent: (String verficationId, int? resendToken) {
        setcodeSent(true);
        setverId(verficationId);
        showSnackBar(context, "Verification Code sent on the phone number");
      },

      codeAutoRetrievalTimeout: (String verificationId) {
        setverId(verificationId);
      },
    );
  }

  Future<void> verifyPin(String pin,context) async {

    PhoneAuthCredential credential =
    PhoneAuthProvider.credential(verificationId: verId.toString(), smsCode: pin);

    try {
      await _firebaseAuth.signInWithCredential(credential);
      notifyListeners();
      showSnackBar(context, "you success fully logged in");
    } on FirebaseAuthException catch (e) {

      switch(e.code){

        case "operation-not-allowed":
          setcodeSent(false);
          setErrorMessage("Too many requests to log into this account.");
          break;

        case 'user-disabled':
          setcodeSent(false);
          setErrorMessage("the user you tried to log is disabled");
          break;

        default:
          setcodeSent(false);
          setErrorMessage(e.toString());
          break;
      }
    }
  }
}

void showSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(content: Text(text));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}


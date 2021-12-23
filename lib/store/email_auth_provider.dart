import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:simpleproject/models/user_account_model.dart';

class AuthenticationService with ChangeNotifier{

  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.idTokenChanges();

  String _errorMessage = "";
  bool _isLoading = false;

  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  void setIsLoading(val){
    _isLoading = val;
    notifyListeners();
  }

  void setErrorMessage(e){
    _errorMessage = e;
    notifyListeners();
  }


  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future signIn(
      {context, required String email, required String password}) async {
    try {
      setIsLoading(true);
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      setIsLoading(false);

    } on SocketException catch (e) {
      setIsLoading(false);
      setErrorMessage("please check your internet connection");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          setIsLoading(false);
          setErrorMessage("the email you entered is invalid");
          break;
        case 'user-disabled':
          setIsLoading(false);
          setErrorMessage("the user you tried to log is disabled");
          break;
        case 'user-not-found':
          setIsLoading(false);
          setErrorMessage("user is not found");
          break;
        case "operation-not-allowed":
          setIsLoading(false);
          setErrorMessage("Too many requests to log into this account.");
          break;
        case "wrong-password":
          setIsLoading(false);
          setErrorMessage("the password you entered is incorrect");
          break;
        default:
          setIsLoading(false);
          setErrorMessage(e.message.toString());
          break;
      }
    }
  }

  Future signUp(
      {context, required String email, required String password, required String nameController}) async {
    try {
      setIsLoading(true);
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password).then((value) => {postDetailsToFirestore(nameController,context)});
      setIsLoading(false);

    } on SocketException catch (e) {
      setIsLoading(false);
      setErrorMessage("please check your internet connection");

    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          setIsLoading(false);
          setErrorMessage("the email you entered is invalid");
          break;

        case 'email-already-in-use':
          setIsLoading(false);
          setErrorMessage("User already exist");
          break;

        case "operation-not-allowed":
          setIsLoading(false);
          setErrorMessage("Too many requests to log into this account.");
          break;

        default:
          setIsLoading(false);
          setErrorMessage(e.message.toString());
          break;
        }
      }
    }

  void initialValues(){
    setErrorMessage("");
    setIsLoading(false);
  }

  postDetailsToFirestore(String nameController,context) async {

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _firebaseAuth.currentUser;

    UserAccountModel userAccountModel = UserAccountModel();

    userAccountModel.name = nameController;
    userAccountModel.email = user!.email;
    userAccountModel.uid = user.uid;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userAccountModel.toMap());

    showSnackBar(context,"Account created successfully");

  }
}
void showSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(content: Text(text));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
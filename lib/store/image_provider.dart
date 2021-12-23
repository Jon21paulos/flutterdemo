import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simpleproject/store/email_auth_provider.dart';

class ImageUploader with ChangeNotifier{
  ImagePicker image = ImagePicker();
  File? file;
  String? downloadUrl = "";
  User? user = FirebaseAuth.instance.currentUser;

  getImage(context) async{
    var img = await image.pickImage(source: ImageSource.gallery);
    file = File(img!.path);
    uploadImage(context);
  }

  uploadImage(context) async{
    final postId = DateTime.now().millisecondsSinceEpoch.toString();
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Reference ref = FirebaseStorage.instance
           .ref()
           .child("${user!.uid}/images")
           .child("post_$user!.uid");
    await ref.putFile(file!);
    downloadUrl = await ref.getDownloadURL();

    await firebaseFirestore
          .collection("users")
          .doc(user!.uid)
          .collection("images")
          .add({'downloadUrl':downloadUrl}).whenComplete(() =>
           showSnackBar(context, "image uploaded succesfuly"),
    );
  }
}

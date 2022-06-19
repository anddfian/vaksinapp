import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:vaksinapp/screen/controller/Controller.dart';

part 'SplashScreen.dart';
part 'LandingScreen.dart';
part 'HomeScreen.dart';
part 'LoginScreen.dart';
part 'DetailFaskesScreen.dart';
part 'FindFaskesScreen.dart';
part 'Profil.dart';
part 'ChangePassword.dart';
part 'admin/FaskesListScreen.dart';
part 'admin/FindFaskesAdminScreen.dart';
part 'admin/AddStaffFaskesScreen.dart';
part 'admin/EditFaskesScreen.dart';
part 'admin/StaffFaskesListScreen.dart';
part 'admin/FindStaffFaskesScreen.dart';
part 'admin/AddFaskesScreen.dart';
part 'admin/EditStaffFaskesScreen.dart';
part 'staff/StaffFaskesScreen.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference users = firestore.collection("users");
CollectionReference faskes = firestore.collection("faskes");
FirebaseStorage _storage = FirebaseStorage.instance;
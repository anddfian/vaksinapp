import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference faskes = firestore.collection("faskes");

class CheckBoxController extends GetxController {
  var isSinovac = false.obs;
  var isAstraZeneca = false.obs;
  var isModerna = false.obs;
  var isPfizer = false.obs;
  var isSinopharm = false.obs;

  setValueSinovac(id, newValue) {
    isSinovac(newValue!);
    faskes.doc(id).update({
      "sinovac": isSinovac.value,
    });
  }

  setValueAstraZeneca(id, newValue) {
    isAstraZeneca(newValue!);
    faskes.doc(id).update({
      "astrazeneca": isAstraZeneca.value,
    });
  }

  setValueModerna(id, newValue) {
    isModerna(newValue!);
    faskes.doc(id).update({
      "moderna": isModerna.value,
    });
  }

  setValuePfizer(id, newValue) {
    isPfizer(newValue!);
    faskes.doc(id).update({
      "pzifer": isPfizer.value,
    });
  }

  setValueSinopharm(id, newValue) {
    isSinopharm(newValue!);
    faskes.doc(id).update({
      "sinopharm": isSinopharm.value,
    });
  }
}

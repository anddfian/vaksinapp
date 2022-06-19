part of 'screen.dart';

class Profil extends StatelessWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection("users");
    FirebaseStorage _storage = FirebaseStorage.instance;

    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              margin: EdgeInsets.only(left: 80),
              child: Image.asset(
                'assets/Vaksin.png',
                fit: BoxFit.contain,
                height: 25,
              ),
            ),
          ])),
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: users
              .where('email', isEqualTo: FirebaseAuth.instance.currentUser?.email)
              .snapshots(),
          builder: (_, snapshot) {
            return (snapshot.hasData)
                ? Column(
                    children: snapshot.data!.docs
                        .map((e) => GestureDetector(
                              onTap: () async {
                                XFile? imageFile = await ImagePicker()
                                    .pickImage(source: ImageSource.gallery);

                                if(imageFile != null) {
                                  String? fileName = imageFile.name;
                                  String? filePath = imageFile.path;
                                  Reference storageRef =
                                      _storage.ref("$fileName.png");
                                  final path = 'users/${imageFile.name}';
                                  final file = File(imageFile.path);

                                  final ref =
                                      FirebaseStorage.instance.ref().child(path);
                                  UploadTask uploadTask = ref.putFile(file);

                                  final snapshot =
                                      await uploadTask.whenComplete(() {});
                                  final urlPhoto =
                                      await snapshot.ref.getDownloadURL();

                                  users.doc(e.id).update({
                                    'urlPhoto': urlPhoto,
                                  });
                                }
                              },
                              child: Column(
                                children: [
                                  Container(
                                      margin:
                                          EdgeInsets.only(top: 40, bottom: 5),
                                      child: Image.network(
                                        e.get('urlPhoto'),
                                        fit: BoxFit.contain,
                                        height: 100,
                                      )),
                                  Text(
                                    e.get('name'),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    e.get('status'),
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 18),
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                  )
                : Text('Loading...');
          },
          // children: [
          //   GestureDetector(
          //     onTap: () async {

          //       XFile? imageFile = await ImagePicker()
          //           .pickImage(source: ImageSource.gallery);

          //       String? fileName = imageFile?.name;
          //       String? filePath = imageFile?.path;
          //       Reference storageRef = _storage.ref("$fileName.png");
          //       final path = 'users/${imageFile!.name}';
          //       final file = File(imageFile.path);

          //       final ref = FirebaseStorage.instance.ref().child(path);
          //       UploadTask uploadTask = ref.putFile(file);

          //       final snapshot = await uploadTask.whenComplete(() {});
          //       final urlPhoto = await snapshot.ref.getDownloadURL();

          //       users.doc().update({
          //         'urlPhoto': urlPhoto,
          //       });

          //     },
          //     child: Container(
          //         margin: EdgeInsets.only(top: 40, bottom: 5),
          //         child: Image.network(
          //           snapshot.data!.docs.first.get('urlPhoto'),
          //           fit: BoxFit.contain,
          //           height: 100,
          //         )),
          //   ),
          //   Text(
          //     snapshot.data!.docs.first.get('name'),
          //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          //   ),
          //   Text(
          //     snapshot.data!.docs.first.get('status'),
          //     style: TextStyle(color: Colors.grey, fontSize: 18),
          //   ),
          // ],
          // ) : Text("Loading...");
          // }
        ),
      ),
    );
  }
}

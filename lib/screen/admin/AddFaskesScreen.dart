part of '../screen.dart';

class AddFaskesScreen extends StatefulWidget {
  const AddFaskesScreen({Key? key}) : super(key: key);

  @override
  State<AddFaskesScreen> createState() => _AddFaskesScreenState();
}

class _AddFaskesScreenState extends State<AddFaskesScreen> {
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailStaffController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference faskes = firestore.collection("faskes");
    FirebaseStorage _storage = FirebaseStorage.instance;

    XFile? imageFile;
    String? urlImage;

    return Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 80),
                    child: Image.asset(
                      'assets/Vaksin.png',
                      fit: BoxFit.contain,
                      height: 25,
                    ),
                  ),
                ])),
        body: ListView(
          children: [
            Column(children: [
              Container(
                margin: EdgeInsets.only(top: 40, bottom: 20),
                child: Text(
                  "Tambah Fasilitas Kesehatan",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff92A3FD),
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 16, bottom: 8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Material(
                            elevation: 5,
                            shadowColor: Color(0xffDDDADA),
                            child: TextField(
                              controller: nameController,
                              cursorColor: Color(0xff44CCC5),
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: "Nama Fasilitas Kesehatan",
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 94, 91, 91)
                                        .withOpacity(0.5)),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 16, bottom: 8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Material(
                            elevation: 5,
                            shadowColor: Color(0xffDDDADA),
                            child: TextField(
                              controller: addressController,
                              cursorColor: Color(0xff44CCC5),
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: "Alamat",
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 94, 91, 91)
                                        .withOpacity(0.5)),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 16, bottom: 8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Material(
                            elevation: 5,
                            shadowColor: Color(0xffDDDADA),
                            child: TextField(
                              controller: phoneNumberController,
                              cursorColor: Color(0xff44CCC5),
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: "No Telepon",
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 94, 91, 91)
                                        .withOpacity(0.5)),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 16, bottom: 8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Material(
                            elevation: 5,
                            shadowColor: Color(0xffDDDADA),
                            child: TextField(
                              controller: emailStaffController,
                              cursorColor: Color(0xff44CCC5),
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: "Email Staff Fasilitas Kesehatan",
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 94, 91, 91)
                                        .withOpacity(0.5)),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  imageFile = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 16, bottom: 8),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Material(
                              elevation: 5,
                              shadowColor: Color(0xffDDDADA),
                              child: TextField(
                                enabled: false,
                                cursorColor: Color(0xff44CCC5),
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: "Foto Fasilitas Kesehatan",
                                    hintStyle: TextStyle(
                                        color: Color.fromARGB(255, 94, 91, 91)
                                            .withOpacity(0.5)),
                                    suffixIcon: Icon(Icons.image_rounded)),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 200),
                child: ElevatedButton(
                  onPressed: () async{
                    if (imageFile != null) {
                      String? fileName = imageFile!.name;
                      String? filePath = imageFile!.path;
                      Reference storageRef = _storage.ref("$fileName.png");
                      final path = 'faskes/${imageFile!.name}';
                      final file = File(imageFile!.path);

                      final ref = FirebaseStorage.instance.ref().child(path);
                      UploadTask uploadTask = ref.putFile(file);

                      final snapshot = await uploadTask.whenComplete(() {});
                      urlImage = await snapshot.ref.getDownloadURL();
                    }
                    faskes.add({
                      "name": nameController.text,
                      "address": addressController.text,
                      "phoneNumber": phoneNumberController.text,
                      "urlImage": urlImage,
                      "emailStaff": emailStaffController,
                      "sinovac": false,
                      "moderna": false,
                      "astrazeneca": false,
                      "sinopharm": false,
                      "pfizer": false,
                    });
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(99))),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Color(0xff9DCEFF), Color(0xff92A3FD)]),
                        borderRadius: BorderRadius.circular(99)),
                    child: Container(
                      width: 315,
                      height: 60,
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 120, right: 12),
                            child: Text(
                              'Tambah',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ],
        ));
  }
}

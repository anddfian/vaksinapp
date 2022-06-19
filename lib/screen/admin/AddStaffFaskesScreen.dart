part of '../screen.dart';

class AddStaffFaskesScreen extends StatefulWidget {
  const AddStaffFaskesScreen({Key? key}) : super(key: key);

  @override
  State<AddStaffFaskesScreen> createState() => _AddStaffFaskesScreenState();
}

class _AddStaffFaskesScreenState extends State<AddStaffFaskesScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameFaskesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection("users");
    CollectionReference faskes = firestore.collection("faskes");
    FirebaseStorage _storage = FirebaseStorage.instance;

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
                  "Tambah Staff Fasilitas Kesehatan",
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
                                hintText: "Nama Lengkap",
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
                              controller: emailController,
                              cursorColor: Color(0xff44CCC5),
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: "Email",
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
                              controller: passwordController,
                              cursorColor: Color(0xff44CCC5),
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: "Password",
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
                              controller: nameFaskesController,
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
              Container(
                margin: EdgeInsets.only(top: 200),
                child: ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
                    users.add({
                      "name": nameController.text,
                      "email": emailController.text,
                      "nameFaskes": nameFaskesController.text,
                      "status": "Staff",
                      "urlPhoto": "https://firebasestorage.googleapis.com/v0/b/vaksinapp-4124b.appspot.com/o/users%2FProfil.png?alt=media&token=0d65bd35-00ff-40d3-8375-ad8ac36bdab4",
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

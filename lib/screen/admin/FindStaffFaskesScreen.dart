part of '../screen.dart';

class FindStaffFaskesScreen extends StatefulWidget {
  const FindStaffFaskesScreen({Key? key}) : super(key: key);

  @override
  State<FindStaffFaskesScreen> createState() => _FindStaffFaskesScreenState();
}

class _FindStaffFaskesScreenState extends State<FindStaffFaskesScreen> {
  final cariController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
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
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) {
                    return Profil();
                  },
                ));
              },
              child: Icon(
                Icons.person,
                color: Color(0xff46DFD8),
              ),
            )
          ],
        ),
      ),
      body: ListView(children: [
        Column(
          children: [
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
                          // elevation: 5,
                          shadowColor: Color(0xffDDDADA),
                          child: TextField(
                            controller: cariController,
                            cursorColor: Color.fromARGB(255, 0, 0, 0),
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                //outline color
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        color: Color(0xff46DFD8),
                                        width: 1,
                                        style: BorderStyle.solid)),
                                hintText: "Cari Fasilitas Kesehatan",
                                hintStyle: TextStyle(color: Color(0xff46DFD8)),
                                prefixIcon: Container(
                                  child: Icon(Icons.search),
                                )),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: users.where('status', isEqualTo: "Staff").where('name', isEqualTo: cariController.text).snapshots(),
              builder: (_, snapshot) {
                return (snapshot.hasData)
                    ? Column(
                        children: snapshot.data!.docs
                            .map((e) => Container(
                                margin: EdgeInsets.only(top: 25),
                                child: Material(
                                    elevation: 5,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        margin: EdgeInsets.only(
                                          left: 18,
                                        ),
                                        width: lebar - 60,
                                        height: 80,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image.network(
                                                e.get('urlPhoto'),
                                                fit: BoxFit.cover,
                                                height: 60,
                                                width: 60,
                                              ),
                                              Column(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 20,
                                                        bottom: 3,
                                                        left: 12),
                                                    child: Text(
                                                      e.get('name'),
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    e.get('nameFaskes'),
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: ((context) =>
                                                                EditStaffFaskesScreen(
                                                                  id: e.id,
                                                                  name: e.get(
                                                                      "name"),
                                                                  email: e.get(
                                                                      "email"),
                                                                  nameFaskes: e.get(
                                                                      "nameFaskes"),
                                                                )),
                                                          ));
                                                    },
                                                    child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 5),
                                                        child: Icon(
                                                          Icons.update,
                                                          color:
                                                              Color(0xff46DFD8),
                                                        )),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      CustomAlertThree(
                                                          context,
                                                          e.id,
                                                          "Apakah anda yakin ingin menghapus staff fasilitas kesehatan ini?");
                                                    },
                                                    child: Container(
                                                        margin: EdgeInsets.only(
                                                            right: 10),
                                                        child: Icon(
                                                            Icons.delete,
                                                            color: Color(
                                                                0xff46DFD8))),
                                                  ),
                                                ],
                                              )
                                            ])))))
                            .toList(),
                      )
                    : Text('Loading...');
              },
            )
          ],
        )
      ]),
    );
  }
}

@override
Future<dynamic> CustomAlertThree(
    BuildContext context, String uid, String message) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Hapus Staff Fasilitas Kesehatan"),
        content: Text(message),
        actions: [
          TextButton(
              onPressed: () {
                users.doc(uid).delete();
                Navigator.pop(context);
              },
              child: Text("Ok")),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"))
        ],
      );
    },
  );
}

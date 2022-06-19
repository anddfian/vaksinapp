part of 'screen.dart';

class FindFaskesScreen extends StatefulWidget {
  const FindFaskesScreen({Key? key}) : super(key: key);

  @override
  State<FindFaskesScreen> createState() => _FindFaskesScreenState();
}

class _FindFaskesScreenState extends State<FindFaskesScreen> {
  final cariController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference faskes = firestore.collection("faskes");

    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 80),
              child: Image.asset(
                'assets/Vaksin.png',
                fit: BoxFit.contain,
                height: 25,
              ),
            ),
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
              stream: faskes
                  .where('name', isEqualTo: cariController.text)
                  .snapshots(),
              builder: (_, snapshot) {
                return (snapshot.hasData)
                    ? Column(
                        children: snapshot.data!.docs
                            .map((e) => GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (_) {
                                    return DetailFaskesScreen(
                                      id: e.id,
                                      name: e.get("name"),
                                      address: e.get("address"),
                                      phoneNumber: e.get("phoneNumber"),
                                      urlImage: e.get("urlImage"),
                                    );
                                  },
                                ));
                              },
                              child: Container(
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
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(right: 30),
                                                  child: Image.network(
                                                    e.get('urlImage'),
                                                    fit: BoxFit.cover,
                                                    height: 60,
                                                    width: 60,
                                                  ),
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
                                                      e.get('address'),
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ])))),
                            ))
                            .toList(),
                      )
                    : Text('Loading...');
              },
            ),
          ],
        )
      ]),
    );
  }
}

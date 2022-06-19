part of 'screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 20, top: 20),
                      child: Image.asset("assets/Drawer.png")),
                ],
              )),
              ListTile(
                leading: Icon(Icons.login),
                title: Text("Login"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (_) {
                      return LoginScreen();
                    },
                  ));
                },
              ),
              ListTile(
                leading: Icon(Icons.search),
                title: Text("Cari Fasilitas Kesehatan"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (_) {
                      return FindFaskesScreen();
                    },
                  ));
                },
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: faskes.snapshots(),
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
                                          child: Row(children: [
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
                                                      fontWeight: FontWeight.bold,
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
        ));
  }
}

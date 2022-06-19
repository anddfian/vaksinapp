part of '../screen.dart';

class FaskesListScreen extends StatelessWidget {
  const FaskesListScreen({Key? key}) : super(key: key);

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
              title: Text("Cari Fasilitas Kesehatan"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) {
                    return FindFaskesAdminScreen();
                  },
                ));
              },
            ),
            ListTile(
              title: Text("Staff Fasilitas Kesehatan"),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (_) {
                    return StaffFaskesListScreen();
                  },
                ));
              },
            ),
            // ListTile(
            //   title: Text("Ganti Password"),
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(
            //       builder: (_) {
            //         return ChangePasswordScreen();
            //       },
            //     ));
            //   },
            // ),
            ListTile(
              title: Text("Logout"),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (_) {
                    return LandingScreen();
                  },
                ));
              },
            ),
          ],
        ),
      ),
      body: ListView(children: [
        StreamBuilder<QuerySnapshot>(
          stream: faskes.snapshots(),
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
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    margin: EdgeInsets.only(
                                      left: 18,
                                    ),
                                    width: lebar - 60,
                                    height: 80,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                      Image.network(
                                        e.get('urlImage'),
                                        fit: BoxFit.cover,
                                        height: 60,
                                        width: 60,
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 20, bottom: 3, left: 12),
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
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: ((context) =>
                                                        EditFaskesScreen(
                                                          id: e.id,
                                                          name: e.get("name"),
                                                          address: e.get("address"),
                                                          phoneNumber: e.get("phoneNumber"),
                                                          emailStaff: e.get("emailStaff"),
                                                          urlImage: e.get("urlImage")
                                                        )),
                                                  ));
                                            },
                                            child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 5),
                                                child: Icon(
                                                  Icons.update,
                                                  color: Color(0xff46DFD8),
                                                )),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              CustomAlert(context, e.id, "Apakah anda yakin ingin menghapus fasilitas kesehatan ini?");
                                            },
                                            child: Container(
                                                  margin:
                                                      EdgeInsets.only(right: 10),
                                                child: Icon(Icons.delete,
                                                    color: Color(0xff46DFD8))),
                                          ),
                                        ],
                                      )
                                    ])))))
                        .toList(),
                  )
                : Text('Loading...');
          },
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => AddFaskesScreen()),
              ));
        },
        backgroundColor: Color(0xff46DFD8),
        child: const Icon(Icons.add),
      ),
    );
  }
}

Future<dynamic> CustomAlert(BuildContext context, String uid, String message) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Hapus Fasilitas Kesehatan"),
        content: Text(message),
        actions: [
          TextButton(
              onPressed: () {
                faskes.doc(uid).delete();
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
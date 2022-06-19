part of '../screen.dart';

class StaffFaskesScreen extends StatelessWidget {
  const StaffFaskesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CheckBoxController b = Get.put(CheckBoxController());

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
              title: Text("Log Out"),
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
            stream: faskes
                .where('emailStaff',
                    isEqualTo: FirebaseAuth.instance.currentUser?.email)
                .snapshots(),
            builder: (_, snapshot) {
              return (snapshot.hasData)
                  ? Column(
                      children: snapshot.data!.docs
                          .map((e) => Center(
                                child: Column(children: [
                                  Image.network(
                                    e.get('urlImage'),
                                    fit: BoxFit.contain,
                                    width: lebar,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 20, bottom: 3),
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
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 3, bottom: 5),
                                    child: Text(
                                      e.get('phoneNumber'),
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Divider(),
                                  Container(
                                      margin: EdgeInsets.only(top: 20),
                                      width: lebar - 30,
                                      height: 54,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            color: Color(0xff46DFD8),
                                          )),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              margin: EdgeInsets.only(left: 20),
                                              child: Text(
                                                "SINOVAC",
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )),
                                          Container(
                                            child: Obx(() => Checkbox(
                                                  value: b.isSinovac.value,
                                                  onChanged: (newValue) {
                                                    b.setValueSinovac(e.id, newValue);
                                                  },
                                                )),
                                          ),
                                        ],
                                      )),
                                  Container(
                                      margin: EdgeInsets.only(top: 20),
                                      width: lebar - 30,
                                      height: 54,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            color: Color(0xff46DFD8),
                                          )),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              margin: EdgeInsets.only(left: 20),
                                              child: Text(
                                                "ASTRAZENECA",
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )),
                                          Container(
                                            child: Obx(() => Checkbox(
                                                  value: b.isAstraZeneca.value,
                                                  onChanged: (newValue) {
                                                    b.setValueAstraZeneca(e.id, newValue);
                                                  },
                                                )),
                                          ),
                                        ],
                                      )),
                                  Container(
                                      margin: EdgeInsets.only(top: 20),
                                      width: lebar - 30,
                                      height: 54,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            color: Color(0xff46DFD8),
                                          )),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              margin: EdgeInsets.only(left: 20),
                                              child: Text(
                                                "MODERNA",
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )),
                                          Container(
                                            child: Obx(() => Checkbox(
                                                  value: b.isModerna.value,
                                                  onChanged: (newValue) {
                                                    b.setValueModerna(e.id, newValue);
                                                  },
                                                )),
                                          ),
                                        ],
                                      )),
                                  Container(
                                      margin: EdgeInsets.only(top: 20),
                                      width: lebar - 30,
                                      height: 54,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            color: Color(0xff46DFD8),
                                          )),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              margin: EdgeInsets.only(left: 20),
                                              child: Text(
                                                "PFIZER",
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )),
                                          Container(
                                            child: Obx(() => Checkbox(
                                                  value: b.isPfizer.value,
                                                  onChanged: (newValue) {
                                                    b.setValuePfizer(e.id, newValue);
                                                  },
                                                )),
                                          ),
                                        ],
                                      )),
                                  Container(
                                      margin: EdgeInsets.only(top: 20),
                                      width: lebar - 30,
                                      height: 54,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            color: Color(0xff46DFD8),
                                          )),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              margin: EdgeInsets.only(left: 20),
                                              child: Text(
                                                "SINOPHARM",
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )),
                                          Container(
                                            child: Obx(() => Checkbox(
                                                  value: b.isSinopharm.value,
                                                  onChanged: (newValue) {
                                                    b.setValueSinopharm(e.id, newValue);
                                                  },
                                                )),
                                          ),
                                        ],
                                      )),
                                ]),
                              ))
                          .toList(),
                    )
                  : Text("Loading");
            })
      ]),
    );
  }
}

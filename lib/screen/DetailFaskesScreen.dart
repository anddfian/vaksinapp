part of 'screen.dart';

class DetailFaskesScreen extends StatefulWidget {
  const DetailFaskesScreen({
    Key? key,
    required this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.urlImage,
  }) : super(key: key);

  final String id, name, address, phoneNumber, urlImage;

  @override
  State<DetailFaskesScreen> createState() => _DetailFaskesScreenState();
}

class _DetailFaskesScreenState extends State<DetailFaskesScreen> {
  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
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
        body: ListView(
          children: [
            StreamBuilder<QuerySnapshot>(
                stream:
                    faskes.where('name', isEqualTo: widget.name).snapshots(),
                builder: (_, snapshot) {
                  return (snapshot.hasData)
                      ? Column(
                          children: snapshot.data!.docs
                              .map(
                                (e) => Column(
                                  children: [
                                    Image.network(
                                      e.get('urlImage'),
                                      fit: BoxFit.contain,
                                      width: lebar,
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 20, bottom: 3),
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
                                      margin:
                                          EdgeInsets.only(top: 3, bottom: 5),
                                      child: Text(
                                        e.get('phoneNumber'),
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      color: Color(0xff44CCC5),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 13),
                                      child: Text(
                                        "JENIS VAKSIN TERSEDIA",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 60, right: 60, top: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "SINOVAC",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          (e.get("sinovac"))
                                              ? Text("Tersedia",
                                                  style: TextStyle(
                                                      color: Color(0xff44CCC5)))
                                              : Text("Tidak Tersedia",
                                                  style: TextStyle(
                                                      color:
                                                          Color(0xff92a3fd))),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 60, right: 60, top: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "MODERNA",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          (e.get("moderna"))
                                              ? Text("Tersedia",
                                                  style: TextStyle(
                                                      color: Color(0xff44CCC5)))
                                              : Text("Tidak Tersedia",
                                                  style: TextStyle(
                                                      color:
                                                          Color(0xff92a3fd))),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 60, right: 60, top: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "ASTRAZENECA",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          (e.get("astrazeneca"))
                                              ? Text("Tersedia",
                                                  style: TextStyle(
                                                      color: Color(0xff44CCC5)))
                                              : Text("Tidak Tersedia",
                                                  style: TextStyle(
                                                      color:
                                                          Color(0xff92a3fd))),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 60, right: 60, top: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "PFIZER",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          (e.get("pfizer"))
                                              ? Text("Tersedia",
                                                  style: TextStyle(
                                                      color: Color(0xff44CCC5)))
                                              : Text("Tidak Tersedia",
                                                  style: TextStyle(
                                                      color:
                                                          Color(0xff92a3fd))),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 60, right: 60, top: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "SINOPHARM",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          (e.get("sinopharm"))
                                              ? Text("Tersedia",
                                                  style: TextStyle(
                                                      color: Color(0xff44CCC5)))
                                              : Text("Tidak Tersedia",
                                                  style: TextStyle(
                                                      color:
                                                          Color(0xff92a3fd))),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              .toList())
                      : Text("Loading...");
                })
          ],
        ));
  }
}

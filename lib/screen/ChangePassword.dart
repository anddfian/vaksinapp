part of 'screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final textFieldFocusNode = FocusNode();
  final textFieldFocusNode2 = FocusNode();
  final textFieldFocusNode3 = FocusNode();
  bool _obscured = true;
  bool _obscured2 = true;
  bool _obscured3 = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  void _toggleObscured2() {
    setState(() {
      _obscured2 = !_obscured2;
      if (textFieldFocusNode2.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode2.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  void _toggleObscured3() {
    setState(() {
      _obscured3 = !_obscured3;
      if (textFieldFocusNode3.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode3.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  "Ganti Password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff44CCC5),
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
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: _obscured,
                              focusNode: textFieldFocusNode,
                              cursorColor: Color.fromARGB(255, 0, 0, 0),
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: "Password Lama",
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 94, 91, 91)
                                        .withOpacity(0.5)),
                                prefixIcon: Icon(Icons.lock_rounded, size: 24),
                                suffixIcon: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                  child: GestureDetector(
                                    onTap: _toggleObscured,
                                    child: Icon(
                                      _obscured
                                          ? Icons.visibility_off_rounded
                                          : Icons.visibility_rounded,
                                      size: 24,
                                    ),
                                  ),
                                ),
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
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: _obscured2,
                              focusNode: textFieldFocusNode2,
                              cursorColor: Color.fromARGB(255, 0, 0, 0),
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: "Password Baru",
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 94, 91, 91)
                                        .withOpacity(0.5)),
                                prefixIcon: Icon(Icons.lock_rounded, size: 24),
                                suffixIcon: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                  child: GestureDetector(
                                    onTap: _toggleObscured2,
                                    child: Icon(
                                      _obscured2
                                          ? Icons.visibility_off_rounded
                                          : Icons.visibility_rounded,
                                      size: 24,
                                    ),
                                  ),
                                ),
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
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: _obscured3,
                              focusNode: textFieldFocusNode3,
                              cursorColor: Color.fromARGB(255, 0, 0, 0),
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: "Konfirmasi Password Baru",
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 94, 91, 91)
                                        .withOpacity(0.5)),
                                prefixIcon: Icon(Icons.lock_rounded, size: 24),
                                suffixIcon: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                  child: GestureDetector(
                                    onTap: _toggleObscured3,
                                    child: Icon(
                                      _obscured3
                                          ? Icons.visibility_off_rounded
                                          : Icons.visibility_rounded,
                                      size: 24,
                                    ),
                                  ),
                                ),
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
                margin: EdgeInsets.only(top: 305),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: ((context) => MainPage2()),
                    //     ));
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(99))),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Color(0xff46DFD8), Color(0xff44CCC5)]),
                        borderRadius: BorderRadius.circular(99)),
                    child: Container(
                      width: 315,
                      height: 60,
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 107, right: 12),
                              child: Icon(Icons.login)),
                          const Text(
                            'Ganti',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
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

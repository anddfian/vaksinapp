part of 'screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final textFieldFocusNode = FocusNode();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _obscured = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: ListView(
          children: [
            Column(children: [
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Text(
                  "Hallo",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff46DFD8),
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 2, bottom: 30),
                child: Text(
                  "Selamat Datang Kembali",
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
                                prefixIcon: Container(
                                    child: Icon(
                                  Icons.mail,
                                )),
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
                                hintText: "Password",
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
              Container(
                margin: EdgeInsets.only(top: 390),
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text);
                      Navigator.pop(context);
                      if(emailController.text == "andd.fian@gmail.com") {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => FaskesListScreen()),
                            ));
                      } else {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => StaffFaskesScreen()),
                            ));
                      }
                    } on FirebaseAuthException catch (e) {
                      showNotification(context, e.message.toString());
                    }
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
                            'Masuk',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ));
  }

  void showNotification(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Color(0xff44CCC5), content: Text(message.toString())));
  }
}

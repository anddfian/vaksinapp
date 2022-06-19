part of 'screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 163),
              child: Image.asset(
                "assets/Landing.png",
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 200),
              child: ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signInAnonymously();
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (_) {
                      return HomeScreen();
                    },
                  ));
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
                          margin: EdgeInsets.only(left: 120, right: 12),
                        ),
                        const Text(
                          'Mulai',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
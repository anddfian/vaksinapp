part of 'screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    splashScreenStart();
    super.initState();
  }

  splashScreenStart() {
    var duration = Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return StreamBuilder<User?>(
            stream: FirebaseAuth.instance.userChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if(FirebaseAuth.instance.currentUser!.isAnonymous) {
                  return HomeScreen();
                } else if(FirebaseAuth.instance.currentUser?.email == "andd.fian@gmail.com") {
                  return FaskesListScreen();
                } else {
                  return StaffFaskesScreen();
                }
              } else {
                return LandingScreen();
              }
            });
      }));
    });
  }

  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/Splash.png",fit: BoxFit.contain, height: tinggi, width: lebar,
        ),
      ),
    );
  }
}

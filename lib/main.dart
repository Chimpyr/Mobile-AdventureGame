import 'package:SinbadsAdventure/pages/question1.dart';
import 'barrel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) async {
    runApp(Phoenix(child: MyApp()));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);

          return MaterialApp(
              title: "Sinbad's Adventure",
              initialRoute: '/home',
              routes: {
                '/home': (context) => const MyHomePage(),
                '/settings': (context) => const Settings(),
                '/q1': (context) => const Question1(),
                '/r1': (context) => const Route1(),
                '/r2': (context) => const Route2(),
                '/r3': (context) => const Route3(),
                '/r4': (context) => const Route4(),
                '/r5': (context) => const Route5(),
                '/e1': (context) => const Ending1(),
                '/e2': (context) => const Ending2(),
                '/e3': (context) => const Ending3(),
                '/e4': (context) => const Ending4(),
              },
              themeMode: themeProvider.themeMode,
              debugShowCheckedModeBanner: false,
              theme: MyThemes.lightTheme,
              darkTheme: MyThemes.darkTheme,
              home: const MyHomePage());
        },
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: non_constant_identifier_names
  void StartGame() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    Navigator.pushNamed(context, '/q1');
  }

  @override
  void initState() {
    super.initState();
    //I need init to complete before I can fetch the highscores from the preferences
    //this allows it to be initialized and the values wont be null even when async
    init().whenComplete(() {
      setState(() {
        setHighScore();
      });
    });

    //reset the score
    globalScore = 0;
  }

  late SharedPreferences preferences;
  Future init() async {
    preferences = await SharedPreferences.getInstance();
  }

  void setHighScore() async {
    setState(() {
      int highScoreFromPrefs;
      highScoreFromPrefs = preferences.getInt(keyHighscore)!;
      globalHighScore = highScoreFromPrefs;
    });
  }

  Future<void> initializePreference() async {
    preferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/bg_blur2.png'), fit: BoxFit.cover)),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                    image: AssetImage('assets/logo_crop.png'),
                    fit: BoxFit.scaleDown),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(
                    child: GlassMorphism(
                      blur: 15,
                      opacity: 0.2,
                      child: SizedBox(
                        width: screenWidth * 0.8,
                        height: 150,
                        child: FittedBox(
                          child: const Center(
                              child: Text('START',
                                  style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                    letterSpacing: 30,
                                  ))),
                        ),
                      ),
                    ),
                    onTap: StartGame,
                  ),
                ),
                Text('HIGH SCORE: $globalHighScore',
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                        color: Colors.white))
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.settings),
        backgroundColor: Colors.blue[300],
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.pushNamed(context, '/settings');
        },
      ),
    );
  }
}

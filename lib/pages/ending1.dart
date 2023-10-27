import 'package:SinbadsAdventure/barrel.dart';

class Ending1 extends StatefulWidget {
  const Ending1({Key? key}) : super(key: key);

  @override
  State<Ending1> createState() => _Ending1State();
}

class _Ending1State extends State<Ending1> {
  void restartGame() {
    highScoreCheck();
    //rebuilds app on application level
    Phoenix.rebirth(context);
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  }

  launchWhatsApp() async {
    const link = WhatsAppUnilink(
      //would use contact picker to share with instead
      phoneNumber: '+44-0000000000',
      text: "Test message sending through flutter application",
    );
    await launch('$link');
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Ending 1"),
          backgroundColor: Colors.blue[300],
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
                icon: const Icon(Icons.settings))
          ],
        ),
        body: OrientationBuilder(builder: (context, orientation) {
          final screenWidth = MediaQuery.of(context).size.width;

          return Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/bg_blur2.png'),
                    fit: BoxFit.cover)),
            constraints: const BoxConstraints.expand(),
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                const Text(
                  'You Won',
                  style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: InkWell(
                    child: GlassMorphism(
                      blur: 15,
                      opacity: 0.2,
                      child: SizedBox(
                        width: screenWidth * 0.8,
                        height: screenWidth * 0.2,
                        child: const Center(
                            child: Text('RESTART',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                  letterSpacing: 10,
                                ))),
                      ),
                    ),
                    onTap: restartGame,
                  ),
                ),
                Text('Score : $globalScore',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      letterSpacing: 5,
                    )),
                //make this update befor it is displayed to the user
                Text('High Score : $globalHighScore',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      letterSpacing: 5,
                    )),

                const Flexible(
                    child: Image(
                        image: AssetImage('assets/trophyAsset1.png'),
                        fit: BoxFit.cover)),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          );
        }),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.share),
          backgroundColor: Colors.blue[300],
          foregroundColor: Colors.white,
          onPressed: () {
            launchWhatsApp();
            //Navigator.pushNamed(context, '/');
          },
        ),
      ),
      onWillPop: () async => false,
    );
  }
}

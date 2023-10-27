import 'package:SinbadsAdventure/barrel.dart';

class Ending4 extends StatefulWidget {
  const Ending4({Key? key}) : super(key: key);

  @override
  State<Ending4> createState() => _Ending4State();
}

class _Ending4State extends State<Ending4> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

  late int highScore;
  void restartGame() {
    highScoreCheck();
    //rebuilds app on application level
    Phoenix.rebirth(context);
    //reset to portrait mode
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Ending 4"),
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
          final screenHeight = MediaQuery.of(context).size.height;
          return Center(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/bg_blur2.png'),
                      fit: BoxFit.cover)),
              constraints: const BoxConstraints.expand(),
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Row(
                  children: [
                    Column(
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
                                width: screenWidth * 0.4,
                                height: screenWidth * 0.1,
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
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Score : $globalScore',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              letterSpacing: 5,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'High Score : $globalHighScore',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              letterSpacing: 5,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              height: screenHeight * 0.4,
                              width: screenWidth * 0.4,
                              child: const Image(
                                image: AssetImage('assets/trophyAsset3.png'),
                                fit: BoxFit.contain,
                              )),

                          // child: Flexible(
                          //     child: Image(
                          //         image: AssetImage('assets/trophyAsset4.png'),
                          //         fit: BoxFit.cover,)),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            ),
          );
        }),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.share),
          backgroundColor: Colors.blue[300],
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
      ),
      onWillPop: () async => false,
    );
  }
}

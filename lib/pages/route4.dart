import 'package:SinbadsAdventure/barrel.dart';
import 'package:shake/shake.dart';
import 'dart:async';
// import 'package:audioplayers/audioplayers.dart';

class Route4 extends StatefulWidget {
  const Route4({Key? key}) : super(key: key);

  @override
  State<Route4> createState() => _Route4State();
}

class _Route4State extends State<Route4> {
  late ShakeDetector _detector;

  // static var player = AudioPlayer();
  // static var cache = AudioCache();
  static const soundPath = "earthquake.mp3";

  // void _playFile() async {
  //   player = await cache.play(soundPath);
  // }

  // void _stopFile() {
  //   player.stop();
  // }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    //starts the timer on first initial state
    Type2Timer();
    startTimer();
    // //plays a sound on start
    // _playFile();

    //for the use of detecting when the device is shaken
    _detector = ShakeDetector.autoStart(onPhoneShake: () {
      setState(() {}); // Call setState every time phone shakes.
    });
  }

  //using timer to decide if user has shaken within timeframe
  late Timer _timer;
  int _start = 5;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  // ignore: non_constant_identifier_names
  void Type2Timer() {
    Timer(const Duration(seconds: 5), () {
      if (_detector.mShakeCount > 0) {
        // _stopFile();
        //positive outcome, user has completed task
        Navigator.pushNamed(context, '/e2');
        globalScore = globalScore + 5;
        highScoreCheck();
      } else {
        //user has not shaken the device to win
        // _stopFile();
        Navigator.pushNamed(context, '/e3');
        globalScore = globalScore + 1;
        highScoreCheck();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text("Route 4"),
          backgroundColor: Colors.blue[300],
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
                icon: const Icon(Icons.settings))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              children: [
                const StandardImage(imageLocation: 'imageEarthQuake.png'),
                const Text(
                  'Shake the device within 5 seconds to survive!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Count: ${_detector.mShakeCount} Time Remaining!: $_start',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          ),
        ),
      ),
      onWillPop: () async => false,
    );
  }
}

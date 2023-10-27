import 'dart:async';
import 'package:SinbadsAdventure/barrel.dart';

class Route5 extends StatefulWidget {
  const Route5({Key? key}) : super(key: key);

  @override
  State<Route5> createState() => _Route5State();
}

class _Route5State extends State<Route5> {
  //confirm the choice of the slider value, this will change the route accordingly
  // ignore: non_constant_identifier_names

  @override
  void initState() {
    super.initState();
    timer();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp
    ]);
  }

  void timer() {
    Timer(const Duration(seconds: 5), () {
      print("This line is printed after 5 seconds");
      if (MediaQuery.of(context).orientation == Orientation.landscape) {
        //positive outcome, user has completed task of changing orientation

        print('landscape is what you are');
        globalScore = globalScore + 5;
        highScoreCheck();
        Navigator.pushNamed(context, '/e4');
      } else {
        //user has not changed orientation the device to win

        print('portrait is what you are');
        globalScore = globalScore + 1;
        highScoreCheck();
        Navigator.pushNamed(context, '/e3');
      }
    });
  }

  int? newScore = getScore();
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text("Route 5"),
          backgroundColor: Colors.blue[300],
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
                icon: const Icon(Icons.settings))
          ],
        ),
        body: OrientationBuilder(
          builder: (context, orientation) {
            final screenHeight = MediaQuery.of(context).size.height;
            return Container(
              constraints: const BoxConstraints.expand(),
              padding: orientation == Orientation.portrait
                  ? EdgeInsets.all(8)
                  : EdgeInsets.all(0),
              child: Column(
                children: [
                  orientation == Orientation.portrait
                      ? Flexible(
                          flex: orientation == Orientation.portrait ? 1 : 0,
                          child: Text(
                            orientation == Orientation.portrait
                                ? 'Attack Successful now Finish Him'
                                : '',
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : const SizedBox(),
                  orientation == Orientation.portrait
                      ? Flexible(
                          flex: orientation == Orientation.portrait ? 5 : 10,
                          child: StandardImage(
                              imageLocation: orientation == Orientation.portrait
                                  ? 'imageOrientationP.png'
                                  : 'imageOrientationL.png'),
                        )
                      : const Flexible(
                          child: Image(
                              image: AssetImage('assets/imageOrientationL.png'),
                              fit: BoxFit.scaleDown),
                        ),
                  // SizedBox(
                  //   height: screenHeight * 0.1,
                  // ),
                  orientation == Orientation.portrait
                      ? Flexible(
                          flex: 1,
                          child: Text(
                            orientation == Orientation.portrait
                                ? 'Orientate the Device to Swing'
                                : 'Enemy Slain',
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : const SizedBox(),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            );
          },
        ),
      ),
      onWillPop: () async => false,
    );
  }
}

import 'package:SinbadsAdventure/barrel.dart';

class Route3 extends StatefulWidget {
  const Route3({Key? key}) : super(key: key);

  @override
  State<Route3> createState() => _Route3State();
}

class _Route3State extends State<Route3> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text("Route 3"),
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
            child: GestureDetector(
              onHorizontalDragEnd: (DragEndDetails details) {
                if (details.primaryVelocity! < 0) {
                  // User swiped Left
                  print('swipe left');
                  globalScore = globalScore + 5;
                  highScoreCheck();
                  Navigator.pushNamed(context, '/e1');
                } else if (details.primaryVelocity! > 0) {
                  // User swiped Right
                  print('swipe right');
                  globalScore = globalScore + 3;
                  highScoreCheck();
                  //should be e2 now
                  Navigator.pushNamed(context, '/e2');
                }
              },
              child: Column(
                children: [
                  const StandardImage(imageLocation: 'imageSecondaryMagic.jpg'),
                  //the gesture detector will be used to determine where the user has swiped, and navigate accordingly
                  Row(
                    children: const [
                      Text('Sun Explosion',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          )),
                      Text('Lighting Storm',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          )),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                  const Text('Swipe Secondary Move',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                      )),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
            ),
          ),
        ),
      ),
      onWillPop: () async => false,
    );
  }
}

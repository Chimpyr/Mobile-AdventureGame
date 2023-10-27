import 'package:SinbadsAdventure/barrel.dart';

class Route2 extends StatefulWidget {
  const Route2({Key? key}) : super(key: key);

  @override
  State<Route2> createState() => _Route2State();
}

class _Route2State extends State<Route2> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  }

  double _value = 5;

  //confirm the choice of the slider value, this will change the route & add score accordingly
  void confirmChoice() {
    if (_value >= 5) {
      Navigator.pushNamed(context, '/r4');
      globalScore = globalScore + 3;
      highScoreCheck();
    } else {
      Navigator.pushNamed(context, '/r5');
      globalScore = globalScore + 5;
      highScoreCheck();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text("Route 2"),
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
          child: Column(
            children: [
              const StandardImage(imageLocation: 'imageMeleePower2.png'),
              const Text('Strength of Attack',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                  )),
              Slider(
                min: 0.0,
                max: 10.0,
                value: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value;
                    //print(_value);
                  });
                },
              ),
              ElevatedButton(
                child: const Text('Confirm Choice'),
                onPressed: confirmChoice,
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue[300]),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(25)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 25))),
              ),

              //This row fixes center issues, so it will stay
              Row(
                children: [],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
      ),
      onWillPop: () async => false,
    );
  }
}

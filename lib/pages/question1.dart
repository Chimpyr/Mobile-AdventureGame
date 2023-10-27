import 'package:SinbadsAdventure/barrel.dart';

class Question1 extends StatefulWidget {
  const Question1({Key? key}) : super(key: key);

  @override
  State<Question1> createState() => _Question1State();
}

class _Question1State extends State<Question1> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text("Sinbad's Adventure"),
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
              const StandardImage(imageLocation: 'imageMagic.png'),
              const Text('Choose Your Weapon',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                  )),
              //the use of buttons will be the way that the user navigages
              Row(
                children: const [
                  TextButtonsNew(
                    text: 'Magic',
                    navigate: 'r1',
                    addScore: 5,
                  ),
                  TextButtonsNew(
                    text: 'Melee',
                    navigate: 'r2',
                    addScore: 3,
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}

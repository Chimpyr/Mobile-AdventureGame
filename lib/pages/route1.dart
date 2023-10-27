import 'package:SinbadsAdventure/barrel.dart';

class Route1 extends StatefulWidget {
  const Route1({Key? key}) : super(key: key);

  @override
  State<Route1> createState() => _Route1State();
}

class _Route1State extends State<Route1> {
  // ignore: non_constant_identifier_names
  String ChosenSpell = 'Serendib Djinn';

  //this callback gathers information from the Selection Box's widget
  callback(varSpell) {
    setState(() {
      ChosenSpell = varSpell;
      //print(ChosenSpell);
    });
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    //this function is called when the confirmation button is pressed, the statement decides..
    //..where to navigate the user depending on selection in ComboBox
    void confirmChoice() {
      Navigator.pushNamed(context, '/settings');
      switch (ChosenSpell) {
        case "Serendib Djinn":
          {
            Navigator.pushNamed(context, '/r3');
            globalScore = globalScore + 5;
            highScoreCheck();
          }
          break;
        case "Metamorphosis":
          {
            Navigator.pushNamed(context, '/r3');
            globalScore = globalScore + 5;
            highScoreCheck();
          }
          break;
        case "Jeweled Bird":
          {
            Navigator.pushNamed(context, '/r4');
            globalScore = globalScore + 3;
            highScoreCheck();
          }
          break;
        case "City of Brass":
          {
            Navigator.pushNamed(context, '/r4');
            globalScore = globalScore + 3;
            highScoreCheck();
          }
          break;
      }
    }

    return new WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text("Route 1"),
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
              //display the image
              const StandardImage(imageLocation: 'cosmicFlower.jpg'),
              //display the image
              const Text('Select Your Spell',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                  )),
              CustomSelectBox(t_callback: callback),

              //This row fixes center issues, so it will stay
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: confirmChoice,
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue[300]),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(15)),
                          textStyle: MaterialStateProperty.all(
                            const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w300),
                          ),
                        ),
                        child: Text(
                          'Confirm Choice $ChosenSpell',
                          textAlign: TextAlign.center,
                        )),
                  ),
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
      onWillPop: () async => false,
    );
  }
}

//this widget is for the selection box itself
class CustomSelectBox extends StatefulWidget {
  // ignore: non_constant_identifier_names
  const CustomSelectBox({Key? key, required this.t_callback}) : super(key: key);
  // ignore: non_constant_identifier_names
  final Function t_callback;

  @override
  State<CustomSelectBox> createState() => _CustomSelectBoxState();
}

class _CustomSelectBoxState extends State<CustomSelectBox> {
  String dropdownValue = 'Serendib Djinn';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 0,
      dropdownColor: Colors.grey[200],
      autofocus: true,
      style: const TextStyle(
          fontSize: 30, fontWeight: FontWeight.w300, color: Colors.blue),
      underline: Container(
        height: 2,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
          widget.t_callback(dropdownValue);
        });
      },
      items: <String>[
        'Serendib Djinn',
        'Metamorphosis',
        'Jeweled Bird',
        'City of Brass'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
          ),
        );
      }).toList(),
    );
  }
}

//void callback(String dropdownValue) {}

import 'package:SinbadsAdventure/barrel.dart';

class Route1 extends StatefulWidget {
  const Route1({Key? key}) : super(key: key);

  @override
  State<Route1> createState() => _Route1State();
}

class _Route1State extends State<Route1> {
  @override
  Widget build(BuildContext context) {
    //String Rvalue = ComboValues().sendValue();

    void confirmChoice() {
      //String theRvalue = const CustomSelectBox().dropdownValue;
      String theRValue = Try5().theValue;
      print(theRValue);
      Navigator.pushNamed(context, '/settings');
      switch ('') {
        case "A":
          {}
          break;
      }
    }

    String theRvalue = Try5().theValue;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Sinbad's Adventure"),
        backgroundColor: Colors.blue[300],
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const QuestionImage(imageLocation: 'image.jpg'),
            const Text('Select Your Spell',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w300,
                )),
            const CustomSelectBox(),

            //This row fixes center issues, so it will stay
            Row(
              children: [
                ElevatedButton(
                    onPressed: Try5().workPlease,
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue[300]),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(15)),
                      textStyle: MaterialStateProperty.all(
                        const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w300),
                      ),
                    ),
                    child: Text(
                      'Confirm Choice $theRvalue',
                    )),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }
}

class CustomSelectBox extends StatefulWidget {
  const CustomSelectBox({Key? key}) : super(key: key);

  @override
  State<CustomSelectBox> createState() => _CustomSelectBoxState();

  final dropdownValue = 'Spell One';
}

// class ComboValues {
//   ComboValues([String this.value]);
//   final String value;
//   set value(importValue) {
//     value = importValue;
//   }

//   String sendValue() {
//     return value;
//   }
// }

class Try5 {
  late String theValue = 'Spell 1';
  //late String theValue ;

  void changeD(value) {
    this.theValue = value;
    //print('the value $value');
    print('the thisValue $theValue');
  }

  void workPlease() {
    //String theRvalue = const CustomSelectBox().dropdownValue;
    String theRValue = Try5().theValue;
    print(theRValue);
  }
}

class _CustomSelectBoxState extends State<CustomSelectBox> {
  String dropdownValue = 'Spell One';
  // String get newValue {
  //   return dropdownValue;
  // }
  // void setTheVal() {
  //   ComboValues(dropdownValue);
  // }

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
          //setTheVal;
          Try5().changeD(dropdownValue);
          print(Try5().theValue.toString());
        });
      },
      items: <String>['Spell One', 'Spell Two', 'Spell Three', 'Spell Four']
          .map<DropdownMenuItem<String>>((String value) {
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

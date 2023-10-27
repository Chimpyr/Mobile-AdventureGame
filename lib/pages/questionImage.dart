import 'package:SinbadsAdventure/barrel.dart';

//For generating the image view, using constructors to get the image
class QuestionImage extends StatelessWidget {
  final String imageLocation;
  const QuestionImage({Key? key, required this.imageLocation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final assetLocation = 'assets/$imageLocation';
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return GlassMorphism(
      blur: 15,
      opacity: 0.2,
      child: SizedBox(
        width: screenWidth * 0.8,
        height: screenHeight * 0.5,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0),
          child: Center(
              child:
                  Image(image: AssetImage(assetLocation), fit: BoxFit.cover)),
        ),
      ),
    );
  }
}

class StandardImage extends StatelessWidget {
  final String imageLocation;
  const StandardImage({Key? key, required this.imageLocation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final assetLocation = 'assets/$imageLocation';
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.8,
      margin: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image(image: AssetImage(assetLocation), fit: BoxFit.cover),
      ),
    );
  }
}

//Text type
class TextButtonsNew extends StatelessWidget {
  final String text;
  final String navigate;
  final int addScore;
  const TextButtonsNew(
      {Key? key,
      required this.text,
      required this.navigate,
      required this.addScore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    void set() {
      Navigator.pushNamed(context, '/$navigate');
      globalScore = globalScore + addScore;
      //increaseScore(addScore);
    }

    return ElevatedButton(
      child: Text(text),
      onPressed: set,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue[300]),
          padding: MaterialStateProperty.all(const EdgeInsets.all(25)),
          textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 30))),
    );
  }
}

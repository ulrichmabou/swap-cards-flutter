import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

// constants
const kAppBarTextStyle = TextStyle(
  color: Color(0xFF570000),
  fontSize: 25,
  fontWeight: FontWeight.bold,
);

const kSideCountTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

class CardsLoader extends StatefulWidget {
  @override
  _CardsLoaderState createState() => _CardsLoaderState();
}

class _CardsLoaderState extends State<CardsLoader>
    with TickerProviderStateMixin {
  int cardsNum = 10;
  int stackNum = 5;
  int leftCount = 0;
  int rightCount = 0;

  List<String> welcomeImages = [
    "assets/welcome0.png",
    "assets/welcome1.png",
    "assets/welcome2.png",
    "assets/welcome2.png",
    "assets/welcome1.png",
    "assets/welcome1.png",
    "assets/welcome0.png",
    "assets/welcome1.png",
    "assets/welcome2.png",
    "assets/welcome1.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        title: Text(
          'Swipe Cards',
          style: kAppBarTextStyle,
        ),
        backgroundColor: Color(0xFFDDA448),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.redAccent,
                    child: Center(
                      child: Text(
                        'Left: $leftCount',
                        style: kSideCountTextStyle,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.greenAccent,
                    child: Center(
                      child: Text(
                        'Right: $rightCount',
                        style: kSideCountTextStyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: TinderSwapCard(
                  orientation: AmassOrientation.BOTTOM,
                  totalNum: cardsNum,
                  stackNum: stackNum,
                  swipeEdge: 4.0,
                  maxWidth: MediaQuery.of(context).size.width * 0.9,
                  maxHeight: MediaQuery.of(context).size.width * 0.9,
                  minWidth: MediaQuery.of(context).size.width * 0.8,
                  minHeight: MediaQuery.of(context).size.width * 0.8,
                  cardBuilder: (context, index) => Card(
                        child: Image.asset('${welcomeImages[index]}'),
                      ),
                  swipeCompleteCallback:
                      (CardSwipeOrientation orientation, int index) {
                    if (orientation == CardSwipeOrientation.LEFT) {
                      setState(() {
                        leftCount++;
                      });
                      print(
                          'User swipped left for card at index $index and the left count is $leftCount');
                    } else if (orientation == CardSwipeOrientation.RIGHT) {
                      setState(() {
                        rightCount++;
                      });
                      print(
                          'User swipped right for card at index $index and the right count is $rightCount');
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

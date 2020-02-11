import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class CardsLoader extends StatefulWidget {
  @override
  _CardsLoaderState createState() => _CardsLoaderState();
}

class _CardsLoaderState extends State<CardsLoader>
    with TickerProviderStateMixin {
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
      appBar: AppBar(
        title: Text('Swap Cards'),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          child: TinderSwapCard(
              orientation: AmassOrientation.BOTTOM,
              totalNum: 5,
              stackNum: 3,
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
                  print('User swipped left for card at index $index');
                } else if (orientation == CardSwipeOrientation.RIGHT) {
                  print('User swipped right for card at index $index');
                }
              }),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'dart:math';

void main() => runApp(new MyApp());

  class MyApp extends StatefulWidget {
    static final style = TextStyle(
      fontSize: 30,
      fontFamily: "Billy",
      fontWeight: FontWeight.w600,
    );
    @override
    _MyAppState createState() => _MyAppState();
  }

  class _MyAppState extends State<MyApp> {

    int page = 0;
    LiquidController liquidController;
    UpdateType updateType;

    @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  final pages = [
    Container(
      color: Colors.pink,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1611605877189-b9743c2ef324?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
            fit: BoxFit.cover,),
          Padding(
              padding: const EdgeInsets.all(20.0)
          ),
          Column(
            children: [
              Text(
                'Hi',
                style: MyApp.style,
              ),
              Text(
                "It's me",
                style: MyApp.style,
              ),
              Text(
                "Bulbul",
                style: MyApp.style,
              )
            ],
          )
        ],
      ),
    ),
    Container(
      color: Colors.deepPurpleAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network('https://images.unsplash.com/photo-1611605877189-b9743c2ef324?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
          fit: BoxFit.cover,
          ),
          Padding(
              padding: const EdgeInsets.all(20.0)
          ),
          Column(
            children: [
              Text(
                'Take a',
                style: MyApp.style,
              ),
              Text(
                "Look at",
                style: MyApp.style,
              ),
              Text(
                "Liquid swipe",
                style: MyApp.style,
              )
            ],
          )
        ],
      ),
    ),
    Container(
      color: Colors.greenAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network('https://images.unsplash.com/photo-1611605877189-b9743c2ef324?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
            fit: BoxFit.cover,
          ),
          Padding(
              padding: const EdgeInsets.all(20.0)
          ),
          Column(
            children: [
              Text(
                'Liked ?',
                style: MyApp.style,
              ),
              Text(
                "Fork",
                style: MyApp.style,
              ),
              Text(
                "Give star",
                style: MyApp.style,
              )
            ],
          )
        ],
      ),
    ),
    Container(
      color: Colors.yellowAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network('https://images.unsplash.com/photo-1611605877189-b9743c2ef324?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
            fit: BoxFit.cover,
          ),
          Padding(
              padding: const EdgeInsets.all(20.0)
          ),
          Column(
            children: [
              Text(
                'can be',
                style: MyApp.style,
              ),
              Text(
                "Used for",
                style: MyApp.style,
              ),
              Text(
                "OnBoarding Screen",
                style: MyApp.style,
              )
            ],
          )
        ],
      ),
    ),
    Container(
      color: Colors.redAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network('https://images.unsplash.com/photo-1611605877189-b9743c2ef324?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
            fit: BoxFit.cover,
          ),
          Padding(
              padding: const EdgeInsets.all(20.0)
          ),
          Column(
            children: [
              Text(
                'Do',
                style: MyApp.style,
              ),
              Text(
                "Try it!!",
                style: MyApp.style,
              ),
              Text(
                "Thank You",
                style: MyApp.style,
              )
            ],
          )
        ],
      ),
    ),
  ];
    Widget _buildDot(int index) {
      double selectedness = Curves.easeOut.transform(
        max(
          0.0,
          1.0 - ((page ?? 0) - index).abs(),
        ),
      );
      double zoom = 1.0 + (2.0 - 1.0) * selectedness;
      return new Container(
        width: 25.0,
        child: new Center(
          child: new Material(
            color: Colors.white,
            type: MaterialType.circle,
            child: new Container(
              width: 8.0 * zoom,
              height: 8.0 * zoom,
            ),
          ),
        ),
      );
    }


    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          body: Stack(
            children: [
              LiquidSwipe(
                  pages: pages,
                onPageChangeCallback: pageChangeCallback,
                waveType: WaveType.liquidReveal,
                liquidController: liquidController,
                ignoreUserGestureWhileAnimating: true,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Expanded(child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(pages.length, _buildDot),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: FlatButton(
                    onPressed: (){
                      liquidController.animateToPage(
                        page: pages.length - 1,duration: 500
                      );
                    },
                    child: Text('Skip to End'),
                    color: Colors.white.withOpacity(0.01),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: FlatButton(
                    onPressed: (){
                      liquidController.jumpToPage(
                          page: liquidController.currentPage + 1
                      );
                    },
                    child: Text('Next'),
                    color: Colors.white.withOpacity(0.01),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    pageChangeCallback(int lPage){
      setState(() {
        page = lPage;
      });
    }
  }

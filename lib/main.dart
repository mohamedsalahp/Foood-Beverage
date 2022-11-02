import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedFood = 'BURGER';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 400.0,
              ),
              ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black, Colors.transparent])
                        .createShader(
                        Rect.fromLTRB(0, 0, rect.width, rect.height));
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset('assets/images/tokyo.jpg',
                      height: 300.0, fit: BoxFit.cover)),

              RotatedBox(quarterTurns: 3,
                child: Text('JAPAN',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                    fontSize: 75.0,
                    color: Colors.white.withOpacity(0.3),
                    letterSpacing: 3.0
                  ),
                ),
              ),
              Positioned(
                top: 4.0,
                right: 4.0,
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white),
                  child: Center(
                    child: Icon(Icons.menu_outlined),
                  ),
                ),
              ),
              Positioned(
                top: 2.0,
                right: 5.0,
                child: Container(
                  height: 12.0,
                  width: 12.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Color(0xFFFD3664)),
                ),
              ),
              Positioned(
                top: 180.0,
                left: 40.0,
                child: Column(
                  children: <Widget>[
                    Text('WELCOME TO',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w500,
                        fontSize: 32.0,
                        color: Colors.white),)
                  ],
                )),
              Positioned(
                top: 220.0,
                left: 40.0,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('TOKYO',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.bold,
                            fontSize: 50.0,
                            color: Color(0xFFFD3664)),
                        ),
                        Text(',',
                            style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 50.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        SizedBox(width: 10.0),
                        Text('JAPAN',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.bold,
                            fontSize: 50.0,
                            color: Colors.white)),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                top: 320.0,
                left: 25.0,
                right: 25.0,
                child: Container(
                  height: 55.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF262626),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                      topLeft: Radius.circular(15.0),
                    )
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Lets explore some food here...',
                      hintStyle: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 14.0,
                        color: Colors.grey),
                      contentPadding: EdgeInsets.only(top: 15.0),
                      prefixIcon: Icon(Icons.search, color: Colors.grey)),
                  ),
                ),
              ),
            ],
          ),

          // Get out of the stack for the options//

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildMenuItem('BURGER', Icons.fastfood),
              _buildMenuItem('TEA', Icons.local_drink),
              _buildMenuItem('BEER', Icons.local_drink),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildMenuItem('CAKE', Icons.cake),
              _buildMenuItem('COFFEE', Icons.cloud),
              _buildMenuItem('MEAT', Icons.restaurant),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildMenuItem('ICE', Icons.insert_chart),
              _buildMenuItem('FISH', Icons.filter_tilt_shift),
              _buildMenuItem('DONUTS', Icons.donut_small),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMenuItem(String foodName, iconData) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        selectedMenuOption(foodName);
      },
      child: AnimatedContainer(
        curve: Curves.easeIn,
        duration: Duration(milliseconds: 300),
        height: selectedFood == foodName ? 100.0 : 75.0,
        width: selectedFood == foodName ? 100.0 : 75.0,
        color: selectedFood == foodName ? Color(0xFFFD3566)  : Colors.transparent,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              iconData,
              color: selectedFood == foodName ? Colors.white : Colors.grey,
              size: 25.0,
            ),
            SizedBox(height: 12.0),
            Text(foodName,
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 10.0,
                color: selectedFood == foodName ? Colors.white : Colors.grey))
          ],
        ),
      ),
    );
  }

  selectedMenuOption(String foodName) {
    setState(() {
      selectedFood = foodName;
    });
  }
}














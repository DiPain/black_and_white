import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: travelHome(),
    );
  }

  Widget travelHome()=>Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          size: 30,),
          color: Colors.black,
          onPressed: (){}
      ),
      actions: <Widget>[
        Stack(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.notifications_none,
                size: 30,
                color: Colors.black,
              ),
              onPressed: (){},
            ),
            Positioned(
              top: 12,
              right: 10,
              child: Container(
                height: 12,
                width: 12,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            )
          ],
        ),        
      ],
    ),
    body: MyHomePage(),
    bottomNavigationBar: bottomBar(),
  );

  Widget bottomBar(){
    final List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ),
        title: Text(""),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.favorite
        ),
        title: Text(""),
      ),

      // cant put a stack here == help
      BottomNavigationBarItem(
        icon: Icon(
          Icons.sms,
        ),
        title: Text(""),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.person,

        ),
        
        title: Text(""),
      )
    ]; 

    return BottomNavigationBar(       
      items: items,
      onTap: (int index){},
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      iconSize: 30,
      type: BottomNavigationBarType.fixed,
      elevation: 30,     

    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {  
  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'Where are you going?',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 40,
                fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      
    );
  }
}

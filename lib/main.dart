import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// import 'package:black_and_white/src/hotels.dart';
import 'package:wallet_with_listbuilder/src/hotels.dart';

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
      elevation: 2,
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
        child: hotelList(),
      ),
      
    );
  }

  Widget hotelList()=>Container(
    child: ListView.builder(
      itemCount: Hotels.destList.length+1,
      itemBuilder: (BuildContext context, int index){
        if(index == 0){
          return Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 50,),
                  child: Text(
                    'Where are you going?',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                ),
                SizedBox(height: 30,),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blueAccent[080],
                    border: InputBorder.none,
                    hintText: 'E.g: New York, United States ',
                    prefixIcon: Icon(Icons.location_on),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 240,
                  child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int destIndex){
                      return Padding(
                        padding: EdgeInsets.only(top: 20,right: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 145,
                              height: 180,
                              color: Colors.blue,
                              child: Text(''),
                            ),
                            Text(Hotels.destList[destIndex][1]),
                            Text(Hotels.destList[destIndex][2]),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        else{
          return Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget> [
                Container(
                  height: 100,
                  width: 100,
                  child: Text(''),
                  color: Colors.blue,
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(Hotels.hotelList[index-1][1],
                      style: TextStyle(fontWeight: FontWeight.bold) ,),
                    Row(
                      children: <Widget>[
                        Icon(Icons.location_on,
                          color: Colors.grey,
                          size: 12,),
                        Text(Hotels.hotelList[index-1][2],
                          style: TextStyle(
                            color: Colors.grey),),
                      ],
                    ),
                    Text('\$'+Hotels.hotelList[index-1][3]+'/Night',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),),
                  ],
                )
              ],
            ),
          );
        }
      },
    ),
  );
  
}

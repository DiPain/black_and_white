import 'dart:ui' as prefix0;

import 'package:flutter/Material.dart';
import 'package:wallet_with_listbuilder/src/hotels.dart';

class Whi extends StatelessWidget{
  Color bod = Colors.white;
  Color txt = Colors.black;
  Whi(this.bod,this.txt);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: this.bod,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            size: 30,),
            color: txt,
            onPressed: (){}
        ),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.notifications_none,
                  size: 30,
                  color: txt,
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
      body: MyHomePage(bod,txt),
      bottomNavigationBar: bottomBar(),
    );
  }

  Widget bottomBar(){
    final List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ),
        title: Text("",
        style: TextStyle(
          fontSize: 0,),),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.favorite
        ),
        title: Text("",
        style: TextStyle(
          fontSize: 0,),),
      ),

      // cant put a stack here == help
      BottomNavigationBarItem(
        icon: Icon(
          Icons.sms,
        ),
        title: Text("",
        style: TextStyle(
          fontSize: 0,),),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.person,

        ),
        
        title: Text("",
        style: TextStyle(
          fontSize: 0,),),
      )
    ]; 

    return BottomNavigationBar(       
      items: items,
      onTap: (int index){},
      selectedItemColor: txt,
      unselectedItemColor: Colors.grey,
      iconSize: 30,
      type: BottomNavigationBarType.fixed,
      elevation: 30,     
      backgroundColor: bod,
    );
  }
}

class MyHomePage extends StatefulWidget {
  Color bod = Colors.white;
  Color txt = Colors.black;
  MyHomePage(this.bod,this.txt);

  @override
  _MyHomePageState createState() => _MyHomePageState(bod,txt);
}

class _MyHomePageState extends State<MyHomePage> {  
  Color bod = Colors.white;
  Color txt = Colors.black;
  _MyHomePageState(this.bod,this.txt);

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: Center(
        child: hotelList(),
      ),
    );
  }

  Widget hotelList()=>Container(
    color: bod,
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
                      color: this.txt,
                      ),
                    ),
                ),
                SizedBox(height: 30,),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blue[50],
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 145,
                              height: 180,
                              child: Image.asset(
                                Hotels.destList[destIndex][0],
                                fit: BoxFit.cover,
                                height: 180,
                                width: 145,
                              ),
                            ),
                            Text(Hotels.destList[destIndex][1],
                              style: TextStyle(
                                color: txt,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                ),),
                            Text(Hotels.destList[destIndex][2],
                              style: TextStyle(color: Colors.grey,),),
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
                  child: Image.asset(
                    Hotels.hotelList[index-1][0],
                    fit: BoxFit.cover,
                    height: 180,
                    width: 145,
                  ),
                  color: Colors.blue,
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(Hotels.hotelList[index-1][1],
                      style: TextStyle(fontWeight: FontWeight.bold,color: txt),),
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
                        fontSize: 15,
                        color: txt
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

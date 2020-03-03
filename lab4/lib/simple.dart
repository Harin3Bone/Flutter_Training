//! Package import
import 'package:flutter/material.dart';

//! Question 8 Lab 4
class SimpleTab extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {

    //# MaterialApp = 
    return MaterialApp(

      //? DefaultTabController
      home: DefaultTabController(

        //* Length = Length of Tab
        length: 3, 

        //* Scaffold = 
        child: Scaffold(

          //~ AppBar = AppBar require TabBar
          appBar: AppBar(

            //^ TabBar = TabBar require tabs
            bottom: TabBar(

              //^ Tab = Tab array sync with TabBarView (tabs[0] sync TabBarView[0])
              tabs:[
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),                
              ]  
            ),

            //^ Configuration TabBar Title
            title: Text('SimpleTab'),
          ),
          
          //~ TabBarView = View after you look for this tab -> Sync with AppBar
          body: TabBarView(
            children: <Widget>[
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
              ],
            ),
          )
        ),
    );
  }
}
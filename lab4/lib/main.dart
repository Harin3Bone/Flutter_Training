import 'package:flutter/material.dart';		
import 'package:lab4/simple.dart';
import 'package:lab4/form.dart';

//! Flutter Main
void main() => runApp(MyApp());		

//! Fluter MyApp (Is Main Section for run flutter)
class MyApp extends StatelessWidget {	  
  // This widget is the root of your application.	  
  @override	  
  Widget build(BuildContext context) {	    
    return MaterialApp(
      //? Default Flutter Template      
	      title: 'Flutter Demo',
        
	      // debugShowCheckedModeBanner: false,
	      // theme: ThemeData(
	      //   primarySwatch: Colors.teal,
	      // ),
	      // home: MyHomePage(),

      //--------------------------        

      //? Navigation route is configuration path
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/second' : (context) => SecondScreen(),
        '/third' : (context) => SimpleTab(),
        '/fourth' : (context) => MyCustomForm()
      },
	    );
	  }
	}
	
//! Sub class -> To configuration detail of page (Widget , Text , etc.)
class MyHomePage extends StatelessWidget {
	  @override
	  Widget build(BuildContext context) {
	    return Scaffold(

        //? appBar -> Header field on UI        
	      appBar: AppBar(
          //? appBar -> title = header of UI
	        title: Text('Hello World'),
	      ),	      

        //--------------------------        
        //# Center use for config child or children to be center of page
        // body: Center(
        //   child: Text('Hello World'),
        // )

        //--------------------------      
        //# You can use your class you made into body
        // body: YellowBird()
        
        //--------------------------                
        // body: Center(
        //   child: Text('Body'),
        // ),

        //# floationgActionButton = Circle Button
        // floatingActionButton: FloatingActionButton(

          //? Icon = image in circle button 
          // child: Icon(Icons.add),

          //? Text = text in circle button
          // child: Text('Text'), 

          //? onPressed = Create activity after user click button        
          // onPressed: (){},
          // ),

        //--------------------------
        //# Container is empty field -> can put widget into this
        body: Container(

          //? Row = horizontal line
          //? child can have widget or something only 1
          child : Row(

            //* mainAxisAlignment = Main axis -> make field in row or column to be start,end,center
            //* crossAxisAlignment = Sub axis -> make field in row or column to be start,end,center            
            mainAxisAlignment: MainAxisAlignment.center,

            //* children can have widget more than 1
            children: <Widget>[

              //~ Column = vertical line
              Column(
                mainAxisAlignment: MainAxisAlignment.center,

                //~ <dataType> [] = array of datatype 
                //~ <Widget>[] = array of widget -> in [] must be widget only
                children: <Widget>[

                  //^ RaiseButton is simple button 
                  RaisedButton(
                    child : Text('pushReplace'),

                    //^ onPressed is mean event after you do push button
                    // onPressed: () => print('One Click')

                    onPressed: (){
                      // Navigator.pushNamed(context, '/second');
                      Navigator.pushReplacementNamed(context, '/second');
                    },
                  ),                

                //~ Path to simple.dart 
                 RaisedButton(
                    child : Text('TabBar'),                    
                    onPressed: (){                      
                      Navigator.pushNamed(context, '/third');
                    },
                  ),

                //~ Path to form.dart
                //~ Path to simple.dart 
                 RaisedButton(
                    child : Text('Form'),                    
                    onPressed: (){                      
                      Navigator.pushNamed(context, '/fourth');
                    },
                  ),
                ],
              )
            ],
            )
        ),

        //--------------------------        
        // body : TabBarDemo()
        
	    );
	  }
	}

//! Sub Class => Config or make page for display
//! StatelessWidget = Page is not change anything => Static Page not have animation 
class GreenFrog extends StatelessWidget {
     @override
	    Widget build(BuildContext context) {
	    return Container(
        color: Colors.blue,
      );
	  }   
  }  

//! StatefulWidget = Page can be change something in time => Dynamic Page can be have animation
class YellowBird extends StatefulWidget {
  YellowBird({Key key}) : super(key: key);

  @override
  _YellowBirdState createState() => _YellowBirdState();
}

//! _ is final syntax in another programming language 
class _YellowBirdState extends State<YellowBird> {
  @override
  Widget build(BuildContext context) {
    return Container(
       color: Colors.yellow,
    );
  }
}

//! Lab4 Question 6
class TabBarDemo extends StatelessWidget {  
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
            title: Text('TabBarDemo'),
          ),
          
          //~ TabBarView = View after you look for this tab -> Sync with AppBar
          body: TabBarView(
            children: <Widget>[
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              // Icon(Icons.directions_bike),
              ],
            ),
          )
        ),
    );
  }
}

//! Lab Question 7 -> Stateful
class SecondScreen extends StatefulWidget {
  SecondScreen({Key key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Page One'),
       ),
       body: RaisedButton(
         child: Text('One'),
         onPressed: (){
           Navigator.pop(context);
         } )
    );
  }
}
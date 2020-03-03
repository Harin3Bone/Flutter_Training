import 'package:flutter/material.dart';
import 'package:lab6/pageA.dart';
import 'package:lab6/pageB.dart';
import 'homepage.dart';
import 'dart:io';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';


void main() => runApp(MyHome());

class MyHome extends StatelessWidget {
  final appTitle = 'Example Form';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      initialRoute: '/',
      routes: {
        '/homepage': (context) => Homepage(),
        '/pageA': (context) => ProfilePage(),
        '/pageB': (context) => SettingPage()
      },
      home: MyApp(title: appTitle),
    );
  }
}

class MyApp extends StatelessWidget {
  final String title;
  MyApp({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      //! Add Drawer
      drawer: Drawer(
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color : Colors.blue,
                ),
                ),
                ListTile(
                  title:Text('Profile'),
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/pageA');
                  }
                ),
                ListTile(
                  title: Text('Setting'),
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/pageB');
                  },
                ),
            ],
          ),
        )),
      body: Center(
          child: ListView(children: <Widget>[
        MyRadio(),
      ])),
    );
  }
}


class MyRadio extends StatefulWidget {
  MyRadio({Key key}) : super(key: key);

  @override
  _MyRadioState createState() => _MyRadioState();
  
}

class _MyRadioState extends State<MyRadio> {    
  //! Create local variable to use in -> InputDecorator
  // List<String> provinces = ['','BKK','Outbound'];
  List<String> provinces = ['BKK','Pathumthani','Outbound'];
  String province = 'BKK';
  
  //! Checkbox widget create
  bool checkboxValueA = true;
  bool checkboxValueB = true;

  //! variable declare
  // int route;
  String sex;

  @override
  Widget build(BuildContext context) {
    return Container(
      //! EdgeInsets = padding 
        //? symmetric vertical    -> padding Top  Bottom
        //? symmetric horizontal  -> padding Left Right 
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(children: [
              //# Male Radio Button                            
              radioMaleMethod(),

              Text('Male'),            

              //# Female Radio Button
              radioFemaleMethod(),

              Text('Female'),
            ]),

            Row(children: [
              Text('$sex'),              
            ]),

            Row(children: [
              //# Checkbox A 
              checkboxAMethod(),

              Text('Checkbox A'),

              //# Checkbox B
              checkboxBMethod(),
                
              Text('Checkbox B'),              

            ]),            

            //# Dropdown
              buildSelectField()

          ]),
    );
  }

  Checkbox checkboxBMethod() {
    return Checkbox(
          value: checkboxValueB, 

          //! onChange = method ->
            //! true    = when checkbox is checked
            //! false   = when checkbox not checked 
          onChanged: (bool value){
            //? setState = change UI
            setState(() {
              checkboxValueB = value;
              print(checkboxValueB);
            });
          });
  }

  Checkbox checkboxAMethod() {
    return Checkbox(
              value: checkboxValueA, 

              //! onChange  = method -> 
                //! true    = when checkbox is checked
                //! false   = when checkbox not checked
              onChanged: (bool value){

                //? setState = change UI
                setState(() {
                  checkboxValueA = value;
                  print(checkboxValueA);
                });
              });
  }

  Radio<String> radioFemaleMethod() {
    return Radio(
              // value: 0,
              value: 'Female',
              groupValue: sex,
              onChanged: (value) {
                // _handleTapboxChanged(value);
                setState(() {
                  // route = value;
                  sex = value;
                });
              },
            );
  }

  Radio<String> radioMaleMethod() {
    return Radio(                
              // value: 1,
              value: 'Male',
              groupValue: sex,
              onChanged: (value) {
                setState(() {
                  // route = value;
                  sex = value;
                });
              },
            );
  }

  InputDecorator buildSelectField(){  
    return InputDecorator(
      decoration: InputDecoration(labelText: 'Province'),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value : province, 
          onChanged: (value){
            setState((){
              province = value;
            });
          },
          
          items: provinces
            .map(
              (value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              ),
            )

            //! 
            .toList(),
            )),
    );
  }

}



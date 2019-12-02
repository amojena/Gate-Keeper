import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'main.dart';

void main() => 
  runApp(MyPage());

class MyPage extends StatelessWidget{
    @override
    Widget build(BuildContext context){
      return MaterialApp(home: Page2());
    }
  }

  class Page2 extends StatelessWidget{

    @override
    Widget build(BuildContext context){
      return Scaffold(
          backgroundColor: Colors.blue[900],
          drawer: pageDrawer(context),
          appBar: GradientAppBar(
              backgroundColorStart: Colors.blue[900],
              backgroundColorEnd: Colors.cyan[700],
              title: new Align(
                alignment: Alignment.centerLeft,
                child: Text("Peak Times", style: TextStyle(fontSize: 30.0))
              )
          ),
          body: ListView (
            children: <Widget> [

              Padding(padding: EdgeInsets.all(2.0)),
              PeakTimeCard("Starting"),

              Padding(padding: EdgeInsets.all(2.0)),
              PeakTimeCard("Closing")

            ]
          ),
        );
    }

    Drawer pageDrawer(BuildContext context){
      return new Drawer(
          child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: HeadingText("Menu", FontWeight.bold),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft, end: Alignment.bottomRight,
                  colors: [Colors.blue[900], Colors.cyan[700]],
                )
              ),
            ),

            ListTile(
              title: Text('Home',
                style: TextStyle(fontSize: 30.0)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Peak Times',
                style: TextStyle(fontSize: 30.0)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    }

  }

class PeakTimeCard extends StatefulWidget{

  String whichPeak;

  PeakTimeCard(this.whichPeak);

  @override
  _PeakTimeCardState createState() => _PeakTimeCardState(whichPeak);
}

class _PeakTimeCardState extends State<PeakTimeCard> {
  String startTime = "00:04";
  final String peak;

  _PeakTimeCardState(this.peak);

  Future <Null> _selectTime(BuildContext context) async{
    final TimeOfDay peakTime = await showTimePicker(
      context: context,
      initialTime: new TimeOfDay.now()
    );

    if (peakTime != null){
      // print("Peak Time selected: ${peakTime.toString()}");
      final int hour = peakTime.hour;
      final int mins = peakTime.minute;
      startTime = "$hour:$mins";
    }


  }

  @override
  Widget build(BuildContext context){
    Center peakTime = new Center(
        child: new Container(
          width: double.infinity,
          height: 120.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
            begin: Alignment.topLeft, 
            end: Alignment.bottomRight,
                colors: [Colors.cyan[400], Colors.blue[600]],
              )
            ),
          child: Card(
            color: Colors.transparent,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[ 

                Padding(padding: EdgeInsets.all(4.0)),
                Column(
                  children: <Widget> [

                    Padding(padding: EdgeInsets.all(5.0)),
                    Text(" $peak Peak Time", 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                      )
                    ),

                    Padding(padding: EdgeInsets.all(3.0)),
                    RaisedButton(
                      color: Colors.blue[900],
                      padding: EdgeInsets.all(10.0),
                      elevation: 12.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)
                        ),
          
                      child: Text('Change',
                        style: TextStyle(fontFamily: "Arial", color: Colors.white,
                        fontSize: 20.0)),
                        onPressed: () {
                          setState(() {
                            _selectTime(context);
                          });

                        },
                    ),
                  ]
                ),

                Padding(padding: EdgeInsets.all(17.0),),

                Column(
                  children: <Widget> [

                    Padding(padding: EdgeInsets.all(13.0)),

                    Text(startTime,
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 45.0
                        )
                    )
                  ]
                ),
              ],
            ),
          ),
        ),
    );

    return peakTime;
  }
}
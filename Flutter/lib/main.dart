import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:studio/fragments/cards.dart';
import 'second.dart';

void main() => 
  runApp( MyApp() );

  class MyApp extends StatelessWidget{
    @override
    Widget build(BuildContext context){
      return MaterialApp(home: HomePage());
    }
  }

  class HomePage extends StatelessWidget{
    @override
    Widget build(BuildContext context){
      return Scaffold(
        backgroundColor: Colors.blue[900],

        appBar: GradientAppBar(
          backgroundColorStart: Colors.blue[900],
          backgroundColorEnd: Colors.cyan[700],
          title: new Align(
            alignment: Alignment.centerLeft,
            child: Text("Gate Keeper", style: TextStyle(fontSize: 30.0))
          )
        ),

        drawer: homeDrawer(context),

        body: ListView(
          padding: EdgeInsets.all(15.0),
          children: <Widget> [
            
            new Center(
              child: HeadingText("Welcome back!", FontWeight.normal)
            ),
            
            new Padding(child: Text(""), padding: EdgeInsets.all(1.0)),

            currentStatus()]
        )
      );
    }

    Center currentStatus(){
      return new Center(
        child: new Container(
          child: new Column(
            children: <Widget>[
              
              temperatureCard,
              new Padding(child: Text(""), padding: EdgeInsets.all(1.0)),

              financialCard,
              new Padding(child: Text(""), padding: EdgeInsets.all(1.0)),

              energyCard,

              Image.asset('assets/images/logo.png')
            ],
          )
        )
      );
    }

    Drawer homeDrawer(BuildContext context){
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
              },
            ),
            ListTile(
              title: Text('Peak Times',
                style: TextStyle(fontSize: 30.0)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => Page2()));
              },
            ),
          ],
        ),
      );
    }
  }

class HeadingText extends StatelessWidget{
  final String text;
  final FontWeight weight;

  HeadingText(this.text, this.weight);

  Widget build(context){
    final Text headText = 
      new Text(text,
        style: TextStyle(
        color: Colors.white,
        fontSize: 40.0,
        fontWeight: weight
        )
      );
    return headText;
  }
}




class ThemeText extends StatelessWidget {
	// a property on this class
	final String text;
  final double pad;

	// a constructor for this class
	ThemeText(this.text, this.pad);

	Widget build(context) {
		// Pass the text down to another widget
		return new Container(
      width: double.infinity,

      padding: EdgeInsets.all(25.0),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24.0)),
        gradient: LinearGradient(
        begin: Alignment.topLeft, end: Alignment.bottomRight,
            colors: [Colors.green[300], Colors.cyan[800]],
          )
        ),
      child: Text(text, 
          textAlign: TextAlign.center,     
          style: new TextStyle(
            fontSize: 38.0, 
            color: Colors.white)
      )
    );
	}
}

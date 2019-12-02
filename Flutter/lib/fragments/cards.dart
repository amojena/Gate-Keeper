import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Color cardColor = Colors.transparent;

Container temperatureCard = new Container(
          height: 130.0,
          decoration: tempDec,
          child: Card(
              color: cardColor,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.flare),
                    title: Text("115˚F",
                style: savingsStyle),
                subtitle: Text("Current Temperature", style: subStyle),
              )
            ]
          )
        )
);



Container financialCard = new Container(
          height: 130.0,
          decoration: cardDec,
          child: Card(
            color: cardColor,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.monetization_on),
                  title: Text("\$5.01",
              style: savingsStyle),
              subtitle: Text("Financial savings in the past month", style: subStyle),
            )
          ]
        )
      )
);

Container energyCard = new Container(
          height: 130.0,
          decoration: energyDec,
          child: Card(
            color: cardColor,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.check),
                  title: Text("1.01 kW",
              style: savingsStyle),
              subtitle: Text("Energy savings in the past month", style: subStyle),
            )
          ]
        )
      )
);

Container randomCard = new Container(
          height: 130.0,
          width: double.infinity,
          decoration: energyDec,
          child: Card(
            color: cardColor,
            child: Column(
            mainAxisSize: MainAxisSize.max,
            children:<Widget>[
              Text("Fadsfa")
            ])));

BoxDecoration cardDec =  BoxDecoration(
  gradient: LinearGradient(
  begin: Alignment.topLeft, 
  end: Alignment.bottomRight,
      colors: [Colors.green[800], Colors.green[200]],
    )
  );

BoxDecoration tempDec =  BoxDecoration(
  gradient: LinearGradient(
  begin: Alignment.topLeft, 
  end: Alignment.bottomRight,
      colors: [Colors.red[800], Colors.red[200]],
    )
  );

BoxDecoration energyDec =  BoxDecoration(
  gradient: LinearGradient(
  begin: Alignment.topLeft, 
  end: Alignment.bottomRight,
      colors: [Colors.yellow[800], Colors.yellow[200]],
    )
  );


const savingsStyle = TextStyle(
  color: Colors.white,
  fontSize: 42.0,
);
                      
const TextStyle subStyle = TextStyle(
  color: Colors.white,
  fontSize: 25.0
  );
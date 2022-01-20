import 'package:flutter/material.dart';
import 'package:world_time/Services/worldtime.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {} ;
  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map ;
    print(data) ;

    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png' ;
    Color? bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700] ;
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(child:
      Container (
        decoration: BoxDecoration(
          image : DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover ,
          )
        ) ,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0 , 120.0 , 0 , 0.0),
          child: Column (
            children: [
              FlatButton.icon(onPressed: () async {
                dynamic Results = await Navigator.pushNamed(context, '/choose_location') ;
                if (Results != null)
                  {
                    setState(() {
                      data = {
                        'Location' : Results.Location ,
                        'flag' : Results.flag ,
                        'time' : Results.data1 ,
                        'isDayTime' : Results.isDayTime ,
                      };
                    });
                  }

              },
                  icon: Icon(Icons.edit_location,
                    color: Colors.white,
                  ),
                  label:  Text("Edit Location",
                  style: TextStyle(color: Colors.white),
                  )),

              SizedBox(height: 20.0,) ,

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data['Location'] ,
                  style: TextStyle(
                    fontSize: 38.0 ,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white ,
                  ),)
                ],
              ) ,
              SizedBox(height: 30.0,) ,
              Text(data['time'] ,
              style: TextStyle(
                fontSize: 66.0 ,
                fontWeight: FontWeight.bold,
                color: Colors.white ,
              ),)
            ],
          ),
        ),
      ) ,
      ) ,
    );
  }
}

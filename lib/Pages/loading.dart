import 'package:flutter/material.dart';
import 'package:world_time/Services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "Loading" ;

  void SetupTime() async
  {
    WorldTime instance = WorldTime(Location: 'Berlin', flag: 'Europe', url: 'Europe/Berlin');
    await instance.getTime();

    Navigator.pushReplacementNamed(context, '/home' ,
        arguments: {
          'Location' : instance.Location ,
          'flag' : instance.flag ,
          'time' : instance.data1 ,
          'isDayTime' : instance.isDayTime ,
        }) ;

  }

  @override
  void initState()  {
    SetupTime() ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[900],
        body:
        Center(
          child: SpinKitSpinningLines(
            color: Colors.black,
            size: 50.0,
          ),
        ),

      ),
    );
  }
}

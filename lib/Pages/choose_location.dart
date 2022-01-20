import 'package:flutter/material.dart';
import 'package:world_time/Services/worldtime.dart';


class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', Location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', Location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', Location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', Location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', Location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', Location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', Location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', Location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void UpdateTime(index) async
  {
    WorldTime instance = locations[index] ;
    await instance.getTime() ;
    Navigator.pop(context , {
      'Location' : instance.Location ,
      'flag' : instance.flag ,
      'time' : instance.data1 ,
      'isDayTime' : instance.isDayTime ,
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Choose Location"),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body:
      ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    UpdateTime(index);
                  },
                  title: Text(locations[index].Location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:finaldashboard/dashboard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(211, 255, 174, 0),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Museum monitoring system ',
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Tilt Prism'),
              ),
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('images/artifacts.jpg'),
              ),
              Card(
                color: Colors.deepOrange,
                margin: EdgeInsets.all(16.0),
                child: TextButton.icon(
                  icon: Icon(
                    Icons.touch_app_rounded,
                    color: Color.fromARGB(255, 235, 230, 227),
                  ),
                  label: Text(
                    'Click to see the dashboard',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        backgroundColor: Colors.deepOrange,
                        fontFamily: 'Tilt Prism'),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new DataFetcher()),
                    );

                  },
                ),
              ),
              Text(
                'Make sure you have connected the wifi hotspot',
                style: TextStyle(fontFamily: 'Tilt Prism'),
              ),
            ]),
      ),
    );
  }
}

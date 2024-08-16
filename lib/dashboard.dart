import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:gauge_indicator/gauge_indicator.dart';
import 'dart:async';

class DataFetcher extends StatefulWidget {
  @override
  _DataFetcherState createState() => _DataFetcherState();
}

class _DataFetcherState extends State<DataFetcher> {
  String  temperature1 = '0';
  String humidity1 = "0";
  String  temperature2 = '0';
  String humidity2 = "0";
  Timer? _timer;
final double thresholdt = 29;
  final double thresholdh = 50;

  @override
  void initState() {
    super.initState();
    // Start fetching data automatically
    _timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      fetchData();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://192.168.4.1'));

    if (response.statusCode == 200) {
      final data = response.body.split('\n');
      setState(() {
        temperature1 = data[0].split(':')[1].trim();
        humidity1 = data[1].split(':')[1].trim();
        temperature2 = data[2].split(':')[1].trim();
        humidity2 = data[3].split(':')[1].trim();

      });
    } else {
      print('Failed to fetch data: ${response.statusCode}');
    }
  }
  Color getColor1(){
    return double.parse(temperature1)>thresholdt ?Colors.red : Colors.blue;
  }
  Color getColor2(){
    return double.parse(humidity1)>thresholdh ?Colors.red : Colors.blue;
  }
  Color getColor3(){
    return double.parse(temperature2)>thresholdt ?Colors.red : Colors.blue;
  }
  Color getColor4(){
    return double.parse(humidity2)>thresholdh ?Colors.red : Colors.blue;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(211, 255, 174, 0),
      drawer: Drawer(
        child: Column(
          children: [

            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/about');
                },
                child: Card(
                  margin: EdgeInsets.all(4.0),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(children: <Widget>[
                      Text('About',
                          style: TextStyle(
                              fontSize: 24.0,
                              color: Color.fromARGB(211, 255, 174, 0))),
                    ]),
                  ),
                )),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/history');
                },
                child: Card(
                  margin: EdgeInsets.all(4.0),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(children: <Widget>[
                      Text('History',
                          style: TextStyle(
                              fontSize: 24.0,
                              color: Color.fromARGB(211, 255, 174, 0))),
                    ]),
                  ),
                )),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/status');
                },
                child: Card(
                  margin: EdgeInsets.all(4.0),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(children: <Widget>[
                      Text('Sensor status',
                          style: TextStyle(
                              fontSize: 24.0,
                              color: Color.fromARGB(211, 255, 174, 0))),
                    ]),
                  ),
                ))
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(211, 255, 174, 0),
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(4.0),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(children: <Widget>[
                Text('T1: $temperature1 °C',
                    style: TextStyle(
                        fontSize: 24.0,
                        color: Color.fromARGB(211, 255, 174, 0))),
              ]),
            ),
          ),

            SizedBox(width: 50),
          Card(
            margin: EdgeInsets.all(4.0),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(children: <Widget>[
                Text('T2: $temperature2 °C',
                    style: TextStyle(
                        fontSize: 24.0,
                        color: Color.fromARGB(211, 255, 174, 0))),
              ]),
            ),
          ),

          SizedBox(width: 10),
        ]

           ),
            SizedBox(height: 10),
     Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: <Widget>[
            AnimatedRadialGauge(
              /// The animation duration.
              duration: const Duration(milliseconds: 30),
              curve: Curves.elasticOut,

              /// Define the radius.
              /// If you omit this value, the parent size will be used, if possible.
              radius: 50,

              /// Gauge value.
              value: double.parse(temperature1),

              /// Optionally, you can configure your gauge, providing additional
              /// styles and transformers.
              axis: GaugeAxis(
                /// Provide the [min] and [max] value for the [value] argument.
                  min: 0,
                  max: 100,
                  /// Render the gauge as a 180-degree arc.
                  degrees: 360,

                  /// Set the background color and axis thickness.
                  style: const GaugeAxisStyle(
                    thickness: 20,
                    background: Color(0xFFDFE2EC),
                    segmentSpacing: 4,
                  ),

                  /// Define the pointer that will indicate the progress (optional).
                  pointer: GaugePointer.needle(
                    //size: Size(16, 100),
                    borderRadius: 16,
                    //  backgroundColor: Color(0xFF193663),
                    width: 30,
                    height: 50,
                    color: Colors.black,
                  ),

                  /// Define the progress bar (optional).
                  progressBar:  GaugeProgressBar.rounded(
                    color: getColor1(),
                  ),

                  /// Define axis segments (optional).
                  segments: [
                    const GaugeSegment(
                      from: 0,
                      to: 33.3,
                      //  color: Colors.blue,
                      cornerRadius: Radius.circular(5),
                    ),
                    const GaugeSegment(
                      from: 33.2,
                      to: 100,
                      //  color: Colors.red,
                      cornerRadius: Radius.circular(5),
                    ),
                  ]
              ),
            ),
           SizedBox(width: 30),
           AnimatedRadialGauge(
             /// The animation duration.
             duration: const Duration(milliseconds: 30),
             curve: Curves.elasticOut,

             /// Define the radius.
             /// If you omit this value, the parent size will be used, if possible.
             radius: 50,

             /// Gauge value.
             value: double.parse(temperature2),

             /// Optionally, you can configure your gauge, providing additional
             /// styles and transformers.
             axis: GaugeAxis(
               /// Provide the [min] and [max] value for the [value] argument.
                 min: 0,
                 max: 100,
                 /// Render the gauge as a 180-degree arc.
                 degrees: 360,

                 /// Set the background color and axis thickness.
                 style: const GaugeAxisStyle(
                   thickness: 20,
                   background: Color(0xFFDFE2EC),
                   segmentSpacing: 4,
                 ),

                 /// Define the pointer that will indicate the progress (optional).
                 pointer: GaugePointer.needle(
                   //size: Size(16, 100),
                   borderRadius: 16,
                   //  backgroundColor: Color(0xFF193663),
                   width: 30,
                   height: 50,
                   color: Colors.black,
                 ),

                 /// Define the progress bar (optional).
                 progressBar:  GaugeProgressBar.rounded(
                   color: getColor3(),
                 ),

                 /// Define axis segments (optional).
                 segments: [
                   const GaugeSegment(
                     from: 0,
                     to: 33.3,
                     //  color: Colors.blue,
                     cornerRadius: Radius.circular(5),
                   ),
                   const GaugeSegment(
                     from: 33.2,
                     to: 100,
                     //  color: Colors.red,
                     cornerRadius: Radius.circular(5),
                   ),
                 ]
             ),
           ),
    ]
),
            SizedBox(height: 40),
            Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Card(
                  margin: EdgeInsets.all(4.0),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(children: <Widget>[
                      Text('H1: $humidity1 %',
                          style: TextStyle(
                              fontSize: 24.0,
                              color: Color.fromARGB(211, 255, 174, 0))),
                    ]),
                  ),
                ),

            SizedBox(width: 50),
                Card(
                  margin: EdgeInsets.all(4.0),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(children: <Widget>[
                      Text('H2: $humidity2 %',
                          style: TextStyle(
                              fontSize: 24.0,
                              color: Color.fromARGB(211, 255, 174, 0))),
                    ]),
                  ),
                ),
           ]
            ),
            SizedBox(height: 10),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
            AnimatedRadialGauge(
              /// The animation duration.
              duration: const Duration(milliseconds: 30),
              curve: Curves.elasticOut,

              /// Define the radius.
              /// If you omit this value, the parent size will be used, if possible.
              radius: 50,

              /// Gauge value.
              value: double.parse(humidity1),

              /// Optionally, you can configure your gauge, providing additional
              /// styles and transformers.
              axis: GaugeAxis(
                /// Provide the [min] and [max] value for the [value] argument.
                  min: 0,
                  max: 100,
                  /// Render the gauge as a 180-degree arc.
                  degrees: 360,

                  /// Set the background color and axis thickness.
                  style: const GaugeAxisStyle(
                    thickness: 20,
                    background: Color(0xFFDFE2EC),
                    segmentSpacing: 4,
                  ),

                  /// Define the pointer that will indicate the progress (optional).
                  pointer: GaugePointer.needle(
                    //size: Size(16, 100),
                    borderRadius: 16,
                    //  backgroundColor: Color(0xFF193663),
                    width: 30,
                    height: 50,
                    color: Colors.black,
                  ),

                  /// Define the progress bar (optional).
                  progressBar: GaugeProgressBar.rounded(
                    color: getColor2(),
                  ),

                  /// Define axis segments (optional).
                  segments: [
                    const GaugeSegment(
                      from: 0,
                      to: 45,
                      //  color: Colors.blue,
                      cornerRadius: Radius.circular(5),
                    ),
                    const GaugeSegment(
                      from: 45,
                      to: 100,
                      // color: Colors.red,[
                      cornerRadius: Radius.circular(5),
                    ),
                  ]
              ),
            ),
                SizedBox(width: 100),
                AnimatedRadialGauge(
                  /// The animation duration.
                  duration: const Duration(milliseconds: 30),
                  curve: Curves.elasticOut,

                  /// Define the radius.
                  /// If you omit this value, the parent size will be used, if possible.
                  radius: 50,

                  /// Gauge value.
                  value: double.parse(humidity2),

                  /// Optionally, you can configure your gauge, providing additional
                  /// styles and transformers.
                  axis: GaugeAxis(
                    /// Provide the [min] and [max] value for the [value] argument.
                      min: 0,
                      max: 100,
                      /// Render the gauge as a 180-degree arc.
                      degrees: 360,

                      /// Set the background color and axis thickness.
                      style: const GaugeAxisStyle(
                        thickness: 20,
                        background: Color(0xFFDFE2EC),
                        segmentSpacing: 4,
                      ),

                      /// Define the pointer that will indicate the progress (optional).
                      pointer: GaugePointer.needle(
                        //size: Size(16, 100),
                        borderRadius: 16,
                        //  backgroundColor: Color(0xFF193663),
                        width: 30,
                        height: 50,
                        color: Colors.black,
                      ),

                      /// Define the progress bar (optional).
                      progressBar: GaugeProgressBar.rounded(
                        color: getColor4(),
                      ),

                      /// Define axis segments (optional).
                      segments: [
                        const GaugeSegment(
                          from: 0,
                          to: 45,
                          //  color: Colors.blue,
                          cornerRadius: Radius.circular(5),
                        ),
                        const GaugeSegment(
                          from: 45,
                          to: 100,
                          // color: Colors.red,[
                          cornerRadius: Radius.circular(5),
                        ),
                      ]
                  ),
                ),
    ]
            ),
          ],
        ),
      ),
    );
  }
}

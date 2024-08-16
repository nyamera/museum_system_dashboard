import 'package:flutter/material.dart';

class about extends StatelessWidget {
  const about({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(211, 255, 174, 0),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(211, 255, 174, 0),
          title: Text('About'),
        ),
        body: Column(
          children: [
            Text(
              'About the Museum monitoring system',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Welcome to the Museum Monitoring System, an innovative solution designed to revolutionize the management and conservation of cultural heritage within our esteemed museum. This system represents a culmination of cutting-edge technology, dedicated efforts, and a shared commitment to preserving our rich cultural legacy for generations to come.',
              style: TextStyle(fontSize: 10.0),
            ),
            Text(
              'Our Mission:',
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'At the heart of the Museum Monitoring System is a mission to safeguard and enhance the museum experience. We aim to create an environment where artifacts are not only preserved with utmost care but also presented in a way that captivates and educates visitors.',
              style: TextStyle(
                fontSize: 10.0,
              ),
            ),
            Text(
              'Development team',
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'The Museum Monitoring System is the result of collaborative efforts from a dedicated team of developers, designers, and museum experts. Our team is passionate about merging technology with cultural preservation, and each member has played a vital role in bringing this vision to life.',
              style: TextStyle(
                fontSize: 10.0,
              ),
            ),
            Text(
              'Feedback and support:',
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'We value your feedback! If you have suggestions, questions, or encounter any issues while using the Museum Monitoring System, please reach out to our support team. Your insights are crucial in our ongoing efforts to refine and enhance the system.',
              style: TextStyle(
                fontSize: 10.0,
              ),
            ),
            Text(
              'Thank you:',
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'We extend our heartfelt gratitude to all stakeholders, contributors, and supporters who have been instrumental in the development and implementation of the Museum Monitoring System. Together, we strive to create a dynamic and sustainable future for museum management and cultural conservation.',
              style: TextStyle(
                fontSize: 10.0,
              ),
            ),
          ],
        ));
  }
}

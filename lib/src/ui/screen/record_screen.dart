import 'package:flutter/material.dart';

class RecordScreen extends StatelessWidget {
  final String username;
  final String lastName;

  const RecordScreen(
      {super.key, required this.username, required this.lastName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(221, 101, 100, 100),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0), 
          ),
          elevation: 10, 
          color: Colors.blueAccent, 
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              textAlign: TextAlign.center,
              'Felicidades \n $username $lastName \nhas sido registrado!',
              style: const TextStyle(
                fontSize: 30, 
                color: Colors.white, 
                fontWeight: FontWeight.bold, 
              ),
            ),
          ),
        ),
      ),
    );
  }
}

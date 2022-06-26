import 'package:flutter/material.dart';
import 'package:fit_app_exam/models/pet.dart';

class PetTile extends StatelessWidget {
  final pet person;
  PetTile({required this.person});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: const EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: const CircleAvatar(
            radius: 25,
            backgroundColor: Colors.amber,
            backgroundImage: AssetImage('assets/cane.png'),
          ),
          title: Text('Name: ${person.name}'),
          subtitle: Text('Surname: ${person.surname}, Age: ${person.age}'),
        ),
      ),
    );
  }
}

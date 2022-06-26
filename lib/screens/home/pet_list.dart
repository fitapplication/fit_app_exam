import 'package:flutter/material.dart';
import 'package:fit_app_exam/models/pet.dart';
import 'package:fit_app_exam/shared/loading.dart';
import 'package:fit_app_exam/screens/home/pet_tile.dart';
import 'package:provider/provider.dart';

class PetList extends StatefulWidget {
  const PetList({Key? key}) : super(key: key);

  @override
  State<PetList> createState() => _PetListState();
}

class _PetListState extends State<PetList> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Iterable<pet>>(context).toList();

    return ListView.builder(
      itemCount: user.length,
      itemBuilder: (context, index) {
        return PetTile(person: user[index]);
      },
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider_demo/data/model/student.dart';

class ListTileWidget extends StatelessWidget {
  final int? index;
  final int? id;
  final String? firstName;
  final String? lastName;
  final Function? onTap;
  final Student? model;
  final String? from;
  final Employee? consumerModel;

  const ListTileWidget(
      {Key? key,
      this.index,
      this.id,
      this.firstName,
      this.lastName,
      this.from,
      this.onTap,
      this.model,
      this.consumerModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 5,
      shadowColor: Colors.grey,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        title: Text(
          "Name :-  $firstName $lastName",
          style: const TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
        ),
        trailing: TextButton(
          onPressed: () {
            onTap!.call(index, model, from, consumerModel);
          },
          child: const Text(
            "ADD",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
    );
  }
}

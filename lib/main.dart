import 'package:flutter/material.dart';
import 'package:flutter_application_animaciones/coffe_concept/coffe_concept_list.dart';

class MainCoffeConceptApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: CoffeConceptList(),
      );
  }
}

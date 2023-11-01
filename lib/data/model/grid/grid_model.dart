import 'package:flutter/cupertino.dart';

class GridItem {
 final int id;
 final IconData icon;
 final String text;
 bool isSelected;

 GridItem({required this.id, required this.icon, required this.text, this.isSelected = false});
}
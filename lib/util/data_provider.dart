import 'package:flutter/material.dart';

class CardModel{
  final String label;
  final Widget leading; // [no use in Stack]
  final Widget title;
  final Widget subtitle;
  final Widget cover;
  final bool dense; // [no use in Stack]
  final ListTile tile;
  final EdgeInsetsGeometry contentPadding;
  final bool enabled; // default: true
  final bool selected;// default: false
  final List<Widget> detail;// 

  CardModel({this.label, this.leading,@required this.title, this.subtitle, this.cover, this.dense, this.tile, this.contentPadding, this.enabled, this.selected,@required this.detail});
}


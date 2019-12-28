import 'package:flutter/material.dart';

class CardModel{
  final String label;
  final Widget leading; // [no use in Stack]
  final Widget title;
  final Widget subtitle;
  final Widget tags;
  final Widget category;
  final Widget cover;
  final bool dense; // [no use in Stack]
  final EdgeInsetsGeometry contentPadding;
  final bool enabled; // default: true
  final bool selected;// default: false
  final List<Widget> detail;// 
  final Widget snippet;

  CardModel({this.snippet, this.tags, this.category, this.label, this.leading,@required this.title, this.subtitle, this.cover, this.dense, this.contentPadding, this.enabled, this.selected,@required this.detail});
}


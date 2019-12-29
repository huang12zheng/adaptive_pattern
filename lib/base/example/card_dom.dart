import 'package:adaptive_widget/base/layout_help.dart';
import 'package:adaptive_widget/util/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:quiver/strings.dart';

class CardDom extends DomStrategy<ItemModel>{
  /// [Semantics.label]
  final String label;

  final Widget title;
  final Widget subtitle;
  final Widget tags;
  final Widget labels;
  final Widget category;
  final Widget cover;
  final bool dense; // [no use in Stack]
  final EdgeInsetsGeometry contentPadding;
  /// default: true [Semantics.enabled]
  final bool enabled;
  /// default: true [Semantics.select]
  final bool selected;
  /// [snippet]
  final Widget body;
  /// from [authro,authorAvatar]
  /// [author] is no on Stack
  final Widget author; 
  final Widget askedTime;
  /// link to [EditHistoryPage]
  final Widget editedTime;
  /// link to [AnswerHistoryPage]
  final Widget activedTime;
  final Widget viewedTime;
  final Widget vote;
  final Widget answer;

  CardDom({this.vote, this.answer,this.labels,
    this.askedTime, this.editedTime, this.activedTime, this.viewedTime,
    this.author, this.tags, this.category, this.label, @required this.title, this.body, this.subtitle,
    this.cover, this.dense, this.contentPadding,
    this.enabled, this.selected,});

  factory CardDom.fromData(BuildContext ctx,ItemModel model){
    final textTheme = Theme.of(ctx).textTheme;
    return CardDom(
      title: Text(model.title,style: textTheme.subhead,),
      body: isNotBlank(model.title) ? Text(model.title,style: textTheme.body1,) : null,
      author: 
      Row(children: <Widget>[
          if (isNotBlank(model.authorAvatar) ) 
          ...[
            CircleAvatar(backgroundImage: NetworkImage(model.authorAvatar),),
            SizedBox(width: 16,),    
          ],
          if (isNotBlank(model.authorAvatar) ) Text(model.author)
        ],
      ),
      askedTime:   isNotBlank(model.askedTime)  ? Text(model.askedTime,    style: textTheme.caption,) : Container(),
      editedTime:  isNotBlank(model.editedTime) ? Text(model.editedTime,   style: textTheme.caption.copyWith(color: Colors.blueAccent)) : Container(),
      activedTime: isNotBlank(model.activedTime)? Text(model.activedTime,  style: textTheme.caption.copyWith(color: Colors.blueAccent)) : Container(),
      viewedTime:  isNotBlank(model.viewedTime) ? Text(model.viewedTime,   style: textTheme.caption) : Container(),
      tags: Wrap(children: <Widget>[
        ...model.tags.map((type)=> (isNotBlank(type)) ? Text(type,style: textTheme.button,) : null).where((widget)=>widget!=null),
      ]),
      labels: Wrap(children: <Widget>[
        ...model.labels.map((type)=> LabelBinding.typeToWidget(type)).where((widget)=>widget!=null),
      ]),
      vote:  model.vote != null ? Text(model.askedTime,    style: textTheme.caption,) : Container(),
      answer:model.answer != null ? Text(model.askedTime,    style: textTheme.caption,) : Container(),
      category: (isNotBlank(model.category)) ? Text(model.category,style: textTheme.button,) : Container()
    );
  }
}
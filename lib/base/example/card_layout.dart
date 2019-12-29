import 'package:adaptive_widget/base/example/card_dom.dart';
import 'package:adaptive_widget/base/layout_help.dart';
import 'package:adaptive_widget/util/data_provider.dart';

class CardLayout extends LayoutStrategy<ItemModel>{
  CardLayout(CardDom dom) : super(dom);

  @override
  get horizontalLayout => null;

  @override
  get stackLayout => null;

  @override
  get verticalLayout => null;

}
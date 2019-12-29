import 'package:flutter/material.dart';
import 'package:responsive_layout_builder/responsive_layout_builder.dart';

/// [DomStrategy] is unions of [Map<T,Widget>]
/// `model=>Dom`
abstract class DomStrategy<T>{
}

// typedef LayoutStrategyBuilder<T> = Widget Function(BuildContext ctx,DomStrategy<T> dom);
typedef LayoutStrategyBuilder<T> = Widget Function(BuildContext ctx);
// typedef DomBuilder<T> =  DomStrategy<T> Function(BuildContext ctx,T model);
/// [xxxBuilder] => styleStrategy.builder
abstract class LayoutStrategy<T>{
  final DomStrategy<T> dom;

  LayoutStrategy(this.dom);
  // Widget Function(BuildContext ctx,DomStrategy<T> model) get xxxBuilder;
  LayoutStrategyBuilder<T> get stackLayout;
  LayoutStrategyBuilder<T> get horizontalLayout;
  LayoutStrategyBuilder<T> get verticalLayout;
}

typedef ComponentStrategyBuilder<T> = Widget Function(BuildContext ctx,ScreenSize size);
abstract class ComponentStrategy<T>{
  /// layout is instance of [Dom]
  final LayoutStrategy<T> layout;

  ComponentStrategy(this.layout);
  ComponentStrategyBuilder<T> get watchBuilder => (ctx,size)=>layout.stackLayout(ctx);
  ComponentStrategyBuilder<T> get tvBuilder    => (ctx,size)=>layout.verticalLayout(ctx);
  ComponentStrategyBuilder<T> get mobileBuilder=> (ctx,size)=>layout.horizontalLayout(ctx);
  ComponentStrategyBuilder<T> get tabletBuilder=> (ctx,size)=>layout.horizontalLayout(ctx);

}


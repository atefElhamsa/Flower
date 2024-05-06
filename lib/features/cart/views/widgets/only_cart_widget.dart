import 'package:flower_app/features/search_juice/views/data/models/juicemodel.dart';
import 'package:flutter/material.dart';

class OnlyCartWidget extends StatefulWidget {
  const OnlyCartWidget({
    super.key,
    required this.item,
  });

  final JuiceModel item;

  @override
  State<OnlyCartWidget> createState() => _OnlyCartWidgetState();
}

class _OnlyCartWidgetState extends State<OnlyCartWidget> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [],
    );
  }
}

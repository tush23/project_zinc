import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  final String? msg;

  const NoDataWidget({super.key, this.msg});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(msg ?? ""));
  }
}

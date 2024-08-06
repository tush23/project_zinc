import 'package:flutter/material.dart';
import 'package:project_zinc/core/errors/failures.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, this.error, this.obj});
  final String? error;
  final Object? obj;

  @override
  Widget build(BuildContext context) {
    if (obj is Failure) {
      return Center(child: Text((obj as Failure).message));
    } else {
      return Center(child: Text(error ?? "Something went Wrong!!"));
    }
  }
}

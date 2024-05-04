import 'package:flutter/material.dart';

import 'widgets/selection_view_body.dart';

class selection_view extends StatelessWidget {
  const selection_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: selection_view_body());
  }
}
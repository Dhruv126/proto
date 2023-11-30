import 'package:flutter/material.dart';
import 'package:proto/ui/src/extension/extension.dart';
import 'package:proto/ui/src/widgets/proto_sceen_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProtoScreenLayout(
      layoutWithAppBar: false,
      setBottomInsetValue: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "ChatScreen".appCommonText(),
        ],
      ),
    );
  }
}

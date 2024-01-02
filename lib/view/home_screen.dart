import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proto/ui/src/extension/extension.dart';
import 'package:proto/ui/src/widgets/proto_sceen_layout.dart';
import 'package:proto/ui/src/widgets/proto_text_field.dart';
import 'package:proto/viewModel/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController search = TextEditingController();

  List user = [];

  @override
  Widget build(BuildContext context) {
    return ProtoScreenLayout(
      layoutWithAppBar: false,
      setBottomInsetValue: false,
      body: GetBuilder<HomeViewModel>(
        init: HomeViewModel(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "HomeScreen".appCommonText(),
              ProtoTextField(
                hintText: "Search",
                controller: search,
                onChanged: () async {
                  FirebaseFirestore instance = FirebaseFirestore.instance;
                  await instance
                      .collection("users")
                      .where("e-mail", isEqualTo: search.text)
                      .get()
                      .then((value) {
                    user = value.docs;
                    setState(() {});
                  });
                },
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: user.length,
                separatorBuilder: (context, index) {
                  return 20.h.H();
                },
                itemBuilder: (context, index) {
                  return user[index]['username'].toString().appCommonText();
                },
              ),
            ],
          );
        }
      ),
    );
  }
}

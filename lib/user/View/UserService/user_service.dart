import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_servies/constants/textconstants.dart';
import 'package:mobile_servies/user/view/userhome/user_homewidget.dart';

class UserService extends StatelessWidget {
 const  UserService({super.key});
  

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          text(TextConstants.title1, Color(0xFF61DAFB), 30, FontWeight.bold),
            text(TextConstants.title2, Colors.white, 30, FontWeight.bold),
        ],),
      ),
      body: SingleChildScrollView(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(30),
            text(TextConstants.urservice, Colors.white, 30, FontWeight.bold),
            Gap(10),
            text(TextConstants.urservice1, Colors.white, 20, FontWeight.normal),
            Gap(10),
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: icon(Icons.search, Colors.white)
              ),
              
            )
          ],
        ),
      )),
    );
  }
}
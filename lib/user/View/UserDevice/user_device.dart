import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_servies/user/constants/textconstants.dart';
import 'package:mobile_servies/user/decoration/decoration.dart';
import 'package:mobile_servies/user/view/userhome/user_homewidget.dart';

class UserDevice extends StatelessWidget {
 const  UserDevice({super.key});
  

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(30),
            
            text(TextConstants.ourDevices, Colors.white, 30, FontWeight.bold),
            Gap(10),
            text(TextConstants.urservice1, Colors.white, 20, FontWeight.normal),
            Gap(10),
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: icon(Icons.search, Colors.white)
              ),
              
            ),
            Gap(20),
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context,index){
                return Card(
                  color:const Color(0x3361DAFB) ,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: icon(Icons.phone_iphone, Colors.white),
                          // title:text('iphone 13', const Color.fromARGB(255, 215, 215, 215), 25, FontWeight.bold),
                          title: Row(
                            
                            children: [
                            text('iphone 13', const Color.fromARGB(255, 215, 215, 215), 25, FontWeight.bold),
                            Gap(27),
                            containerStyle(30, 130, Color(0xFF181850),
                           Center(child: text('SmartPhone', Colors.white, 15, FontWeight.normal)))
                          ],),
                          subtitle:text('Apple', const Color.fromARGB(255, 215, 215, 215), 20, FontWeight.bold),
                          
                        ),
                        
                          ListTile(
                            leading: icon(Icons.info, Colors.white),
                            title: text('Model: A2634', Colors.white, 15, FontWeight.normal),
                          ),
                           ListTile(
                            leading: icon(Icons.calendar_month, Colors.white),
                            title: text('Released: 2021', Colors.white, 15, FontWeight.normal),
                          ),
                        
                        
                        Gap(20),
                        Center(
                          child: ElevatedButton(
                           style: ElevatedButton.styleFrom(
      backgroundColor:Color(0xFF181850),
      padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      
      ),
    ),
                            onPressed: (){
                                              
                          }, child: text(TextConstants.viewDetails, Colors.white, 18, FontWeight.bold)),
                        )
                        
                      ],
                    ),
                  ),
                );
              
              }),
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_servies/user/constants/textconstants.dart';
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
      body: Padding(
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
              
            ),
            Gap(20),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context,index){
                return Card(
                  color:const Color(0x3361DAFB) ,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                          text('INR 2499.00', const Color.fromARGB(255, 215, 215, 215), 20, FontWeight.bold),
                          Gap(7),
                        text('Increase your phone storage', const Color.fromARGB(255, 198, 198, 198), 15, FontWeight.bold),
                        Gap(10),
                        Row(
                          children: [
                            icon(Icons.watch_later_rounded, Colors.white),
                            Gap(5),
                            text('90 min', Colors.white, 15, FontWeight.bold),
                            Gap(45),
                            icon(Icons.local_offer_outlined, Colors.white),
                             text('Repair', Colors.white, 15, FontWeight.bold),

                          ],
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
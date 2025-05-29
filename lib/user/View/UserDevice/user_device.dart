import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_servies/user/View/UserDevice/devicewidget.dart';
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
                hintText: 'Search Devices',
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
                            Expanded(
                              child: containerStyle(30, 130, Color(0xFF181850),
                                                         Center(child: text('SmartPhone', Colors.white, 15, FontWeight.normal))),
                            )
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
                                 showDeviceDetailDialog(context)   ;          
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


  void showDeviceDetailDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 24),
      child: SizedBox(
        width: double.infinity, // Takes full screen width
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text('Device details', Colors.black, 22, FontWeight.bold),
              Gap(10),
              detailRow('Brand', 'Samsung'),
              detailRow('Model', 'S23'),
              detailRow('Type', 'Smartphone'),
              detailRow('Release Year', '2024'),
              Gap(10),
              text('⚠️ Common Issues', Colors.black, 16, FontWeight.bold),
              Wrap(
                spacing: 6,
                children: [
                  Chip(label: Text('display'), backgroundColor: Colors.orange[200]),
                ],
              ),
              Gap(10),
              text('🛠️ Repairable Components', Colors.black, 16, FontWeight.bold),
              Wrap(
                spacing: 6,
                children: [
                  Chip(label: Text('display'), backgroundColor: Colors.blue[100]),
                  Chip(label: Text('battery'), backgroundColor: Colors.blue[100]),
                  Chip(label: Text('camera'), backgroundColor: Colors.blue[100]),
                ],
              ),
              Gap(10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: text('Close', Colors.blue, 16, FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

}
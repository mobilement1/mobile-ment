
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:mobile_servies/user/view/UserHome/user_homewidget.dart';

// Widget accountRow(IconData icon, String data) {
//     return ListTile(
     
//     leading:     Icon(icon, color: Colors.white),
        
//      title:    text(data, Colors.white, 18, FontWeight.normal),
//      trailing:Icon(Icons.arrow_forward_ios, color: Colors.white,size: 15,) ,
      
//     );
//   }
  import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

Widget accountRow(IconData iconData, String data) {
  return ListTile(
    leading: Icon(iconData, color: Colors.green),
    title: Text(
      data,
      style: GoogleFonts.openSans(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF2E2E2E),
      ),
    ),
    trailing: const Icon(
      Icons.arrow_forward_ios,
      color: Color(0xFF5A5A5A),
      size: 15,
    ),
  );
}

Widget cardWidget(String text1,String text2){
  return Card(
    color: Color(0xFFE9F5DB),
    elevation: 2,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
           text1,
            style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 103, 102, 102)
            ),
          ),
          Text(
            text2,
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 103, 102, 102)
            ),
          ),
        ],
      ),
    ),
  );
}


Widget cardWidgetwo(){
  return Card(
                          color: Color(0xFFE9F5DB),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Card(
                                  child: Icon(
                                    Icons.phone_android,
                                    color: Colors.green
                                  ),
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                                const Gap(10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'iPhone 13 Screen Repair',
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromARGB(255, 103, 102, 102)
                                        ),
                                      ),
                                       Gap(5),
                                      Text(
                                        'Estimated: 2 Hours',
                                        style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromARGB(255, 103, 102, 102)
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
}
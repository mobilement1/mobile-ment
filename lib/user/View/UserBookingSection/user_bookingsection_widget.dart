import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_servies/user/View/UserBookingSection/addAddress.dart';
import 'package:mobile_servies/user/constants/textconstants.dart';


Widget buildDropdown({
  required String? value,
  required List<String> items,
  required String hintText,
  required ValueChanged<String?> onChanged,
}) {
  return DropdownButtonFormField<String>(
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      hintStyle: GoogleFonts.openSans(color: const Color(0xFF8D8D8D)),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF8D8D8D), width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF718355), width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    hint: Text(
      hintText,
      style: GoogleFonts.openSans(
        color: const Color(0xFF8D8D8D),
        fontSize: 16,
      ),
    ),
    value: value,
    dropdownColor: Colors.white,
    iconEnabledColor: const Color(0xFF5A5A5A),
    style: GoogleFonts.openSans(color: const Color(0xFF2E2E2E)),
    items: items.map((item) {
      return DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: GoogleFonts.openSans(
            color: const Color(0xFF2E2E2E),
            fontSize: 16,
          ),
        ),
      );
    }).toList(),
    onChanged: onChanged,
  );
}



Widget customButton({
  required String label,
  required VoidCallback onPressed,
  IconData? icon,
  bool hasBorder = false,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(255, 85, 105, 53),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: hasBorder
            ? const BorderSide(color: Color(0xFF2E2E2E))
            : BorderSide.none,
      ),
    ),
    onPressed: onPressed,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        icon != null
            ? Row(
                children: [
                   Gap(10),
                  Icon(icon, color: const Color(0xFF718355)),
                ],
              )
            : Container(),
      ],
    ),
  );
}

  

Widget showAddressDialog(BuildContext context){
  List<String> savedAddresses = [];
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(255, 85, 105, 53),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        
      ),
    ),
    onPressed: () {
      showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select or Add Address",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF2E2E2E),
                ),
              ),
              const Gap(10),
              savedAddresses.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: savedAddresses
                          .map((address) => Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  address,
                                  style: GoogleFonts.openSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF2E2E2E),
                                  ),
                                ),
                              ))
                          .toList(),
                    )
                  : Text(
                      "No saved addresses",
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.redAccent,
                      ),
                    ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Cancel",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF8D6E63),
                      ),
                    ),
                  ),
                  customButton(
                    label: 'Add Address',
                    icon: null,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  AddAddressPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
    },
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          TextConstants.selectAddress,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        
      ],
    ),
  );
}

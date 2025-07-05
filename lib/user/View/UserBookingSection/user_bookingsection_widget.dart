import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_servies/user/View/UserBookingSection/addAddress.dart';
import 'package:mobile_servies/user/View/UserHome/user_homewidget.dart';


import 'package:mobile_servies/user/viewmodel/addressProvider.dart';
import 'package:mobile_servies/user/viewmodel/bookingProvider.dart';
import 'package:provider/provider.dart';

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
  required dynamic label,
  required VoidCallback? onPressed,
  IconData? icon,
  bool isLoading=false,
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
    onPressed:isLoading?null:onPressed,
    
    child:isLoading?SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: Colors.white,
      ),
    )
    
    : Row(
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

void showAddressDialog(BuildContext context) async {
 final provider = Provider.of<Addressprovider>(context, listen: false);
  await provider.getAddressList();
  showDialog(
    context: context,
    builder: (_) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<Addressprovider>(
            builder: (context, value, child) {
              if (value.isLoading) {
                return Center(child: CircularProgressIndicator());
              }

              final addresses = value.addressList;

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Select or Add Address",
                      style: TextStyle(fontSize: 20)),
                  const SizedBox(height: 10),
                  addresses.isNotEmpty
                      ? SizedBox(
                          // Set max height so ListView fits inside dialog
                          height: 300,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: addresses.length,
                            itemBuilder: (context, index) {
                              final address = addresses[index];
                              final isSelected = value.selectedIndex == index;

                              return Slidable(
  key: ValueKey(address.id),
  endActionPane: ActionPane(
    motion: const ScrollMotion(),
    children: [
      
      SlidableAction(
        onPressed: (_) async {
          final confirm = await showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: text("Confirm Delete", Colors.black, 15, FontWeight.bold),
              content: text("Are you sure you want to delete this address?", Colors.black, 15, FontWeight.normal),
              actions: [
                TextButton(onPressed: () => Navigator.pop(context, false), child: const Text("Cancel")),
                TextButton(onPressed: () => Navigator.pop(context, true), child: const Text("Delete")),
              ],
            ),
          );

          if (confirm == true) {
            log("🗑️ Deleting address with id: ${address.id}");
            final addressId = address.id!;
            await value.deleteAddress(addressId);
            if (value.errorMessage.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Address deleted successfully")),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Failed to delete address: ${value.errorMessage}")),
              );
              await value.getAddressList();
            }
          }
        },
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        icon: Icons.delete,
        label: 'Delete',
      ),
    ],
  ),
  child: GestureDetector(
    onTap: () {
      final summary = "${address.addressDetail}\n${address.street}\n${address.pincode}";
      final addressProvider = Provider.of<Addressprovider>(context, listen: false);
      addressProvider.setSelectedAddress(summary, address.id!, index);
      Provider.of<BookingProviderUser>(context, listen: false).setSelectedAddressID(address.id!, address);
      Navigator.pop(context, summary);
    },
    child: Card(
      color: const Color(0xFFE9F5DB),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: isSelected ? const BorderSide(color: Colors.black, width: 2) : BorderSide.none,
      ),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Icon(Icons.location_on, color: Colors.red),
            const SizedBox(width: 10),
            Text(
              "${address.addressDetail}\n${address.street}\n${address.pincode}",
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    ),
  ),
);

                            },
                          ),
                        )
                      : const Text(
                          "No Saved Address",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel"),
                      ),
                      customButton(
                        label: 'Add Address',
                        icon: null,
                        onPressed: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => AddAddressPage()),
                          );
                          if (result != null) {
                            await value.getAddressList();
                            Navigator.pop(context);
                            showAddressDialog(context);
                          }
                        },
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      );
    },
  );
}

Widget customTextField({
  required TextEditingController controller,
  required String labelText,
  required IconData prefixIcon,
  TextInputType keyboardType = TextInputType.text,
}) {
  return TextField(
    controller: controller,
    keyboardType: keyboardType,
    style: GoogleFonts.openSans(color: const Color(0xFF2E2E2E)),
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: GoogleFonts.openSans(color: const Color(0xFF8D8D8D)),
      prefixIcon: Icon(prefixIcon, color: const Color(0xFF5A5A5A)),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFF8D8D8D), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFF718355), width: 2),
      ),
    ),
  );
}

import 'package:flutter/material.dart';

// tech side searches

Widget searchField({
  required BuildContext context,
  required Function(String) onChanged,
  required TextEditingController controller,
  hintText
}) {
  return TextField(
    controller: controller, 
    onChanged: onChanged,
    decoration: InputDecoration(
     hintText:'Name, Issue, Device ID, Device Details..',
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      prefixIcon: Icon(Icons.search, color: Colors.grey),
      suffixIcon: controller.text.isNotEmpty
          ? IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                controller.clear();
                onChanged(''); 
              },
            )
          : null,
    ),
    style: TextStyle(color: Colors.black),
  );
}


// Booking admin side



Widget bookingSearchField({
  required BuildContext context,
  required Function(String) onChanged,
  required TextEditingController controller,
  String hintText = 'Search by Name, Date...',
}) {
  return TextField(
    controller: controller,
    onChanged: onChanged,
    textInputAction: TextInputAction.search, 
    decoration: InputDecoration(
      hintText: hintText, 
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      prefixIcon: Icon(Icons.search, color: Colors.grey),
      suffixIcon: controller.text.isNotEmpty
          ? IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                controller.clear();
                onChanged('');
              },
            )
          : null,
    ),
    style: TextStyle(color: Colors.black),
  );
}


 
// Completed search admin

Widget completedSearchField({
  required BuildContext context,
  required Function(String) onChanged,
  required TextEditingController controller,
  String hintText = 'Search by Name, Device, Issue...',
}) {
  return TextField(
    controller: controller,
    onChanged: onChanged, 
    textInputAction: TextInputAction.search, 
    decoration: InputDecoration(
      hintText: hintText, 
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      prefixIcon: Icon(Icons.search, color: Colors.grey),
      suffixIcon: controller.text.isNotEmpty
          ? IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                controller.clear();
                onChanged('');       
              },
            )
          : null,
    ),
    style: TextStyle(color: Colors.black),
  );
}



// Device search admin


Widget deviceSearchField({
  required BuildContext context,
  required Function(String) onChanged,
  required TextEditingController controller,
  String hintText = 'Search by Name, Brand, Model, Type...',
}) {
  return TextField(
    controller: controller,
    onChanged: onChanged,
    textInputAction: TextInputAction.search,
    decoration: InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      prefixIcon: Icon(Icons.search, color: Colors.grey),
      suffixIcon: controller.text.isNotEmpty
          ? IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                controller.clear();
                onChanged('');
              },
            )
          : null,
    ),
    style: TextStyle(color: Colors.black),
  );
}


// Service search admin


Widget serviceSearchField({
  required BuildContext context,
  required Function(String) onChanged,
  required TextEditingController controller,
  String hintText = 'Search by Service Name, Category...',
}) {
  return TextField(
    controller: controller,
    onChanged: onChanged,
    textInputAction: TextInputAction.search,
    decoration: InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    prefixIcon: Icon(Icons.search, color: Colors.grey),
      suffixIcon: controller.text.isNotEmpty
          ? IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                controller.clear();
                onChanged('');
              },
            )
          : null,
    ),
    style: TextStyle(color: Colors.black),
  );
}



// requst admin


Widget techRequestSearchField({
  required BuildContext context,
  required Function(String) onChanged,
  required TextEditingController controller,
  String hintText = 'Search by Technician Name, Experience, Request date..',
}) {
  return TextField(
    controller: controller,
    onChanged: onChanged,
    textInputAction: TextInputAction.search,
    decoration: InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      prefixIcon: Icon(Icons.search, color: Colors.grey),
      suffixIcon: controller.text.isNotEmpty
          ? IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                controller.clear();
                onChanged('');
              },
            )
          : null,
    ),
    style: TextStyle(color: Colors.black),
  );
}


// technicians search list admin


Widget techListSearchField({
  required BuildContext context,
  required Function(String) onChanged,
  required TextEditingController controller,
  String hintText = 'Search by Technician Name, Skills, Location, Experience',
}) {
  return TextField(
    controller: controller,
    onChanged: onChanged,
    textInputAction: TextInputAction.search,
    decoration: InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
       prefixIcon: Icon(Icons.search, color: Colors.grey),
      suffixIcon: controller.text.isNotEmpty
          ? IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                controller.clear();
                onChanged('');
              },
            )
          : null,
    ),
    style: TextStyle(color: Colors.black),
  );
}
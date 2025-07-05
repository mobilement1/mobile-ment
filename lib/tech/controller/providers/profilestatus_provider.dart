import 'package:flutter/material.dart';

class AssistiveTouchFabProvider extends ChangeNotifier {
  bool isExpanded=false;
  String currentStatus="online";
  final List<String>statuses=["online","busy","offline"];
  final Map<String,Color>statusColors={"online":Colors.green,"busy":Colors.red,"offline":Colors.grey};
  void toggleExpanded(){
    isExpanded!=isExpanded;
    notifyListeners();
  }
  void close(){
    isExpanded=false;
    notifyListeners();
}
void setStatus(String status){
  currentStatus=status;
  notifyListeners();
}
}
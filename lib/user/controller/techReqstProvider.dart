// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:mobile_servies/user/UserModel/techRequestModel.dart';
// import 'package:mobile_servies/user/UserServices/techRequestService.dart';

// class BecomeTechnicianRqstProvider extends ChangeNotifier{
//   bool isLoading = false;
//   String? errorMessage;
//   bool isSuccess = false;
//   String? resumePath;
//   double? latitude;
//   double? longitude;
//   final TextEditingController experienceController = TextEditingController();
//   final TextEditingController specializationController = TextEditingController();
//   final TextEditingController bioController = TextEditingController();
//   final TextEditingController placeController = TextEditingController();
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final BecomTechnicianRqstService becomTechnicianRqstService = BecomTechnicianRqstService();


// BecomeTechnicianRqstProvider(){
//   getCurrentLocation();
// }

// Future<void> getCurrentLocation()async{
//   bool serviceEnabled;
//   LocationPermission permission; 

//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if(!serviceEnabled){
//     errorMessage = "Location services are diabled";
//     notifyListeners();
//     return;
//   }

//   permission =await Geolocator.checkPermission();
//   if(permission == LocationPermission.denied){
//     permission = await Geolocator.requestPermission();

//     if(permission == LocationPermission.denied){
//       errorMessage = "Location permission denied";
//       notifyListeners();
//       return;
//     }
//   }

//   if(permission == LocationPermission.deniedForever){
//      errorMessage = 'Location permissions are permanently denied';
//       notifyListeners();
//       return;
//   }

//   Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//   latitude = position.latitude;
//   longitude = position.longitude;
//   notifyListeners();

// }


// Future<void> pickResume() async{
//   FilePickerResult? result= await FilePicker.platform.pickFiles(
//     type: FileType.custom,
//     allowedExtensions: ['pdf']
//   );
//   if(result != null){
//     resumePath =result.files.single.path;
//     notifyListeners();
//   }
// }

// Future<void> submitTechnicianApplication()async{
//   if(formKey.currentState!.validate() && resumePath != null && latitude !=null && longitude != null){
//     isLoading = true;
//     errorMessage = null;
//       isSuccess = false;
//       notifyListeners();

      
//       final technician = BecomeTechnicianRqstModel(
//         experience: int.parse(experienceController.text),
//         resume: resumePath!,
//         specialization: specializationController.text,
//         bio: bioController.text,
//         place: placeController.text,
//         longitude: longitude!,
//         latitude: latitude!,
//       );

//       final result= await becomTechnicianRqstService.submitTechnicianApplication(technician, resumePath!);
//       isLoading =false ;

//        if (result['success']) {
//         isSuccess = true;
//         formKey.currentState!.reset();
//         experienceController.clear();
//         specializationController.clear();
//         bioController.clear();
//         placeController.clear();
//         resumePath = null;
//       } else {
//         errorMessage = result['error'];
//       }
//       notifyListeners();
//     } else {
//       errorMessage = 'Please fill all fields, upload a resume, and enable location';
//       notifyListeners();
//     }
//   }

  
//   void resetForm() {
//     formKey.currentState?.reset();
//     experienceController.clear();
//     specializationController.clear();
//     bioController.clear();
//     placeController.clear();
//     resumePath = null;
//     errorMessage = null;
//     isSuccess = false;
//     notifyListeners();
//   }

//   @override
//   void dispose() {
//     experienceController.dispose();
//     specializationController.dispose();
//     bioController.dispose();
//     placeController.dispose();
//     super.dispose();
//   }

// }



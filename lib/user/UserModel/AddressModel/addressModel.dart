class AddressModel {
  final String? id;
final  String addressDetail;
final  String city;
final String pincode;
final String state;
final String street;
final double latitude;
final double longitude;

AddressModel({
   this.id,
  required this.addressDetail,  
required this.city,
required this.pincode,
required this.state,
required this.street,
required this.latitude,
required this.longitude
});

 factory AddressModel.fromJson(Map<String,dynamic>json){
  return AddressModel(
    id: json["addressID"]?? json["id"],
    addressDetail: json['addressDetail'], 
    city:json ['city'],
     pincode: json['pincode'],
     state: json['state'],
      street: json['street'],
       latitude: json['latitude'], 
       longitude: json['longitude']
       );
 }

 Map<String,dynamic>toJson(){
  return{
   if (id != null) 'addressID': id,
   'addressDetail':addressDetail,
   'city':city,
   'pincode':pincode,
   'state':state,
   'street':street,
   'latitude':latitude,
   'longitude':longitude
  };
 }
}

class postM {
postM({ required this.status,required this.city, this.id , this.imageurl , required this.desc ,required this.tel , required this.bloodtype });

String? imageurl;
String? id;
String desc;
String bloodtype;
String tel;
String status;
String city;

factory postM.fromjsno( Map<String,dynamic> data , String id) {
return postM(id: id, desc: data['description'], tel: data['number'], bloodtype: data['type'] , status: data['status'] , imageurl: data['photo'], city: data['city']);
}

}
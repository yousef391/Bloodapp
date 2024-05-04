import 'dart:html';

class UserM {
  UserM({required this.name ,required this.famillyname , required this.bloodtype ,required this.tel , required this.adresse});
  String name;
  String famillyname;
  String tel;
  String adresse; 
  String bloodtype;

  factory UserM.fromjson(var data) {
    return UserM(name: data['name'], famillyname: data['famname'], tel: data['number'], adresse: data['adress'] , bloodtype: data['bloodtype']);
  }

}
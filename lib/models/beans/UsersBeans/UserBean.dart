import 'package:flutter_app_mvvm/models/beans/UsersBeans/address.dart';
import 'package:flutter_app_mvvm/models/beans/UsersBeans/company.dart';
import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class UserBean {

  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

	UserBean.fromJsonMap(Map<String, dynamic> map): 
		id = map["id"],
		name = map["name"],
		username = map["username"],
		email = map["email"],
		address = Address.fromJsonMap(map["address"]),
		phone = map["phone"],
		website = map["website"],
		company = Company.fromJsonMap(map["company"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['name'] = name;
		data['username'] = username;
		data['email'] = email;
		data['address'] = address == null ? null : address.toJson();
		data['phone'] = phone;
		data['website'] = website;
		data['company'] = company == null ? null : company.toJson();
		return data;
	}
}

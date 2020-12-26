
class Geo {

  String lat;
  String lng;

	Geo.fromJsonMap(Map<String, dynamic> map): 
		lat = map["lat"],
		lng = map["lng"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['lat'] = lat;
		data['lng'] = lng;
		return data;
	}
}

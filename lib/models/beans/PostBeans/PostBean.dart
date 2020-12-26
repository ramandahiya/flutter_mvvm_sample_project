
class PostBean {

  int userId;
  int id;
  String title;
  String body;

	PostBean.fromJsonMap(Map<String, dynamic> map): 
		userId = map["userId"],
		id = map["id"],
		title = map["title"],
		body = map["body"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['userId'] = userId;
		data['id'] = id;
		data['title'] = title;
		data['body'] = body;
		return data;
	}
}

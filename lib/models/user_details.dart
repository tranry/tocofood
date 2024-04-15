
class UserDetails {

  String? name;
  String? emailId;
  String? photoUrl;
  String? uid;

  UserDetails({this.name, this.emailId, this.photoUrl, this.uid});

  Map toMap(UserDetails userDetails) {
    var data = <String, String>{};
    data['name'] = userDetails.name!;
    data['emailId'] = userDetails.emailId!;
    data['photoUrl'] = userDetails.photoUrl!;
    data['uid'] = userDetails.uid!;
    return data;
  }

  UserDetails.fromMap(Map<String, String> mapData) {
    name = mapData['name'];
    emailId = mapData['emailId'];
    photoUrl = mapData['photoUrl'];
    uid = mapData['uid'];
  }

  String get _name => name!;
  String get _emailId => emailId!;
  String get _photoUrl => photoUrl!;
  String get _uid => uid!;

  set _photoUrl(String photoUrl) {
    this.photoUrl = photoUrl;
  }

  set _name(String name) {
    this.name = name;
  }

  set _emailId(String emailId) {
    this.emailId = emailId;
  }

  set _uid(String uid) {
    this.uid = uid;
  }

}
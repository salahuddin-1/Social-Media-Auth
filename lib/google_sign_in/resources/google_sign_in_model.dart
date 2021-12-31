class GoogleSignInModel {
  String? displayName;
  String? email;
  String? photoUrl;
  String? id;
  String? token;

  GoogleSignInModel({
    this.displayName,
    this.email,
    this.photoUrl,
    this.id,
    this.token,
  });

  Map<String, dynamic> toJson() {
    return {
      'displayName': displayName,
      'email': email,
      'photoUrl': photoUrl,
      'id': id,
      'token': token,
    };
  }
}

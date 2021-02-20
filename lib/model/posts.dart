// Thes project by Salar Brefki
//برمجة وتطوير سالار بريفكي
// YouTube: https://www.youtube.com/channel/UCphD-Ww9JnrBXRfzy6Ivg0g
// Facebook: https://www.facebook.com/salar.brefki
//Instagram: https://www.instagram.com/salarbrefki

class Posts {
  String id;
  String username;
  String postTitle;
  String postText;

  Posts({
    this.id,
    this.username,
    this.postTitle,
    this.postText,
  });

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
      id: json['id'] as String,
      username: json['username'] as String,
      postTitle: json['posttitle'] as String,
      postText: json['posttext'] as String,
    );
  }
}

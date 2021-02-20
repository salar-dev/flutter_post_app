import 'package:flutter/material.dart';
import 'package:post_app/model/server.dart';

// Thes project by Salar Brefki
//برمجة وتطوير سالار بريفكي
// YouTube: https://www.youtube.com/channel/UCphD-Ww9JnrBXRfzy6Ivg0g
// Facebook: https://www.facebook.com/salar.brefki
//Instagram: https://www.instagram.com/salarbrefki

class EditPost extends StatefulWidget {
  String postId;
  String username;
  String postTitle;
  String postText;

  EditPost({
    this.postId,
    this.username,
    this.postTitle,
    this.postText,
  });

  @override
  _EditPostState createState() => _EditPostState(
        postId,
        username,
        postTitle,
        postText,
      );
}

class _EditPostState extends State<EditPost> {
  String postId;
  String username;
  String postTitle;
  String postText;

  _EditPostState(
    this.postId,
    this.username,
    this.postTitle,
    this.postText,
  );

  TextEditingController _postTitleTD = TextEditingController();
  TextEditingController _postTextTD = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _postTitleTD.text = postTitle;
      _postTextTD.text = postText;
    });
  }

  _updatePost() {
    Services.updatePost(postId, username, _postTitleTD.text, _postTextTD.text)
        .then((result) {
      print(postId);
      if ('success' == result) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.blue,
            content: Row(
              children: [
                Icon(Icons.thumb_up, color: Colors.white),
                Text(
                  'تم تعديل المنشور',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تعديل منشور'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'تعديل منشور',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          username,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.blue,
                          ),
                        ),
                        Icon(
                          Icons.person,
                          size: 35,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _postTitleTD,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        hintText: 'العنوان',
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _postTextTD,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'النص',
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => _updatePost(),
                      child: Text(
                        'تعديل',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

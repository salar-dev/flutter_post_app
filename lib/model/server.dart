import 'package:http/http.dart' as http;
import 'posts.dart';
import 'dart:convert';

// Thes project by Salar Brefki
//برمجة وتطوير سالار بريفكي
// YouTube: https://www.youtube.com/channel/UCphD-Ww9JnrBXRfzy6Ivg0g
// Facebook: https://www.facebook.com/salar.brefki
//Instagram: https://www.instagram.com/salarbrefki

class Services {
  static const ROOT =
      'https://salarapiapp.000webhostapp.com/api_post_app/post_api.php';

  static const _CREATE_TABLE_ACTION = 'CREATE_TABLE';
  static const _ADD_POST_ACTION = 'ADD_POST';
  static const _GET_ALL_POSTS_ACTION = 'GET_ALL';
  static const _UPDATE_POST_ACTION = 'UPDATE_POST';
  static const _DELETE_POST_ACTION = 'DELETE_POST';

  //Method to create table
  static Future<String> createTable() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _CREATE_TABLE_ACTION;
      final response = await http.post(ROOT, body: map);
      print('Create table response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return 'erroe';
      }
    } catch (e) {
      return 'error';
    }
  }

  //Method to add Post
  static Future<String> addPost(
      String userName, String postTitle, String postText) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _ADD_POST_ACTION;
      map['user_name'] = userName;
      map['post_title'] = postTitle;
      map['post_text'] = postText;
      final response = await http.post(ROOT, body: map);
      print('ADD Post Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return 'error';
      }
    } catch (e) {
      return 'error';
    }
  }

  // Method to show Posts
  static Future<List<Posts>> getAllPosts() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_POSTS_ACTION;
      final response = await http.post(ROOT, body: map);
      print('Get All Posts: ${response.body}');
      if (200 == response.statusCode) {
        List<Posts> list = parseResponse(response.body);
        return list;
      }
    } catch (e) {
      return <Posts>[];
    }
  }

  static List<Posts> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Posts>((json) => Posts.fromJson(json)).toList();
  }

  //Method to update post
  static Future<String> updatePost(
    String postId,
    String username,
    String postTitile,
    String postText,
  ) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _UPDATE_POST_ACTION;
      map['post_id'] = postId;
      map['user_name'] = username;
      map['post_title'] = postTitile;
      map['post_text'] = postText;
      final response = await http.post(ROOT, body: map);
      print("Update Post Response: ${response.body}");
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return 'error';
      }
    } catch (e) {
      return "error";
    }
  }

  // Method to delete post
  static Future<String> deletePost(String postId) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _DELETE_POST_ACTION;
      map['POST_ID'] = postId;
      final response = await http.post(ROOT, body: map);
      print('delete post response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return 'error';
      }
    } catch (e) {
      return 'error';
    }
  }
}

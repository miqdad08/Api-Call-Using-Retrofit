import 'package:api_call_using_retrofit/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/post_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Flutter Api Call Using Retrofit',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  FutureBuilder _body() {
    final apiService = ApiService(
      Dio(
        BaseOptions(
          contentType: "application/json",
        ),
      ),
    );
    return FutureBuilder(
      future: apiService.getPost(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<PostModel> posts = snapshot.data!;
          return _posts(posts);
        } else {
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }

  Widget _posts(List<PostModel> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black38, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(posts[index].title,
                style: const TextStyle(fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0,),
              Text(posts[index].title),
            ],
          ),
        );
      },
    );
  }
}

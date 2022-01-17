import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_ui/data/data.dart';
import 'package:social_media_ui/models/post_model.dart';
import 'package:social_media_ui/models/user_model.dart';

class PageCarousel extends StatelessWidget {
  final PageController pageController;
  final String title;
  final List<Post> post;

  PageCarousel(
      {required this.pageController, required this.title, required this.post});

  _buildPost(BuildContext context, int index) {
    Post post = posts[index];
    User user = users[index];
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, offset: Offset(0, 2), blurRadius: 6)
              ]),
          height: 400,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              image: AssetImage(
                post.imageUrl,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 100,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
            ),
            child: Row(),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 2),
          ),
        ),
        Container(
          height: 400,
          child: PageView.builder(
              itemCount: post.length,
              controller: pageController,
              itemBuilder: (BuildContext context, int index) {
                return _buildPost(context, index);
              }),
        )
      ],
    );
  }
}

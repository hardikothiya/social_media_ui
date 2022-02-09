import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_ui/data/data.dart';
import 'package:social_media_ui/models/post_model.dart';
import 'package:social_media_ui/models/user_model.dart';

class PostCarousel extends StatelessWidget {
  final PageController pageController;
  final String title;
  final List<Post> post;

  PostCarousel(
      {required this.pageController, required this.title, required this.post});

  _buildPost(BuildContext context, int index) {
    Post post = posts[index];
    return AnimatedBuilder(
      animation: pageController,
      builder: (BuildContext context, Widget? widget) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = (pageController.page! - index);
          value = (1 - value.abs() * 0.25).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 400,
            child: widget,
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6)
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
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 4),
                    Text(
                      post.location,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.favorite, color: Colors.red),
                            SizedBox(width: 4),
                            Text(post.likes.toString()),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.comment,
                                color: Theme.of(context).primaryColor),
                            const SizedBox(width: 4),
                            Text(post.comments.toString())
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
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

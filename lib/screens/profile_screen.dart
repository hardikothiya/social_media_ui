import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_ui/data/data.dart';
import 'package:social_media_ui/models/post_model.dart';
import 'package:social_media_ui/models/user_model.dart';
import 'package:social_media_ui/widgets/page_carousel.dart';

class ProfileScreen extends StatelessWidget {
  late PageController _pageController;
  late final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image(
                image: AssetImage(currentUser.backgroundImageUrl),
                height: 300,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(currentUser.profileImageUrl),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 3),
                ),
              ),
              Positioned(
                bottom: 0.0,
                child: Text(
                  currentUser.name,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Followers',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    Text(currentUser.followers.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Following',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    Text(
                      currentUser.following.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_ui/data/data.dart';
import 'package:social_media_ui/models/user_model.dart';
import 'package:social_media_ui/widgets/custom_drawer.dart';
import 'package:social_media_ui/widgets/post_carousel.dart';
import 'package:social_media_ui/widgets/profile_clipper.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  ProfileScreen({required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late PageController _favouritesPageController;
  late PageController _postsPageController;

  @override
  void initState() {
    _favouritesPageController =
        PageController(initialPage: 0, viewportFraction: 0.8);
    _postsPageController =
        PageController(initialPage: 0, viewportFraction: 0.8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    image: AssetImage(widget.user.backgroundImageUrl),
                    height: 300,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(widget.user.profileImageUrl),
                            fit: BoxFit.cover),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, 2),
                              color: Colors.black45,
                              blurRadius: 6.0)
                        ]),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: IconButton(
                      onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                      icon: Icon(
                        Icons.menu,
                        size: 30,
                        color: Theme.of(context).primaryColor,
                      )),
                )
              ],
            ),
            SizedBox(height: 3),
            Text(
              widget.user.name,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                      const Text(
                        'Followers',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      Text(widget.user.followers.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Following',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.user.following.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            PostCarousel(
              pageController: _postsPageController,
              title: 'Your Posts',
              post: widget.user.posts,
            ),
            PostCarousel(
                pageController: _favouritesPageController,
                title: 'Favorites',
                post: widget.user.favorites),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

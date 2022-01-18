import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_media_ui/data/data.dart';
import 'package:social_media_ui/models/user_model.dart';
import 'package:social_media_ui/widgets/custom_drawer.dart';
import 'package:social_media_ui/widgets/following_users.dart';
import 'package:social_media_ui/widgets/page_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          title: Text(
            'FRENZY',
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                letterSpacing: 10.0),
          ),
          bottom: TabBar(
            controller: _tabController,
            indicatorWeight: 3,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelStyle: TextStyle(fontSize: 18),
            labelStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            tabs: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Trending',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Latest'),
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            FollowingUsers(),
            PageCarousel(
              pageController: _pageController,
              title: 'Posts',
              post: posts,
            )
          ],
        ),
        drawer: CustomDrawer(),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_ui/data/data.dart';
import 'package:social_media_ui/models/user_model.dart';
import 'package:social_media_ui/screens/user_screen.dart';

class FollowingUsers extends StatefulWidget {
  @override
  _FollowingUsersState createState() => _FollowingUsersState();
}

class _FollowingUsersState extends State<FollowingUsers> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Text(
            'Following',
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 2),
          ),
        ),
        Container(
          height: 80,
          child: ListView.builder(
              padding: EdgeInsets.only(left: 10),
              scrollDirection: Axis.horizontal,
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                User user = users[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UserScreen(user: user),
                      )),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                      border: Border.all(
                          width: 2, color: Theme.of(context).primaryColor),
                    ),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(user.profileImageUrl),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}

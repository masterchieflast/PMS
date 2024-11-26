import 'package:flutter/material.dart';
import 'package:lab4_5/NFTScreen/ProductEditor.dart';

import '../models/hiveService.dart';

class UserSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        // if (snapshot.connectionState == ConnectionState.waiting) {
        //   return Center(child: CircularProgressIndicator());
        // } else if (!snapshot.hasData ) {
        //   return Center(child: Text("No users available"));
        // }

        final users = HiveService.getAllUsers();
        return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return ListTile(
              title: Text(user.name),
              subtitle: Text(user.role),
              onTap: () {
                HiveService.setCurrentUser(user);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductEditor()),
                );
              },
            );
          },
        );
      }, future: null,
    );
  }
}

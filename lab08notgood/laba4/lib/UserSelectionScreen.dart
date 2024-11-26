import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';
import 'package:laba4/userProvider.dart';

class UserSelectionScreen extends StatefulWidget {
  @override
  _UserSelectionScreenState createState() => _UserSelectionScreenState();
}

class _UserSelectionScreenState extends State<UserSelectionScreen> {
  User? selectedUser;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      setState(() {
        selectedUser = userProvider.currentUser;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Выберите пользователя')),
      body: FutureBuilder<List<User>>(
        future: userProvider.getAllUsers(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final user = snapshot.data![index];
              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.role),
                trailing: selectedUser?.id == user.id
                    ? Icon(Icons.check_circle, color: Colors.green)
                    : null,
                onTap: () async {
                  await userProvider.setCurrentUser(user);
                  setState(() {
                    selectedUser = user;
                  });
                  Navigator.pop(context);
                },
              );
            },
          );
        },
      ),
    );
  }
}

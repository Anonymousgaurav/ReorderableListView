import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(
    debugShowCheckedModeBanner: false,
    home:  ValueKeyPage(),
  );
}

class User {
  final String name;
  final String urlImage;

  const User({
    required this.name,
    required this.urlImage,
  });
}

class ValueKeyPage extends StatefulWidget {
  const ValueKeyPage({Key? key}) : super(key: key);

  @override
  _ValueKeyPageState createState() => _ValueKeyPageState();
}

class _ValueKeyPageState extends State<ValueKeyPage> {
  late List<User> users;

  @override
  void initState() {
    super.initState();

    users = [
      const User(
        name: 'Marcel Abs',
        urlImage:
        'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      ),
      const User(
        name: 'Scarlett Gordon',
        urlImage:
        'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      ),
      const User(
        name: 'Dawn Cohen',
        urlImage:
        'https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Flutter Value Key'),
      centerTitle: true,
    ),
    body: ReorderableListView.builder(
      itemCount: users.length,
      onReorder: (oldIndex, newIndex) => setState(() {
        final index = newIndex > oldIndex ? newIndex - 1 : newIndex;

        final user = users.removeAt(oldIndex);
        users.insert(index, user);
      }),
      itemBuilder: (context, index) {
        final user = users[index];

        return userListTile(index, user);
      },
    ),
  );

  Widget userListTile(int index, User user) => ListTile(
    key: ValueKey(user.name),
    contentPadding:
    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    leading: CircleAvatar(
      backgroundImage: NetworkImage(user.urlImage),
      radius: 30,
    ),
    title: Text(user.name),
  );
}
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_router/auth.dart';
import 'package:url_launcher/link.dart';

class SettingsScreen extends StatefulWidget {
  /// Creates a [SettingsScreen].
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: const Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                    child: SettingsContent(),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

/// The content of a [SettingsScreen].
class SettingsContent extends StatelessWidget {
  /// Creates a [SettingsContent].
  const SettingsContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          ...<Widget>[
            Text(
              'Settings',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: () {
                BookstoreAuthScope.of(context).signOut();
              },
              child: const Text('Sign out'),
            ),
            Link(
              uri: Uri.parse('/book/0'),
              builder: (BuildContext context, FollowLink? followLink) => TextButton(
                onPressed: followLink,
                child: const Text('Go directly to /book/0 (Link)'),
              ),
            ),
            TextButton(
              onPressed: () {
                context.go('/book/0');
              },
              child: const Text('Go directly to /book/0 (GoRouter)'),
            ),
          ].map<Widget>((Widget w) => Padding(padding: const EdgeInsets.all(8), child: w)),
          TextButton(
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Alert!'),
                content: const Text('The alert description goes here.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ),
            ),
            child: const Text('Show Dialog'),
          )
        ],
      );
}
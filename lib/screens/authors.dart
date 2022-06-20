import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_router/data/author.dart';
import 'package:test_router/data/library.dart';
import 'package:test_router/widgets/author_list.dart';

class AuthorsScreen extends StatelessWidget {
  /// Creates an [AuthorsScreen].
  const AuthorsScreen({Key? key}) : super(key: key);

  /// The title of the screen.
  static const String title = 'Authors';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: AuthorList(
          authors: libraryInstance.allAuthors,
          onTap: (Author author) {
            context.go('/author/${author.id}');
          },
        ),
      );
}

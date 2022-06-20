import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_router/data/author.dart';
import 'package:test_router/data/book.dart';
import 'package:test_router/widgets/book_list.dart';

class AuthorDetailsScreen extends StatelessWidget {
  const AuthorDetailsScreen({
    required this.author,
    Key? key,
  }) : super(key: key);

  final Author? author;

  @override
  Widget build(BuildContext context) {
    if (author == null) {
      return const Scaffold(
        body: Center(
          child: Text('No author found.'),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(author!.name),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: BookList(
                books: author!.books,
                onTap: (Book book) => context.go('/book/${book.id}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

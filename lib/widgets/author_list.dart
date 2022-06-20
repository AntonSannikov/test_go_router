import 'package:flutter/material.dart';
import 'package:test_router/data/author.dart';

class AuthorList extends StatelessWidget {
  const AuthorList({
    required this.authors,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final List<Author> authors;

  final ValueChanged<Author>? onTap;

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: authors.length,
        itemBuilder: (BuildContext context, int index) => ListTile(
          title: Text(
            authors[index].name,
          ),
          subtitle: Text(
            '${authors[index].books.length} books',
          ),
          onTap: onTap != null ? () => onTap!(authors[index]) : null,
        ),
      );
}

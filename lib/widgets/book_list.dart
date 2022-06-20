import 'package:flutter/material.dart';
import 'package:test_router/data/book.dart';

class BookList extends StatelessWidget {
  const BookList({
    required this.books,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final List<Book> books;

  final ValueChanged<Book>? onTap;

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: books.length,
        itemBuilder: (BuildContext context, int index) => ListTile(
          title: Text(
            books[index].title,
          ),
          subtitle: Text(
            books[index].author.name,
          ),
          onTap: onTap != null ? () => onTap!(books[index]) : null,
        ),
      );
}

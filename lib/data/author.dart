import 'package:test_router/data/book.dart';

class Author {
  Author({
    required this.id,
    required this.name,
  });

  final int id;

  final String name;

  final List<Book> books = <Book>[];
}

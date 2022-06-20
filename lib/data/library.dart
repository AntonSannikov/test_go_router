import 'package:test_router/data/author.dart';
import 'package:test_router/data/book.dart';

final Library libraryInstance = Library()
  ..addBook(title: 'Left Hand of Darkness', authorName: 'Ursula K. Le Guin', isPopular: true, isNew: true)
  ..addBook(title: 'Too Like the Lightning', authorName: 'Ada Palmer', isPopular: false, isNew: true)
  ..addBook(title: 'Kindred', authorName: 'Octavia E. Butler', isPopular: true, isNew: false)
  ..addBook(title: 'The Lathe of Heaven', authorName: 'Ursula K. Le Guin', isPopular: false, isNew: false);

class Library {
  final List<Book> allBooks = <Book>[];

  final List<Author> allAuthors = <Author>[];

  void addBook({
    required String title,
    required String authorName,
    required bool isPopular,
    required bool isNew,
  }) {
    final Author author = allAuthors.firstWhere(
      (Author author) => author.name == authorName,
      orElse: () {
        final Author value = Author(id: allAuthors.length, name: authorName);
        allAuthors.add(value);
        return value;
      },
    );

    final Book book = Book(
      id: allBooks.length,
      title: title,
      isPopular: isPopular,
      isNew: isNew,
      author: author,
    );

    author.books.add(book);
    allBooks.add(book);
  }

  List<Book> get popularBooks => <Book>[
        ...allBooks.where((Book book) => book.isPopular),
      ];

  List<Book> get newBooks => <Book>[
        ...allBooks.where((Book book) => book.isNew),
      ];
}

import 'package:flutter/material.dart';

class BookstoreAuth extends ChangeNotifier {
  bool _signedIn = false;

  /// Whether user has signed in.
  bool get signedIn => _signedIn;

  /// Signs out the current user.
  Future<void> signOut() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    // Sign out.
    _signedIn = false;
    notifyListeners();
  }

  /// Signs in a user.
  Future<bool> signIn(String username, String password) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));

    // Sign in. Allow any password.
    _signedIn = true;
    notifyListeners();
    return _signedIn;
  }
}

class BookstoreAuthScope extends InheritedNotifier<BookstoreAuth> {
  const BookstoreAuthScope({
    required BookstoreAuth notifier,
    required Widget child,
    Key? key,
  }) : super(key: key, notifier: notifier, child: child);

  static BookstoreAuth of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<BookstoreAuthScope>()!.notifier!;
}

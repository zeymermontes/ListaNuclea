import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ListaTareaFirebaseUser {
  ListaTareaFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

ListaTareaFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ListaTareaFirebaseUser> listaTareaFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<ListaTareaFirebaseUser>(
            (user) => currentUser = ListaTareaFirebaseUser(user));

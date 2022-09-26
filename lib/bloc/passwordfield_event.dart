part of 'passwordfield_bloc.dart';

@immutable
abstract class PasswordFieldEvent {}

class VisiblePasswordEvent extends PasswordFieldEvent {
  bool obscureText;
  VisiblePasswordEvent({required this.obscureText});
}

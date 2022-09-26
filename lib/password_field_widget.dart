import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_bloc/bloc/passwordfield_bloc.dart';
import 'package:provider/provider.dart';

class CustomPasswordTextField extends StatelessWidget {
  CustomPasswordTextField({
    Key? key,
    this.validator,
    this.controller,
    this.textInputType,
    this.hintText,
    this.prefixIcon,
  }) : super(key: key);
  String? Function(String?)? validator;
  TextEditingController? controller;
  TextInputType? textInputType;
  String? hintText;
  Icon? prefixIcon;
  Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    var passwordBloc = Provider.of<PasswordFieldBloc>(context, listen: false);
    return BlocBuilder<PasswordFieldBloc, PasswordFieldState>(
      builder: (context, state) {
        if (state is PasswordVisibleState) {
          return TextFormField(
            validator: validator,
            controller: controller,
            keyboardType: textInputType,
            obscureText: state.isObscureText,
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: prefixIcon,
              suffixIcon: IconButton(
                onPressed: () {
                  if (state.isObscureText) {
                    passwordBloc.add(VisiblePasswordEvent(obscureText: false));
                  } else {
                    passwordBloc.add(VisiblePasswordEvent(obscureText: true));
                  }
                },
                icon: state.isObscureText
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
              ),
              helperText: '',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
          );
        } else {
          return TextFormField(
            validator: validator,
            controller: controller,
            keyboardType: textInputType,
            obscureText: true,
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: prefixIcon,
              suffixIcon: IconButton(
                  onPressed: () {
                    passwordBloc.add(VisiblePasswordEvent(obscureText: false));
                  },
                  icon: Icon(Icons.visibility_off)),
              helperText: '',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
          );
        }
      },
    );
  }
}

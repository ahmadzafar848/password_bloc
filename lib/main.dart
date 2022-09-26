import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_bloc/bloc/passwordfield_bloc.dart';
import 'package:password_bloc/password_field_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PasswordFieldBloc>(
          create: (context) => PasswordFieldBloc(),
        )
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              child: CustomPasswordTextField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password can not be Empty';
                  }
                  if (value.length < 6) {
                    return 'Password min length is 6 Chars';
                  }
                  return null;
                },
                controller: textEditingController,
                textInputType: TextInputType.emailAddress,
                hintText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
            )
          ],
        ),
      ),
    );
  }
}

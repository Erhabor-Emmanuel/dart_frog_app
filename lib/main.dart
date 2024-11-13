import 'package:dart_frog_flutter/receipe.dart';
import 'package:dart_frog_flutter/settings.dart';
import 'package:dart_frog_flutter/signin.dart';
import 'package:dart_frog_flutter/signup.dart';
import 'package:dart_frog_flutter/viewList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_item.dart';
import 'change_password.dart';
import 'chat_room.dart';
import 'custom_provider.dart';
import 'file.dart';
import 'landing.dart';
import 'lists.dart';

CustomProvider customProvider = CustomProvider();

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => CustomProvider())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasklist App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // initialRoute: "/",
      routes: {
        "/": (context) => const Landing(),
        "/signin": (context) => const SignIn(),
        "/signup": (context) => const SignUp(),
        "/lists": (context) => const Lists(),
        ViewList.routeName: (context) => const ViewList(),
        AddItem.routeName: (context) => const AddItem(),
        "/recipe": (context) => const Recipe(),
        "/file": (context) => const FileUpload(),
        "/chat": (context) => const ChatRoom(),
        "/settings": (context) => const Settings(),
        "/changepass": (context) => const ChangePassword()
      },

      debugShowCheckedModeBanner: false,
    );
  }
}



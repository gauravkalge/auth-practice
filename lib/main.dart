import '/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email And Password Login',
      theme: ThemeData(

        primarySwatch: Colors.red,
=======
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String msg = "";
  bool signUp = true;
  String btnText = "SignUp";

  void _register() async {
    final User? fireUser = (await _auth
            .createUserWithEmailAndPassword(
                email: emailController.text.trim(),
                password: passwordController.text.trim())
            .catchError((errMsg) {
      print(errMsg);
      setState(() {
        msg = errMsg.toString();
      });
    }))
        .user;
    if (fireUser != null) {
      setState(() {
        msg = "User Account (${emailController.text}) "
            "\n Created Successfully";
      });
    } else {
      setState(() {
        msg = "Failed to Create User Account \n (${emailController.text})";
      });
    }
  }
// login
  void _login() async {
    final User? user = (await _auth
            .signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    )
            .catchError((errMsg) {
      print(errMsg);
      setState(() {
        msg = errMsg.toString();
      });
    }))
        .user;
    if (user != null) {
      setState(() {
        msg = "User Login Successful!!!";
      });
    } else {
      setState(() {
        msg = "User Login failed!!!)";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        btnText = "SignUp";
                        signUp = true;
                        msg = "";
                      });
                    },
                    child: Text(
                      "SignUp",
                      style: TextStyle(color: Colors.grey, fontSize: 25),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        btnText = "Login";
                        signUp = false;
                        msg = "";
                      });
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.grey, fontSize: 25),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 100,
              ),
              emailTextfield(),
              SizedBox(
                height: 30,
              ),
              passwordTextfield(),
              SizedBox(
                height: 30,
              ),
              signInSignUp(),
              SizedBox(
                height: 50,
              ),
              Text(msg),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}

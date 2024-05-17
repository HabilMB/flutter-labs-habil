import 'package:flutter/material.dart';
import 'package:test_flutter/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController inputUser = TextEditingController();
  TextEditingController inputPassword = TextEditingController();

  String username = '';
  String password = '';
  bool showPassword = true;

  onPressedButton() {
    setState(() {
      username = inputUser.text;
      password = inputPassword.text;
    });
    if (username == "user" && password == "password") {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text("Alert"), content: Text("Wrong password"));
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.fromLTRB(10, kToolbarHeight, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            const Text(
              "Log In",
              style: TextStyle(
                fontSize: 40,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 1),
                      blurRadius: 10,
                    )
                  ]),
              child: Column(
                children: [
                  TextFormField(
                    controller: inputUser,
                    decoration: InputDecoration(hintText: 'Username'),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: inputPassword,
                    obscureText: showPassword,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: InkWell(
                        onTap: (){
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        child: Icon(Icons.remove_red_eye)
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                  setState(() {
                    username = inputUser.text;
                    password = inputPassword.text;
                  });
                },
                child: const Text("Login")),
            Row(
              children: [
                Text("Username: $username",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                const SizedBox(width: 10),
                Text("Password : $password")
              ],
            )
          ],
        ),
      ),
    );
  }
}

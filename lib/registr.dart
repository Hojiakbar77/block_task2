import 'package:block_task2/cart_page.dart';
import 'package:block_task2/regbloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'log_in.dart';

class RegistrPage extends StatefulWidget {
  const RegistrPage({Key? key}) : super(key: key);

  @override
  State<RegistrPage> createState() => _RegistrPageState();
}

class _RegistrPageState extends State<RegistrPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late RegisterBloc registerBloc;

  @override
  void initState() {
    super.initState();
    registerBloc = BlocProvider.of<RegisterBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
    registerBloc.close();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text('Register')),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            return Center(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    regName("Name"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Name cannot be empty';
                          }
                          return null; // Return null if the validation is successful
                        },
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                      ),
                    ),
                    regName("Email"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email cannot be empty';
                          } else if (!isValidEmail(value)) {
                            return 'Please enter a valid email';
                          }
                          return null; // Return null if the validation is successful
                        },
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    regName("Password"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password cannot be empty';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null; // Return null if the validation is successful
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          // Validation passed, continue with your registration logic
                          registerBloc.add(
                            CheckUserEventDetail(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const CardPage(),
                            ),
                          );
                        }
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 15,
                        width: MediaQuery.of(context).size.height / 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Register',
                              textScaleFactor: 2,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('If you have not an account'),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const Login(),
                              ),
                            );
                          },
                          child: const Text(
                            "Log in",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget regName(String name1) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(name1),
      ],
    ),
  );
}

bool isValidEmail(String email) {
  // You can implement your own email validation logic here
  // For a basic example, I'm checking if it contains "@" symbol
  return email.contains('@');
}

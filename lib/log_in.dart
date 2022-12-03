import 'package:block_task2/bloc/login_bloc.dart';
import 'package:block_task2/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late LoginBloc loginBloc;

  @override
  void initState() {
    super.initState();
    loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
    loginBloc.close();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Log in')),
      ),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if(state is CheckUserResult){
              final snackBar = SnackBar(
                content: Text(
                  state.statusCode.toString()
                ),
                action: SnackBarAction(
                  label: "Ok",
                  onPressed: () {},
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          return Center(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  regName("Telefon raqam"),
                  TextFormField(
                    controller: usernameController,
                    // onSaved: (value){
                    //   userName=value!;
                    // },
                    validator: (value) {
                      // if(value!=userName){
                      //   return "UserName not valid";
                      // }
                    },
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  regName("Parol"),
                  TextFormField(
                    controller: passwordController,
                    // onSaved: (value){
                    //   password=value!;
                    // },
                    // validator: (value){
                    //   if(value!=password){
                    //     return "password not valid";
                    //   }
                    // },
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      loginBloc.add(
                        CheckUserEvent(
                          username: usernameController.text,
                          password: passwordController.text,
                        ),
                      );
                      // final isValid = formKey.currentState!.validate();
                      // if (isValid) {
                      //   formKey.currentState!.save();
                      //   final snackBar = SnackBar(
                      //     content: Text(
                      //         "UserName ${MyConst.userName}  password ${MyConst.password}"),
                      //     action: SnackBarAction(
                      //       label: "Ok",
                      //       onPressed: () {},
                      //     ),
                      //   );
                      //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      // }
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
                            'Log in',
                            textScaleFactor: 2,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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

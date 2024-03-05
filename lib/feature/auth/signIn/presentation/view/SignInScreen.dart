import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_social_app/core/enum/enum.dart';
import 'package:mini_social_app/core/widgets/customButtonWidget.dart';
import 'package:mini_social_app/core/widgets/customTextFormWidget.dart';
import 'package:mini_social_app/feature/auth/signIn/presentation/viewModel/bloc/sign_in_bloc.dart';
import 'package:mini_social_app/feature/auth/signUp/presentation/view/signUpScreen.dart';
import 'package:mini_social_app/feature/home/presentation/view/homeScreen.dart';
import 'package:motion_toast/motion_toast.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state.signInRequestState == RequestState.success) {
            MotionToast.success(
              title: const Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              description: const Text("Successfully Login"),
            ).show(context);
            Navigator.pushNamed(context, "/homeScreen");
          } else if (state.signInRequestState == RequestState.erorr) {
            MotionToast.error(
              title: const Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              description: Text(state.signInMessage),
            ).show(context);
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_sharp,
                    size: 80,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Wall Social".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextFormWidget(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your Email";
                        }
                        return null;
                      },
                      hintText: "Email",
                      obSecureText: false,
                      textEditingController: emailController),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormWidget(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your Password";
                        }
                        return null;
                      },
                      hintText: "Password",
                      obSecureText: true,
                      textEditingController: passwordController),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Forgot Passwrod?"),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  state.signInRequestState == RequestState.loading
                      ? const Center(child: CircularProgressIndicator())
                      : CustomButtonWidget(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<SignInBloc>(context).add(
                                  NewSignInEvent(emailController.text,
                                      passwordController.text));
                            }
                          },
                          text: "Login",
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()));
                        },
                        child: const Text(
                          "Register Here",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )),
          );
        },
      ),
    );
  }
}

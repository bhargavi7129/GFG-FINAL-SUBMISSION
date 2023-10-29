import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospitalx/app/pages/login_page/cubit/login_page_cubit.dart';
import 'package:hospitalx/app/pages/login_page/widgets/login_form.dart';
import 'package:hospitalx/app/pages/login_page/widgets/signup_form.dart';

class LoginPageProvider extends StatelessWidget {
  const LoginPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginPageCubit(),
      child: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'Hospital Companion App',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                ),
                const SizedBox(
                  height: 24,
                ),
                BlocBuilder<LoginPageCubit, LoginPageState>(
                  builder: (context, state) {
                    if (BlocProvider.of<LoginPageCubit>(context).isLogin) {
                      return const LoginForm();
                    } else {
                      return const SignupForm();
                    }
                  },
                ),
              ],
            ),
            Positioned(
              bottom: 30,
              right: 30,
              child: FloatingActionButton.extended(
                onPressed: () {
                  BlocProvider.of<LoginPageCubit>(context).switchUserType();
                },
                label: BlocBuilder<LoginPageCubit, LoginPageState>(
                  builder: (context, state) {
                    return Text(
                        '${BlocProvider.of<LoginPageCubit>(context).userTypeString} Login');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

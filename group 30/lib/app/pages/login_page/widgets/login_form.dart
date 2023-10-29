import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospitalx/app/core/utils/helper.dart';
import 'package:hospitalx/app/pages/home_page/home_page.dart';
import 'package:hospitalx/app/pages/login_page/cubit/login_page_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromRGBO(143, 148, 251, .2),
                    blurRadius: 20,
                    offset: Offset(0, 0))
              ]),
          width: Helper.getScreenWidth(context) * 0.75,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade200),
                  ),
                ),
                child: TextField(
                  onChanged: (value) =>
                      BlocProvider.of<LoginPageCubit>(context).setEmail(value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(FluentIcons.mail_16_filled),
                    label: Text('Email'),
                    hintText: 'Enter your email',
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: TextField(
                  onChanged: (value) => BlocProvider.of<LoginPageCubit>(context)
                      .setPassword(value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(FluentIcons.password_16_filled),
                    label: Text('Password'),
                    hintText: 'Enter password',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        BlocListener<LoginPageCubit, LoginPageState>(
          listener: (context, state) {
            if (state.status == LoginStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Something went wrong.'),
                ),
              );
            } else if (state.status == LoginStatus.success) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            } else if (state.status == LoginStatus.loading) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Signing up...'),
                ),
              );
            }
          },
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              backgroundColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.primaryContainer),
            ),
            onPressed: () {
              BlocProvider.of<LoginPageCubit>(context).login();
            },
            child: SizedBox(
              width: Helper.getScreenWidth(context) * 0.535,
              height: 50,
              child: const Center(
                child: Text(
                  'Log In',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ),
        BlocBuilder<LoginPageCubit, LoginPageState>(
          builder: (context, state) {
            if (state.userType == UserType.patient) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Not registered yet?'),
                  TextButton(
                      onPressed:
                          BlocProvider.of<LoginPageCubit>(context).toggleLogin,
                      child: const Text('Sign up'))
                ],
              );
            } else {
              return const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text('Contact admin to register as a doctor'),
                  ),
                ],
              );
            }
          },
        ),
      ],
    );
  }
}

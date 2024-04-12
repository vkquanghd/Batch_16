import 'package:batch_16/signup/bloc/sign_up_cubit.dart';
import 'package:batch_16/signup/bloc/test_sign_up_cubit.dart';
import 'package:batch_16/signup/bloc/test_sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:batch_16/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<SignUpCubit>(
        create: (context) => SignUpCubit(),
        child: _HomeContent(),
      ),
    );
  }
}

// ignore: must_be_immutable
class _HomeContent extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    return Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                'Create Account',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Assets.felmale.image(width: 89, height: 88),
              ),
              Text('Create Account With',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocListener<SignUpCubit, SignUpState>(
                    listener: (context, state) {
                      if (state is SignUpFailed) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Can\'t login with github')));
                      }
                    },
                    child: AccountHolder(
                      image:
                          Assets.icons8Github1201.image(width: 43, height: 43),
                      onTap: () {
                        context.read<SignUpCubit>().signUpWithGithub();
                      },
                    ),
                  ),
                  AccountHolder(
                    image: Assets.icons8Google481.image(width: 43, height: 43),
                    onTap: () {
                      context.read<SignUpCubit>().signUpWithGoogle();
                    },
                  ),
                  AccountHolder(
                    image: Assets.linkedin1.image(width: 43, height: 43),
                    onTap: () {},
                  ),
                ],
              ),
              BlocProvider(
                create: (_) => TestSignUpCubit(),
                child: SignUpForm(),
              ),
              Text('or'),
              BlocBuilder<SignUpCubit, SignUpState>(
                builder: (context, state) {
                  if (state is GoogleSignUpNotSupported) {
                    return const Text('Google sign up not supported');
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ))));
  }
}

class AccountHolder extends StatelessWidget {
  final VoidCallback? onTap;
  final Image image;

  const AccountHolder({
    required this.image,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell // là nhấn vào õng nó in đậm
        (
      onTap: onTap, // Gọi hàm callback khi người dùng nhấn vào
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 40,
              blurStyle: BlurStyle.outer,
              color: Colors.black.withOpacity(0.3),
              offset: Offset(2, 3),
            )
          ],
        ),
        child: image,
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String image;
  final String hint;
  final Function(String) onChanged;

  const CustomTextField({
    super.key,
    required this.image,
    required this.hint,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Image.asset(image, width: 43, height: 43),
          Expanded(
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(2, 2),
                    blurRadius: 40)
              ], color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: TextFormField(
                decoration: InputDecoration(hintText: hint),
                onChanged: onChanged,
              ),
            ),
          )
        ],
      );
}

class IconPasswordFileRow extends StatelessWidget {
  final String image, image2;
  final String hint;
  final Function(String) onChanged;

  const IconPasswordFileRow({
    super.key,
    required this.image,
    required this.image2,
    required this.hint,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Image.asset(image, width: 43, height: 43),
          Expanded(
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(2, 2),
                    blurRadius: 40)
              ], color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: hint,
                  suffixIcon: Image.asset(image2, width: 24, height: 24),
                ),
                onChanged: onChanged,
              ),
            ),
          )
        ],
      );
}

class SignUpForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<TestSignUpCubit, TestSignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Congratulations'),
              content: Text('Please wait a little longer'),
            ),
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomTextField(
                      hint: 'Name',
                      image: Assets.icons8User641.path,
                      onChanged: (value) =>
                          context.read<TestSignUpCubit>().nameChanged(value),
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomTextField(
                      hint: 'Email',
                      image: Assets.email1.path,
                      onChanged: (value) =>
                          context.read<TestSignUpCubit>().emailChanged(value),
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: IconPasswordFileRow(
                      hint: 'Password',
                      image: Assets.icons8Password1001.path,
                      image2: Assets.icons8ShowPassword321.path,
                      onChanged: (value) => context
                          .read<TestSignUpCubit>()
                          .passwordChanged(value),
                    )),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () =>
                  context.read<TestSignUpCubit>().signUpButtonPressed(),
              style: ElevatedButton.styleFrom(
                elevation: 15,
                backgroundColor: Color(0xFF27014A),
              ),
              child: Text('Sign Up', style: TextStyle(color: Colors.white)),
            ),
            BlocBuilder<TestSignUpCubit, TestSignUpState>(
              builder: (context, state) {
                if (state is SignUpError) {
                  return Text(
                    state.errorMessage,
                    style: TextStyle(color: Colors.red),
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}

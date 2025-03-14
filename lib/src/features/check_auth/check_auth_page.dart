import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getoutofthebox/core/common/styles.dart';
import 'package:getoutofthebox/src/features/authorization/bloc/authorization_bloc.dart';

class CheckAuthPage extends StatefulWidget {
  const CheckAuthPage({super.key});

  @override
  State<CheckAuthPage> createState() => _CheckAuthPageState();
}

class _CheckAuthPageState extends State<CheckAuthPage> {
  @override
  Widget build(BuildContext context) {
    context.read<AuthorizationBloc>().add(CheckAuthorizationEvent());
    return BlocListener<AuthorizationBloc, AuthorizationState>(
      listener: (context, state) {
        if (state is AuthorizedState) {
          Navigator.pushReplacementNamed(context, '/homepage');
        } else if (state is UnAuthorizedState) {
          Navigator.pushReplacementNamed(context, '/authorization');
        }
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: StyleManager.mainColor,
          ),
        ),
      ),
    );
  }
}

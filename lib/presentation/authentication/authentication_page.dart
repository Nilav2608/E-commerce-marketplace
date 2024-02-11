import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxestore/presentation/authentication/bloc/auth_page_bloc.dart';
import 'package:fluxestore/presentation/landing_page.dart';
import 'package:fluxestore/presentation/pages/login_page.dart';
import 'package:fluxestore/presentation/pages/sign_up_page.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final AuthPageBloc authPagebloc = AuthPageBloc();
  @override
  void initState() {
    authPagebloc.add(AuthPageInitailEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthPageBloc, AuthPageState>(
      bloc: authPagebloc,
      listenWhen: (previous, current) => current is AuthPageActionState,
      buildWhen: (previous, current) => current is! AuthPageActionState,
      listener: (context, state) {
        switch (state.runtimeType) {
          case ShowSnackBarActionState:
            final snackBarState = state as ShowSnackBarActionState;
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                margin: const EdgeInsets.only(bottom: 5),
                padding: const EdgeInsets.all(10),
                duration: const Duration(milliseconds: 2000),
                behavior: SnackBarBehavior.floating,
                backgroundColor: const Color(0xFF508A7B),
                content: Text(
                  snackBarState.message,
                  style: const TextStyle(color: Colors.white),
                )));
            break;
          case ShowLoadingActionState:
            if(!(state is !RegistrationSuccessState)){
               showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const Center(child: CircularProgressIndicator());
                });
            }
            break;
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case ShowSignUpPageState:
            return SignUpPage(bloc: authPagebloc);
          case ShowLoginPagePageState:
            return LoginPage(bloc: authPagebloc);
          case AuthenticationSuccesState:
            return const LandingPage();
        }
        return const SizedBox();
      },
    );
  }
}

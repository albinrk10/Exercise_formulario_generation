import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import '../ui.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Registro de usuario'),
          centerTitle: true,
          ),
      body: SingleChildScrollView(
        child: Center(
          child: UserRegisterWidget(extraParameter: 'extraParameter'),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     final userRegisterViewModel = GetIt.I<
      //         StateNotifierProvider<UserRegisterViewModel,
      //             UserRegisterState>>();

      //     ref.read(userRegisterViewModel.notifier).register(
      //         'username', 'password', 'email', 'firstName', 'lastName');
      //   },
      //   tooltip: 'Register',
      //   child: const Icon(Icons.search),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

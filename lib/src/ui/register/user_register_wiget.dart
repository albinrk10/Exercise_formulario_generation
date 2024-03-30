import 'package:exercise_1/src/domain/dto/user_register_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_library/shared_library.dart';
import '../ui.dart';

// ignore: must_be_immutable
class UserRegisterWidget
    extends BaseWidget<UserRegisterViewModel, UserRegisterState> {
  UserRegisterWidget({
    Key? key,
    required String extraParameter,
  }) : super(key: key, extraParameter: extraParameter) {
    super.currentState = const UserRegisterState.initial();
  }
  bool hasNavigated = false;
  @override
  void onResume() {
    super.onResume();
    print("onFocusLost - onResume");
  }

  @override
  void onPause() {
    super.onPause();
    print("onFocusGained - onPause");
  }

  @override
  Widget buildWidget(BuildContext context, String extraParameter, WidgetRef ref,
      UserRegisterState renderState) {
    return renderState.when(
        initial: () => buildForm(context),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: () => const Text("error"),
        data: (UserRegisterDTO content) {
          {
            if (!hasNavigated) {
              Future(() {
                viewModel.register(content.username, content.password,
                    content.email, content.firstName, content.lastName);
                context.push(
                    '/happy/username/${content.username}/lastName/${content.lastName}');
                hasNavigated = true;
              });
            }
            return const Center();
          }
        });
  }

  Widget buildForm(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String username = '';
    String password = '';
    String email = '';
    String firstName = '';
    String lastName = '';

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(labelText: 'Username'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingrese su username';
              }
              return null;
            },
            onSaved: (value) {
              username = value!;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingrese su password';
              }
              return null;
            },
            onSaved: (value) {
              password = value!;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingrese su email';
              }
              return null;
            },
            onSaved: (value) {
              email = value!;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Nombre'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingrese su nombre';
              }
              return null;
            },
            onSaved: (value) {
              firstName = value!;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Apellido'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingrese su apellido';
              }
              return null;
            },
            onSaved: (value) {
              lastName = value!;
            },
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 50,
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  viewModel.register(
                      username, password, email, firstName, lastName);
                }
              },
              child: const Text('Registrar'),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 50,
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Muy Pronto!'),
                      content: const Text(
                          'Estara habilitado para usar el aplicativo'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Cerrar'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Validar'),
            ),
          ),
        ],
      ),
    );
  }
}

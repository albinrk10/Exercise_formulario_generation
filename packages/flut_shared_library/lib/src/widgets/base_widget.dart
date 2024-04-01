import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focus_detector_v2/focus_detector_v2.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

/**
 * Created by Kane Baltazar on 20/03/2024.
 * 
 * La clase ViewModel<T> es una clase abstracta orientada a proporcionar capacidades 
 * de ViewModel a las clases que la implementen en una aplicación Flutter. 
 * Está diseñada para gestionar estados cerrados y permitir la comunicación entre la 
 * capa de presentación y la capa de lógica de negocios de la aplicación. 
 */
abstract class ViewModel<T> extends StateNotifier<T> {
  ViewModel(super.state);
  final logger = Logger();

  void sendValue(T data) {
    state = data;
  }
}

/**
 * Created by Kane Baltazar on 20/03/2024.
 * 
 * La clase BaseWidget es una clase abstracta que sirve como una base para otros widgets en Flutter. 
 * Proporciona funcionalidades comunes para la gestión de estados y eventos en los widgets de la aplicación.
 * Además, se está empleando el uso de operadores genéricos para asegurar la consistencia y uniformidad
 * de las clases widgets q lo implement.
 * 
 * T : ViewModel extends StateNotifier<*DomainClass*>
 * K : DomainClass
 */
abstract class BaseWidget<T extends ViewModel<K>, K> extends ConsumerWidget {
  final String extraParameter;
  late WidgetRef ref;
  late K currentState;
  late StateNotifierProvider<T, K> provider;

  BaseWidget({Key? key, required this.extraParameter}) : super(key: key) {
    this.provider = GetIt.I<StateNotifierProvider<T, K>>();
  }

  void onResume() {}

  void onPause() {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    this.ref = ref;
    this.currentState = ref.watch(provider); // cast to LCE State
    return FocusDetector(
        onFocusLost: () => onPause(),
        onFocusGained: () => onResume(),
        child: buildWidget(context, extraParameter, ref, this.currentState));
  }

  Widget buildWidget(BuildContext context, String extraParameter, WidgetRef ref,
      K renderState);

  void onLoading(bool isStarted) {}

  T get viewModel => this.ref.read(this.provider.notifier);
}

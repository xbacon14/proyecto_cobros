// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'printer_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PrinterController on _PrinterControllerBase, Store {
  final _$connectedAtom = Atom(name: '_PrinterControllerBase.connected');

  @override
  bool get connected {
    _$connectedAtom.reportRead();
    return super.connected;
  }

  @override
  set connected(bool value) {
    _$connectedAtom.reportWrite(value, super.connected, () {
      super.connected = value;
    });
  }

  final _$pathImageAtom = Atom(name: '_PrinterControllerBase.pathImage');

  @override
  String get pathImage {
    _$pathImageAtom.reportRead();
    return super.pathImage;
  }

  @override
  set pathImage(String value) {
    _$pathImageAtom.reportWrite(value, super.pathImage, () {
      super.pathImage = value;
    });
  }

  @override
  String toString() {
    return '''
connected: ${connected},
pathImage: ${pathImage}
    ''';
  }
}

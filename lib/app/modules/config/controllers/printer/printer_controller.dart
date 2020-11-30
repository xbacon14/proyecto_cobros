import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:mobx/mobx.dart';

import '../../../../app_controller.dart';

part 'printer_controller.g.dart';

class PrinterController = _PrinterControllerBase with _$PrinterController;

abstract class _PrinterControllerBase with Store {
  var printer = const MethodChannel('com.example.proyecto_cobros/printer');

  @observable
  bool connected = false;

  @observable
  String pathImage;

  Future<List<int>> compresFotoListInt(
      List<int> list, int minWidth, int minHeight) async {
    var result = await FlutterImageCompress.compressWithList(
      list,
      minWidth: minWidth,
      minHeight: minHeight,
    );
    return result;
  }

  //IMPRESORA SUNMI
  void printerInit() async {
    await printer.invokeMethod('printerInit');
  }

  void printText(String text) async {
    lineWrap(1);
    await printer.invokeMethod('printText', {
      'text': text,
    });
  }

  void lineWrap(int n) async {
    await printer.invokeMethod('lineWrap', {
      'n': n,
    });
  }

  void setAlignment(int aligment) async {
    // 0 - LEFT
    // 1 - CENTER
    // 2 - RIGHT
    await printer.invokeMethod('setAlignment', {
      'aligment': aligment,
    });
  }

  void setFontSize(int fontsize) async {
    await printer.invokeMethod('setFontSize', {
      'fontsize': fontsize,
    });
  }

  void printTextWithFont(
    String text,
    String typeface,
    int fontsize,
    int aligment,
  ) async {
    setAlignment(aligment);
    await printer.invokeMethod('printTextWithFont', {
      'text': text,
      'typeface': typeface,
      'fontsize': fontsize,
    });
  }

  void printTextCustomTitle(
    String text,
    int fontSize,
    int aligment,
  ) async {
    setFontSize(40);
    await printer.invokeMethod('printColumnsText', {
      'colsTextArr': [text],
      'colsWidthArr': [20],
      'colsAlign': [aligment],
    });
  }

  void printTextCustomSubTitle(
    String text,
    int fontSize,
    int aligment,
  ) async {
    setFontSize(25);
    await printer.invokeMethod('printColumnsText', {
      'colsTextArr': [text],
      'colsWidthArr': [30],
      'colsAlign': [aligment],
    });
  }

  void printColumnsText(
    List<String> colsTextArr,
    List<int> colsWidthArr,
    List<int> colsAlign,
  ) async {
    await printer.invokeMethod('printColumnsText', {
      'colsTextArr': colsTextArr,
      'colsWidthArr': colsWidthArr,
      'colsAlign': colsAlign,
    });
  }

  void printBitmap(String asset) async {
    //mayor tamanho admitido es 384x384
    //mayor tamanho optimo   es 384x192

    ByteData bytes = await rootBundle.load(asset);
    var buffer = bytes.buffer;
    var m = base64.encode(Uint8List.view(buffer));

    await printer.invokeMethod('printBitmap', {
      'bitMap': m,
    });
  }

  void printBarCode(String data, int symbology, int height, int width,
      int textposition) async {
    await printer.invokeMethod('printBarCode', {
      'data': data,
      'symbology': symbology,
      'height': height,
      'width': width,
      'textposition': textposition,
    });
  }

  void printQRCode(String data, int modulesize, int errorlevel) async {
    await printer.invokeMethod('printBarCode', {
      'data': data,
      'modulesize': modulesize,
      'errorlevel': errorlevel,
    });
  }

  void cutPaper() async {
    await printer.invokeMethod('cutPaper');
  }

  void getPrintedLength() async {
    await printer.invokeMethod('getPrintedLength');
  }

  void printDivider() {
    printTextWithFont('-----------------------------', '', 25, 1);
  }
}

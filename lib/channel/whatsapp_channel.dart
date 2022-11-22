import 'package:flutter/services.dart';

class WhatsappChannel {
  static const platform = MethodChannel("channel.flutter/whatsapp");

  static WhatsappChannel? _instance;

  static WhatsappChannel get instance {
    return _instance ?? WhatsappChannel();
  }

  Future<void> sendWhatsppMsg(String contactNo, String msg) async {
    try {
      await platform
          .invokeMethod('sendMsg', {'contactNo': contactNo, 'msg': msg});
    } on PlatformException catch (e) {
      print(e.message);
    }
  }
}

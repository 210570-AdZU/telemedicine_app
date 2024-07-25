import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:layout_design/models/chat_room_model.dart';
import 'package:file_picker/file_picker.dart';

class ChatRoomController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  File? selectedFile;

  // Correctly initialize RxList with initial values
  RxList<Message> messages = RxList<Message>([
    Message(
      text: "test",
      date: DateTime.now().subtract(Duration(days: 3, minutes: 1)),
      sentByMe: false,
    ),
    Message(
      text: "test2",
      date: DateTime.now().subtract(Duration(days: 3, minutes: 1)),
      sentByMe: true,
    ),
    Message(
      text: "test3",
      date: DateTime.now().subtract(Duration(days: 3, minutes: 1)),
      sentByMe: false,
    ),
    Message(
      text: "testi",
      date: DateTime.now().subtract(Duration(days: 2, minutes: 1)),
      sentByMe: true,
    ),
    Message(
      text: "testa",
      date: DateTime.now().subtract(Duration(days: 2, minutes: 1)),
      sentByMe: false,
    ),
    Message(
      text: "testu",
      date: DateTime.now().subtract(Duration(days: 2, minutes: 1)),
      sentByMe: false,
    ),
    Message(
      text: "testaw",
      date: DateTime.now().subtract(Duration(days: 2, minutes: 1)),
      sentByMe: false,
    ),
    Message(
      text: "testay",
      date: DateTime.now().subtract(Duration(days: 1, minutes: 1)),
      sentByMe: false,
    ),
    Message(
      text: "testiw",
      date: DateTime.now().subtract(Duration(days: 0, minutes: 3)),
      sentByMe: true,
    ),
    Message(
      text: "testuy",
      date: DateTime.now().subtract(Duration(days: 0, minutes: 2)),
      sentByMe: true,
    ),
    Message(
      text: "teste",
      date: DateTime.now().subtract(Duration(days: 0, minutes: 1)),
      sentByMe: false,
    ),
  ]);

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }

  void sendMessage(String text, {File? file, String? fileName}) {
    final message = Message(
      text: text,
      date: DateTime.now(),
      sentByMe: true,
      file: file,
      fileName: fileName,
    );
    messages.add(message);
    textEditingController.clear();
  }

  void attachFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      sendMessage("File: ${result.files.single.name}", file: file, fileName: result.files.single.name);
    }
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({super.key});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class Message {
  final String text;
  final DateTime date;
  final bool sentByMe;
  final File? file;
  final String? fileName;

  const Message({
    required this.text,
    required this.date,
    required this.sentByMe,
    this.file,
    this.fileName,
  });
}


class _ChatRoomState extends State<ChatRoom> {
  List<Message> messages = [
    Message(
      text: "test",
      date: DateTime.now().subtract(
        Duration(days: 3, minutes: 1)
      ),
      sentByMe: false
    ),
    Message(
      text: "test2",
      date: DateTime.now().subtract(
        Duration(days: 3, minutes: 1)
      ),
      sentByMe: true
    ),
    Message(
      text: "test3",
      date: DateTime.now().subtract(
        Duration(days: 3, minutes: 1)
      ),
      sentByMe: false
    ),
    Message(
      text: "testi",
      date: DateTime.now().subtract(
        Duration(days: 2, minutes: 1)
      ),
      sentByMe: true
    ),
    Message(
      text: "testa",
      date: DateTime.now().subtract(
        Duration(days: 2, minutes: 1)
      ),
      sentByMe: false
    ),
    Message(
      text: "testu",
      date: DateTime.now().subtract(
        Duration(days: 2, minutes: 1)
      ),
      sentByMe: false
    ),
    Message(
      text: "testaw",
      date: DateTime.now().subtract(
        Duration(days: 2, minutes: 1)
      ),
      sentByMe: false
    ),
    Message(
      text: "testay",
      date: DateTime.now().subtract(
        Duration(days: 1, minutes: 1)
      ),
      sentByMe: false
    ),
    Message(
      text: "testiw",
      date: DateTime.now().subtract(
        Duration(days: 0, minutes: 3)
      ),
      sentByMe: true
    ),
    Message(
      text: "testuy",
      date: DateTime.now().subtract(
        Duration(days: 0, minutes: 2)
      ),
      sentByMe: true
    ),
    Message(
      text: "teste",
      date: DateTime.now().subtract(
        Duration(days: 0, minutes: 1)
      ),
      sentByMe: false
    ),
  ].toList();
  
  TextEditingController _textEditingController = TextEditingController();
  File? selectedFile;

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

void sendMessage(String text, {File? file, String? fileName}) {
  final message = Message(
    text: text,
    date: DateTime.now(),
    sentByMe: true,
    file: file,
    fileName: fileName,
  );
  setState(() {
    messages.add(message);
    _textEditingController.clear();
  });
}

void attachFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null) {
    File file = File(result.files.single.path!);
    sendMessage("File: ${result.files.single.name}", file: file, fileName: result.files.single.name);
  }
}


  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      actions: [
        IconButton(
          onPressed: (){},
          icon: Icon(
            Icons.video_camera_back,
            color: Colors.blueGrey,
          )
        )
      ],
    ),
    body: Column(
      children: [
        Expanded(
          child: GroupedListView<Message, DateTime>(
            padding: EdgeInsets.all(8),
            reverse: true,
            order: GroupedListOrder.DESC,
            useStickyGroupSeparators: true,
            floatingHeader: true,
            elements: messages,
            groupBy: (message) => DateTime(
              message.date.year,
              message.date.month,
              message.date.day,
            ),
            groupHeaderBuilder: (Message message) => SizedBox(
              height: 40,
              child: Center(
                child: Card(
                  color: Colors.blueGrey,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      DateFormat.yMMMd().format(message.date),
                      style: TextStyle(
                        color: Colors.white
                      )
                    ),
                  ),
                ),
              ),
            ),
            itemBuilder: (context, Message message) {
              if (message.file != null) {
                return Align(
                  alignment: message.sentByMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Card(
                    elevation: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: message.sentByMe ? Colors.blueGrey : Colors.white,
                        borderRadius: message.sentByMe
                            ? BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              )
                            : BorderRadius.only(
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              message.fileName!,
                              style: TextStyle(
                                color: message.sentByMe ? Colors.white : Colors.black,
                              ),
                            ),
                            if (message.fileName!.endsWith('.png') || message.fileName!.endsWith('.jpg'))
                              Image.file(
                                message.file!,
                                width: MediaQuery.of(context).size.width * 0.5,
                                fit: BoxFit.cover,
                              )
                            else if (message.fileName!.endsWith('.pdf'))
                              Text("PDF file") // Add your PDF rendering code here
                            else
                              Text("File cannot be previewed"), // For other file types
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return Align(
                  alignment: message.sentByMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Card(
                    elevation: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: message.sentByMe ? Colors.blueGrey : Colors.white,
                        borderRadius: message.sentByMe
                          ? BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            )
                          : BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          message.text,
                          style: TextStyle(
                            color: message.sentByMe ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
            }
          ),
        ),
        Divider(height: 0,),
        Container(
          color: Colors.white,
          height: 56,
          child: Row(
            children: [
              IconButton(
                onPressed: (){
                  attachFile();
                },
                icon: Icon(Icons.attach_file)
              ),
              IconButton(
                onPressed: (){
                },
                icon: Icon(Icons.camera_alt)
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    isCollapsed: true,
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none
                    ),
                    contentPadding: EdgeInsets.all(12),
                    hintText: 'Type your message here...'
                  ),
                  onSubmitted: (text) {
                    sendMessage(text);
                  },
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  if (_textEditingController.text.isNotEmpty) {
                    sendMessage(_textEditingController.text);
                  }
                },
                icon: Icon(Icons.send),
              )
            ],
          ),
        )
      ],
    ),
  );
}
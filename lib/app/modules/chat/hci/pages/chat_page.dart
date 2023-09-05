import 'package:autonoma/app/modules/chat/infra/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../stores/chat_store.dart';

class ChatPage extends StatefulWidget {
  final String id;
  const ChatPage({super.key, required this.id});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ChatStore store = Modular.get<ChatStore>();
  @override
  void initState() {
    store.getChat(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<QuerySnapshot>(
        stream: store.state,
        builder: (context, snapshot) {
          return Chat(
            messages: buscarMensagens(snapshot.data),
            onSendPressed: (value) {
              store.sendMessage(
                widget.id,
                MessageModel(
                  author: 'Kristhyan',
                  data: value.text,
                  timestamp: Timestamp.now(),
                ),
              );
            },
            user: const types.User(id: '12'),
          );
        },
      ),
    );
  }

  List<types.Message> buscarMensagens(QuerySnapshot? query) {
    if (query != null) {
      return query.docs.map((DocumentSnapshot item) {
        return types.TextMessage(
          id: item.id,
          author: const types.User(id: '1'),
          text: item.get('data'),
        );
      }).toList();
    }
    return [];
  }
}

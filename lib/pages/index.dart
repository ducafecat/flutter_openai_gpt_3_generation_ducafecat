import 'package:flutter/material.dart';

import '../utils/wp_http.dart';

class GenIndexPage extends StatefulWidget {
  const GenIndexPage({super.key});

  @override
  State<GenIndexPage> createState() => _GenIndexPageState();
}

class _GenIndexPageState extends State<GenIndexPage> {
  String choices = "";
  TextEditingController promptController =
      TextEditingController(text: "用 dart 语言写个 dio 的单例程序");
  TextEditingController choicesController = TextEditingController();

  // 语义处理
  Widget buildTextGen() {
    return Column(
      children: [
        // 文字输入框
        LimitedBox(
          maxHeight: 200,
          child: TextField(
            controller: promptController,
            maxLines: null,
            decoration: const InputDecoration(
              hintText: '请输入文字',
            ),
          ),
        ),

        // 按钮
        ElevatedButton(
          onPressed: () async {
            var res = await DioHttpUtil().post("/completions", data: {
              "model": "text-davinci-003",
              "prompt": promptController.text,
              "temperature": 1,
              "max_tokens": 1024,
            });
            // print(res);
            if (res.data["choices"] != null) {
              choicesController.text = res.data["choices"][0]["text"];
              // setState(() {
              //   choices = res.data["choices"][0]["text"];
              //   choicesController.text = choices;
              // });
            }
          },
          child: const Text("语义处理"),
        ),

        // 显示 json 数据
        Expanded(
          child: TextField(
            controller: choicesController,
            maxLines: null,
            decoration: const InputDecoration(
              hintText: '显示数据',
            ),
          ),
        ),
      ],
    );
  }

  Widget buildView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: buildTextGen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OpenAI 生成工具"),
      ),
      body: buildView(),
    );
  }
}

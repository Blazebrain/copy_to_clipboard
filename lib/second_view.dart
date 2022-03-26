import 'package:copy_to_clipboard/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SecondView extends StatelessWidget {
  const SecondView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController diaryTextEditingController = TextEditingController();
    TextEditingController diaryTwoTextEditingController =
        TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Second View'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              const Text(
                'Implementing Copy-To-Clipboard Without Dependencies',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: diaryTextEditingController,
                decoration: const InputDecoration(
                  labelText: 'Enter diary input for today',
                  border: OutlineInputBorder(),
                ),
              ),
              TextButton(
                onPressed: () async {
                  Clipboard.setData(
                          ClipboardData(text: diaryTextEditingController.text))
                      .then(
                    (value) {
                      return ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Text Copied'),
                        ),
                      );
                    },
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                child: const Text(
                  'Copy',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Copied text would appear here',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: diaryTwoTextEditingController,
                decoration: const InputDecoration(
                  labelText: 'Pasted text will appear below',
                  border: OutlineInputBorder(),
                ),
              ),
              TextButton(
                onPressed: () async {
                  Clipboard.getData('text/plain').then(
                    (value) {
                      diaryTwoTextEditingController.text = value!.text!;
                    },
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                child: const Text(
                  'Paste',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

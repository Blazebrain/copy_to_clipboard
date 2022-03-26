import 'package:clipboard/clipboard.dart';
import 'package:copy_to_clipboard/second_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController diaryControllerWithPackageOne =
        TextEditingController();
    TextEditingController diaryControllerWithPackageTwo =
        TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Diary App'),
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
                'Implementing Copy-To-Clipboard With Dependencies: Clipboard Package',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: diaryControllerWithPackageOne,
                decoration: const InputDecoration(
                  labelText: 'Enter diary input for today',
                  border: OutlineInputBorder(),
                ),
              ),
              TextButton(
                onPressed: () async {
                  FlutterClipboard.copy(diaryControllerWithPackageOne.text)
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
                'Pasted text would appear below',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: diaryControllerWithPackageTwo,
                decoration: const InputDecoration(
                  labelText: 'Pasted text will appear here',
                  border: OutlineInputBorder(),
                ),
              ),
              TextButton(
                onPressed: () async {
                  FlutterClipboard.paste().then(
                    (value) => diaryControllerWithPackageTwo.text = value,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecondView(),
                    ),
                  );
                },
                child: const Text('Go To Second View'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

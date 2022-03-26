import 'package:clipboard/clipboard.dart';
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
                'Implementing Copy-To-Clipboard With Dependencies: Clippy',
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
                  FlutterClipboard.copy(diaryControllerWithPackageOne.text);
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
                      builder: (context) => const HomeView(),
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

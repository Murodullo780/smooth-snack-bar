import 'package:flutter/material.dart';
import '../smooth_snack_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SmoothSnackBar Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const SmoothSnackBarTest(),
    );
  }
}

class SmoothSnackBarTest extends StatelessWidget {
  const SmoothSnackBarTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SmoothSnackBar Demo'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            spacing: 12,
            children: [
              _buildSectionTitle('Position'),
              _buildButton(
                context,
                title: 'Show from Bottom (Default)',
                onPressed: () =>
                    SmoothSnackBar.show(context, title: 'This is a message from the bottom'),
              ),
              _buildButton(
                context,
                title: 'Show from Top',
                onPressed: () => SmoothSnackBar.show(
                  context,
                  title: 'This is a message from the top',
                  fromTop: true,
                ),
              ),

              _buildSectionTitle('Types and Icons'),
              _buildButton(
                context,
                title: 'Success',
                onPressed: () => SmoothSnackBar.show(
                  context,
                  title: 'Operation completed successfully!',
                  icon: SnackBarType.success,
                ),
              ),
              _buildButton(
                context,
                title: 'Warning',
                onPressed: () => SmoothSnackBar.show(
                  context,
                  title: 'Be careful, there might be an error',
                  icon: SnackBarType.warning,
                ),
              ),
              _buildButton(
                context,
                title: 'Danger',
                onPressed: () => SmoothSnackBar.show(
                  context,
                  title: 'A critical error has occurred!',
                  isDanger: true,
                ),
              ),

              _buildSectionTitle('Additional Options'),
              _buildButton(
                context,
                title: 'With Action Button',
                onPressed: () => SmoothSnackBar.show(
                  context,
                  title: 'Data has been deleted',
                  button: MessageButton(
                    title: 'Undo',
                    function: () {
                      debugPrint('Undo pressed');
                    },
                  ),
                ),
              ),
              _buildButton(
                context,
                title: 'Custom Title Widget',
                onPressed: () => SmoothSnackBar.show(
                  context,
                  title: '', // Ignored when onTitle is provided
                  onTitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text('Custom Title', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                        'You can have multiple lines of text here.',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              _buildButton(
                context,
                title: 'Long Duration (10 sec)',
                onPressed: () => SmoothSnackBar.show(
                  context,
                  title: 'I will stay for 10 seconds',
                  duration: const Duration(seconds: 10),
                ),
              ),
              _buildButton(
                context,
                title: 'Non-dismissible',
                onPressed: () => SmoothSnackBar.show(
                  context,
                  title: 'You cannot swipe me away',
                  isDismissible: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }

  Widget _buildButton(
      BuildContext context, {
        required String title,
        required VoidCallback onPressed,
      }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}

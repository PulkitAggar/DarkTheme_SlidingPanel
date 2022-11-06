import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/provider/theme_provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../main.dart';
import '../widget/change_theme_button_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? 'DarkTheme'
        : 'LightTheme';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(MyApp.title),
        actions: [
          ChangeThemeButtonWidget(),
        ],
      ),
      body: SlidingUpPanel(
        backdropEnabled: true, 
        color: Colors.transparent, 
        panel: Container(
          decoration: const BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0),),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              BarIndicator(),
              Center(
                child: Text("This is the sliding Widget",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        collapsed: Container(
          decoration: const BoxDecoration(
            
            color: Colors.orange,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0),),
          ),
          child: Column(
            children: const [
              BarIndicator(),
              Center(
                child: Text("This is the collapsed Widget",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        /// widget behind panel
        body: Text(
          'Hello $text!',
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),),)
    );
  }
}

class BarIndicator extends StatelessWidget {
  const BarIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: 40, height: 3,
        decoration: const BoxDecoration(
          color: Colors.white60,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
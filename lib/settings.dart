import 'barrel.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Settings"),
          backgroundColor: Colors.blue[300],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: const [
                  Text('Dark Mode',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w300)),
                  ChangeThemeButtonWidget(),
                ],
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ));
  }
}

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch.adaptive(
        value: themeProvider.isDarkMode,
        onChanged: (value) {
          final provider = Provider.of<ThemeProvider>(context, listen: false);
          provider.toggleTheme(value);
        });
  }
}

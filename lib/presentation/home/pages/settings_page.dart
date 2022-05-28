part of home;

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: const Text('back'),
        onPressed: () {
          Get.back();
        },
      ),
    );
  }
}

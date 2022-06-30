import 'package:flutter/material.dart';
import 'package:platform_settings_ui/platform_settings_ui.dart';

class LanguageSetting extends StatelessWidget {
  const LanguageSetting({Key? key}) : super(key: key);


  // =>
  // setState(() {
  // groupValue = value;
  // })

  @override
  Widget build(BuildContext context) {
    List<String> subTitle = ["French", "English", "Spanish"];
    int groupValue = 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Text('Language Setting'),
      ),
      body: SettingsList(
        children: [
          SettingsSection(
            title: "Language",
            children: [
              SettingsTile(
                title: "Language",
                subTitle: subTitle[groupValue],
                icon: const Icon(Icons.language,size: 35,),
                showChevron: true,
                editType: EditType.list,
                listEditTypeView: ListEditTypeView(
                  title: "Language",
                  groupValue: groupValue,
                  onChanged: (value) {},
                  children: [
                    ListEditTile<int>(
                        title: Text("🇫🇷 ${subTitle[0]}"), value: 0),
                    ListEditTile<int>(
                        title: Text("🇬🇧 ${subTitle[1]}"), value: 1),
                    ListEditTile<int>(
                        title: Text("🇪🇸 ${subTitle[2]}"), value: 2),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_templates_widgets/constants/constants.dart';
import 'package:ui_templates_widgets/widgets/custom_radio_list_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MainSection(),
    );
  }
}

class MainSection extends StatefulWidget {
  const MainSection({Key? key}) : super(key: key);

  @override
  State<MainSection> createState() => _MainSectionState();
}

class _MainSectionState extends State<MainSection>
    with AutomaticKeepAliveClientMixin {
  int _value = 1;
  String? _url;
  double width = 375;
  double height = 667;
  bool isVisibleDemo = true;
  bool isVisibleCode = false;

  @override
  void initState() {
    super.initState();
    _url = 'https://dineshmaharjan.github.io/#/';
    final IFrameElement _iframeElement = IFrameElement()
      ..src = _url
      ..id = 'iframe'
      ..style.border = 'none';
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iframeElement,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter UI'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 64,
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    border: Border.all(color: Colors.black)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Component Title",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedOpacity(
                            opacity: isVisibleDemo?1:0,
                            duration: const Duration(milliseconds: 600),
                            child: Container(
                              child: Visibility(
                                visible: isVisibleDemo,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomRadioListTile<int>(
                                        value: 1,
                                        groupValue: _value,
                                        title: const Text('Mobile'),
                                        leading: Icons.phone_android,
                                        onChanged: (value) {
                                          setState(() {
                                            _value = value!;
                                            width = 375;
                                            height = 667;
                                          });
                                        }),
                                    CustomRadioListTile<int>(
                                        value: 2,
                                        leading: Icons.tablet_android,
                                        groupValue: _value,
                                        title: const Text('Tablet'),
                                        onChanged: (value) {
                                          setState(() {
                                            _value = value!;
                                            width = 768;
                                            height = 1024;
                                          });
                                        }),
                                    CustomRadioListTile<int>(
                                        leading: Icons.desktop_mac,
                                        value: 3,
                                        groupValue: _value,
                                        title: const Text('Desktop'),
                                        onChanged: (value) {
                                          setState(() {
                                            _value = value!;
                                            width = 1280;
                                            height = 800;
                                          });
                                        }),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isVisibleCode = false;
                          isVisibleDemo = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isVisibleCode
                              ? Colors.green[500]
                              : Colors.transparent,
                          borderRadius: const BorderRadius.all(
                            ui.Radius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Preview',
                          style: TextStyle(
                              color:
                                  isVisibleCode ? Colors.green : Colors.black),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isVisibleDemo = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: isVisibleCode
                                ? Colors.green[500]
                                : Colors.transparent,
                            borderRadius:
                                const BorderRadius.all(ui.Radius.circular(8))),
                        child: Text(
                          'Code',
                          style: TextStyle(
                              color:
                                  isVisibleCode ? Colors.green : Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              isVisibleDemo
                  ? SizedBox(
                      height: height,
                      width: width,
                      child: const HtmlElementView(viewType: 'iframeElement'),
                    )
                  : SizedBox(
                      height: height / 2,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                Clipboard.setData(
                                    ClipboardData(text: demoCode));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Copied"),
                                ));
                              },
                              child: const Icon(Icons.copy_all),
                            ),
                          ),
                          Center(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Flexible(
                                child: Text(
                                  demoCode,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

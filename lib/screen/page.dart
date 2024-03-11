import 'package:flutter/material.dart';

class CustomIcon {
  final String imagePath;
  final String label;
  final Widget page; // Page class to navigate to

  CustomIcon(
      {required this.imagePath, required this.label, required this.page});
}

class MyPage extends StatelessWidget {
  final List<CustomIcon> customIcons = [
    CustomIcon(imagePath: 'assets/icon1.png', label: 'Icon 1', page: Page1()),
    CustomIcon(imagePath: 'assets/icon2.png', label: 'Icon 2', page: Page2()),
    CustomIcon(imagePath: 'assets/icon3.png', label: 'Icon 3', page: Page3()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Icons'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              children: customIcons.map((icon) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => icon.page));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          icon.imagePath,
                          width: 50,
                          height: 40,
                        ),
                        SizedBox(height: 5),
                        Text(
                          icon.label,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Center(
        child: Text('This is the content of Page 1'),
      ),
    );
  }
}

//
class Page2 extends StatelessWidget {
  // ... Define content for Page 2
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Center(
        child: Text('This is the content of Page 2'),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  // ... Define content for Page 3
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 3'),
      ),
      body: Center(
        child: Text('This is the content of Page 3'),
      ),
    );
  }
}

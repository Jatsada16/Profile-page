import 'package:flutter/material.dart';
import 'package:my_project/DetailPage.dart';
import 'package:my_project/student.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyAppPage(),
    );
  }
}

class MyAppPage extends StatelessWidget {
  const MyAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Student> datas = [
      Student("เจษฎา ลีรัตน์", "643450067-0", "images/1.jpg", "jatsada.l@kkumail.com", "https://www.facebook.com/pat.loveasd"),
      Student("ธนาธิป เตชะ", "643450076-9", "images/2.jpg", "thanathip.t@kkumail.com", "https://www.facebook.com/profile.php?id=100011086212292"),
      Student("พีระเดช โพธิ์หล้า", "643450082-4", "images/3.jpg", "peeradech.p@kkumail.com", "https://www.facebook.com/peeradech8888"),
      Student("วิญญู พรมภิภักดิ์", "643450084-0", "images/4.jpg", "winyu.p@kkumail.com", "https://www.facebook.com/profile.php?id=100014625613598"),
      Student("เทวารัณย์ ชัยกิจ", "643450324-6", "images/5.jpg", "tewaran.c@kkumail.com", "https://www.facebook.com/rungoodnam"),
      Student("ณัฐกานต์ อินทรพานิชย์", "643450072-7", "images/6.jpg", "nuttakan.i@kkumail.com", "https://www.facebook.com/wai.nuttakan"),
      Student("ศุภชัย แสนประสิทธิ์", "643450332-7", "images/7.jpg", "supachai.sa@kkumail.com", "https://www.facebook.com/beam.supachai.9"),
      Student("ธนรัตน์ บ้านสระ", "643450658-7", "images/8.jpg", "tanarat.t@kkumail.com", "https://www.facebook.com/profile.php?id=100013270898676")
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("My App"),
      ),
      body: ListView.builder(
        itemCount: datas.length,
        itemBuilder: (context, index) {
          return displayItem(context: context, student: datas[index]);
        },
      ),
    );
  }

  Widget displayItem({required BuildContext context, required Student student}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(data: student),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Hero(
              tag: student.studentid,
              child: Image(
                width: 100,
                image: AssetImage(student.image),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  student.name,
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  student.studentid,
                  style: const TextStyle(fontSize: 12),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


  Widget rainbowText(String text) {
    List<Color> rainbowColors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.purple,
    ];

    List<TextSpan> spans = [];
    for (int i = 0; i < text.length; i++) {
      spans.add(TextSpan(
          text: text[i],
          style: TextStyle(
            color: rainbowColors[i % rainbowColors.length],
            decoration: text.contains("นายเจษฎา ลีรัตน์")
                ? TextDecoration.underline
                : TextDecoration.none,
          )));
    }

    return RichText(
      text: TextSpan(children: spans, style: const TextStyle(fontSize: 20)),
    );
  }
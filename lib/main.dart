
import 'dart:convert';
// @dart=2.9
import 'package:book_uz/main_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:page_turn/page_turn.dart';
import 'package:flutter/services.dart';

late Box ussdBox;

Future<void> main() async {
  await Hive.initFlutter();
  ussdBox = await Hive.openBox("ussdBox");
  var a = [
    {"title": "SO‘Z BOSHI", "text": """Hayot haqiqati shundan dalolat beradiki, dunyodagi barcha bilim va tajribalar, so‘z, tushuncha, tasavvur hamda xulosalar bevosita yo bilvosita inson faoliyati bilan bog‘liq holda vujudga keladi, rivojlanadi, boyib, takomillashib boradi yoxud aksincha – eskirib, umrini o‘tab, zavolga yuz tutadi. Ayni paytda jahonda shunday bir buyuk hodisa borki, u toki odamzotning ongli hayoti mavjud ekan, hech qachon zavol bilmaydi. Sh.u. ham uni o‘ta noyob – fenomenal hodisa deb ataymiz. Bu – sog‘lom fikrlaydigan, ezgu orzu-umidlar bilan yashaydigan inson va jamiyat tomonidan hamma zamonlarda ham qadrlanib kelgan ma’naviyatdir.
  Darhaqiqat, bashariyat o‘z aqlini taniganidan, ruh va vujudning farqini, hayot ma’nosini, ezgulikning mohiyatini anglaganidan buyon ma’naviyat unga doimiy hamroh bo‘lib kelmoqda. Bamisoli buyuk mutafakkir shoirimiz Alisher Navoiyning qahramoni Farhod afsonaviy ko‘zguga qarab, o‘z taqdirini oldindan ko‘ra olganidek, inson ham ma’naviyat orqali tarixni, bugungi kuni va kelajagini tasavvur qilish, baholash va shu tariqa zarur saboq va xulosalar chiqarish imkoniga ega bo‘ladi.
  Ma’lumki, sobiq Ittifoq davrida totalitar tuzum manfaatlari ustun qo‘yilib, inson, uning huquq va manfaatlari, ruhiy-ma’naviy darajali narsalarga aylanib qolgan edi. Jumladan, milliy ma’naviyat tushunchasi ham asl ma’no-mazmuni va va ahamiyatini yo‘qotib, unutilishga mahkum qilingan edi. Oxir-oqibatda ma’naviyat deganda, insonni – inson, millatni – millat qiladigan, ularning qadr-qimmati va o‘zligini belgilaydigan, asrlar davomida bir butun tizim sifatida shakllanib, rivojlanib kelgan hodisani emas, balki insonga xos ayrim axloqiy fazilatlar, tuyg‘u va kechinmalar tushunilar edi, xolos."""},
    {"title": """O'zbek tili lug‘atshunoslik maktabi """, "text": """Ma’lumki, o‘zbek lug‘atshunoslik maktabi o‘zining qadimiy an’analari, boy tajriba maktabiga ega. Ayniqsa, mustaqillik yillarida, ona tilimiz tom ma’noda davlat tili maqomiga ega bo‘lganidan so‘ng, bu soha rivojida ham tub burilishlar yuz berdi. Jumladan, 12 jildlik “O‘zbekiston milliy ensiklopediyasi”, 5 jilddan iborat “O‘zbek tilining izohli lug‘ati” singari yirik hajmli ilmiy tadqiqotlar yaratildi. Shu bilan birga, “Falsafa” qomusiy lug‘ati, “Islom” ensiklopediyasi, “O‘zbekiston yuridik ensiklopediyasi”, “Mustaqillik” izohli lug‘ati, “Milliy istiqlol g‘oyasi” izohli lug‘ati kabi ilmiy asarlar nashr qilindi. E’tiboringizga havola etilayotgan ushbu lug‘atni tayyorlashda mazkur manbalardan va bu boradagi ijobiy tajribalardan foydalanildi.
	Mazkur kitob ma’naviyat sohasidagi dastlabki lug‘at sifatida tayyorlangani uchun unda kelgusida yanada takomillashtirish talab etiladigan jihatlar, bahsli o‘rinlar, ayrim kamchiliklar ham bo‘lishi tabiiy, albatta. Xalqimizning ma’naviy saviyasini yanada yuksaltirish yo‘lida jonkuyarlik ko‘rsatayotgan ziyolilarimiz, ushbu sohada bilim va tajribaga ega bo‘lgan olim va mutaxassislar, keng jamoatchilik lug‘at to‘g‘risida xolis fikr-mulohazalarini bildiradilar, deb umid qilamiz."""}
  ];
  // ussdBox.put('0', 'Psixalogiya va nimadir');
  // ussdBox.put('text_0', 'Psixalogiya va nimadir sdfhsdb sdgfsd sidhfsd');
  if(ussdBox.get('main_data') == null)ussdBox.put("main_data", jsonEncode(a));
  //Hive.deleteFromDisk();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black54, // navigation bar color
    statusBarColor: Colors.black, // status bar color
  ));

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
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: FirstPageBook(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    required this.pageNumber,
    Key? key,
  }) : super(key: key);

  final String pageNumber;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = GlobalKey<PageTurnState>();
  final datas = jsonDecode(ussdBox.get('main_data'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(ussdBox.get(widget.pageNumber))),
      body: PageTurn(
        key: _controller,
        backgroundColor: Colors.white,
        showDragCutoff: false,
        // lastPage: Container(
        //     margin: EdgeInsets.all(20),
        //     child: Center(child: Text('E\'tiboringiz uchun Rahmat !'))),
        children: <Widget>[
          BasePage(pageNumber: (2).toString(), title: datas[0]['title'],text: datas[0]['text'],),
          BasePage(pageNumber: (3).toString(), title: datas[1]['title'],text: datas[1]['text'],),
          for(var i = 2; i < datas.length; i++)BasePage(pageNumber: (i+2).toString(), title: datas[i]['title'],text: datas[i]['text'],),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.menu_book_sharp),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MenuPage(datas:datas,pageCont:_controller)));
        },
      ),
    );
  }
}

class BasePage extends StatefulWidget {
  const BasePage({required this.title,required this.text, required this.pageNumber, Key? key})
      : super(key: key);

  final String pageNumber;
  final String title;
  final String text;

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 60,left: 15,right: 15,bottom: 50),
        height: MediaQuery.of(context).size.height-90,
        child: Column(
          children: [
            Text(widget.title,style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 15,
            ),
            Text(widget.text),
            SizedBox(
              height: 15,
            ),
            Expanded(
              // alignment: Alignment.bottomCenter,
              child: Align(alignment: Alignment.bottomCenter,child: Text(widget.pageNumber)),
            )
          ],
        ),
      ),
    );
  }
}

class MenuPage extends StatefulWidget {
  const MenuPage({required this.pageCont,required this.datas,Key? key}) : super(key: key);

  final datas;
  final GlobalKey pageCont;

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      appBar: AppBar(
        title: GestureDetector(onDoubleTap:() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPage()));
        }, child: Text('Mundarija')),
        // backgroundColor: Col,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 5, right: 5, bottom: 25),
          child: Column(
            children: [
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.datas.length,
                  itemBuilder: (BuildContext context, index) {
                    return Column(children: [
                      MainList(
                        title: widget.datas[index]['title'],
                        page:(index).toString(),
                        pageCont:widget.pageCont,
                      ),
                      const Divider(
                        color: const Color(0xFF404040),
                        height: 2,
                        thickness: 1,
                      ),
                    ]);
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class FirstPageBook extends StatelessWidget {
  const FirstPageBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyHomePage(pageNumber: '1')));
      },
      child: Scaffold(
        body: Container(
          // margin: const EdgeInsets.only(top: 30,left: 15,right: 15,bottom: 50),
          height: MediaQuery.of(context).size.height-90,
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Container(
                child: Image(
                  image: const AssetImage('assets/images/book.png'),
                  fit: BoxFit.cover,
                  height: 300,
                  width: double.infinity,
                  alignment: Alignment.center,
                  // color: Colors.black.withOpacity(0.03),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Ma\'naviyat',
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Asosiy tushunchalar izohli lug\'at',
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.chevron_right_rounded),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyHomePage(pageNumber: '1')));
          },
        ),
      ),
    );
  }
}


class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  TextEditingController titleCon = new TextEditingController();
  TextEditingController textCon = new TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(onDoubleTap:() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPage()));
        }, child: Text('Simple Adminka')),
        // backgroundColor: Col,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 5, right: 5, bottom: 25),
          child: Column(
            children: [
              TextField(
                // obscureText: true,
                controller: titleCon,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                ),
              ),
              SizedBox(height: 30,),
              TextField(
                controller: textCon,
                // obscureText: true,
                maxLines: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Text',
                ),
              ),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: (){
                if(textCon.text.trim() != "" && titleCon.text.trim()!=""){
                  final datas = jsonDecode(ussdBox.get('main_data'));
                  datas.add({"text":textCon.text,'title':titleCon.text});
                  ussdBox.put('main_data', jsonEncode(datas));
                  AlertDialog(title: Text('Successfully'),content: Text("Malumotlaringliz muvaffaqiyatli saqlandi !"),);
                  textCon.clear();
                  titleCon.clear();
                }
                else print("boooosh");
              }, child: Text("Saqlash"))
            ],
          ),
        ),
      ),
    );
  }
}

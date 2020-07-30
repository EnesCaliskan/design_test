import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(
    theme: new ThemeData(primarySwatch: Colors.blue),
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "Mantı",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "Hamur işi",
                style: TextStyle(color: Colors.grey[500]),
              ),
            ],
          ),
        ),
        AddToFavorites(),
      ],
    ),
  );

  Widget infoSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: <Widget>[
            Icon(
              Icons.timer,
              color: Colors.green,
            ),
            Text("Pişirme Süresi : 1 saat"),
          ],
        ),
        Column(
          children: <Widget>[
            Icon(
              Icons.accessibility,
              color: Colors.green,
            ),
            Text("Kalori : 322 Kcal"),
          ],
        ),
      ],
    ),
  );

  Widget instructionsSection = Container(
    padding: const EdgeInsets.all(32),
    child: Expanded(
      child: SingleChildScrollView(
        child: Text(
            "Ülkemizin en kıymetli yiyeceklerinin başında geliyor mantılar. "
            "Kayseri'yle özdeşleşen, bir kaşığa 40 adet sığdırılan mantılarının güzelliğini de çok az şey tutar şu hayatta. "
            "Birbirinden farklı mantı tarifleri olsa da en sevileni klasik mantı tarifi oldu hep. İçi kıymalı minik hamurlar, üzerine bol sarımsaklı yoğurt ve tereyağlı sosla buluşunca lezzetine lezzet katılıyor."
            " Karşınızda büyük küçük herkesin afiyetle yiyeceği, ev yapımı nefis mi nefis mantı tarifi! Mantının sırrı hamurunun inceliğinde ve iç harcının lezzetinde saklı."
            " Kabul ediyoruz, yapımı pek kolay değil ama lezzeti tabak tabak yedirecek cinsten. "
            "El emeğinin ve lezzetinin buram buram hissedileceği mantı tarifi karşınızda!"
            " Şimdiden ellerinize sağlık diyor, mantı tarifimize buyur ediyoruz."),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    // diğer widgetlar burada build olacak
    return MaterialApp(
      title: 'Ne Pisirsem',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Ne Pişirsem?"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.dehaze),
              tooltip: 'Diğerlerini gör',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute()),
                );
              },
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Image.asset(
              'images/manti.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection, // ana ekrana eklenicek bölmeler
            infoSection,
            instructionsSection,
          ],
        ),
      ),
    );

    throw UnimplementedError();
  }
}

class AddToFavorites extends StatefulWidget {
  @override
  _AddToFavoritesState createState() => _AddToFavoritesState();
}

class _AddToFavoritesState extends State<AddToFavorites> {
  bool _isFavorited = false;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          "Favorilere Ekle",
          style: TextStyle(color: Colors.blueGrey[500]),
        ),
        IconButton(
          icon: (_isFavorited
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border)),
          color: Colors.red[500],
          onPressed: _toggleFavorite,
          tooltip: 'Favorilere Ekle',
        ),
      ],
    );
  }
}

class SecondRoute extends StatelessWidget {
  var yemek1 = 'images/yemek1.jpg';
  var yemek2 = 'images/yemek2.jpg';
  var yemek3 = 'images/yemek3.jpg';
  var yemek4 = 'images/yemek4.jpg';
  var yemek5 = 'images/yemek5.jpg';

  BoxDecoration myBoxDecoration1() {
    return BoxDecoration(
      color: Colors.grey,
      image: new DecorationImage(
        fit: BoxFit.cover,
        colorFilter: new ColorFilter.mode(
            Colors.black.withOpacity(0.2), BlendMode.dstATop),
        image: new AssetImage('$yemek1'),
      ),
      border: Border.all(width: 0.3, color: Colors.transparent),
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
    );
  }

  BoxDecoration myBoxDecoration2() {
    return BoxDecoration(
      color: Colors.grey,
      image: new DecorationImage(
        fit: BoxFit.cover,
        colorFilter: new ColorFilter.mode(
            Colors.black.withOpacity(0.2), BlendMode.dstATop),
        image: new AssetImage('images/yemek2.jpg'),
      ),
      border: Border.all(width: 0.3, color: Colors.transparent),
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
    );
  }

  BoxDecoration myBoxDecoration3() {
    return BoxDecoration(
      color: Colors.grey,
      image: new DecorationImage(
        fit: BoxFit.cover,
        colorFilter: new ColorFilter.mode(
            Colors.black.withOpacity(0.2), BlendMode.dstATop),
        image: new AssetImage('images/manti.jpg'),
      ),
      border: Border.all(width: 0.3, color: Colors.transparent),
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
    );
  }

  Card myCard1() {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(30),
        child: Text(
          "Mercimek Köftesi",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        decoration: myBoxDecoration1(),
      ),
    );
  }

  Card myCard2() {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(30),
        child: Text(
          "Amerikan Salatası",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        decoration: myBoxDecoration2(),
      ),
    );
  }

  Card myCard3() {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(30),
        child: Text(
          "Mantı",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        decoration: myBoxDecoration3(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarif Listesi"),
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Mercimek()),
              );
            },
            child: myCard1(),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Salata()),
              );
            },
              child: myCard2()),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
              child: myCard3()),
        ],
      ),
    );
  }
}

class Mercimek extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ne Pisirsem',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Ne Pişirsem?"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.dehaze),
              tooltip: 'Diğerlerini gör',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute()),
                );
              },
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Image.asset(
              'images/yemek1.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
        Container(
          padding: const EdgeInsets.all(32),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        "Mercimek Köftesi",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "Tuzlu Atıştırmalık",
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                  ],
                ),
              ),
              AddToFavorites(),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(
                    Icons.timer,
                    color: Colors.green,
                  ),
                  Text("Pişirme Süresi : 20 dakika"),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.accessibility,
                    color: Colors.green,
                  ),
                  Text("Kalori : 291 Kcal"),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(32),
          child: Expanded(
            child: SingleChildScrollView(
              child: Text(
                  "Altın günlerinin vazgeçilmez lezzeti, bekarların ve öğrenci evlerinin gözdesi mercimekli köfte pratik olmasının yanı sıra besleyici ve lezzetli de. "
                      "Tam ölçülü, tam kıvamında mercimek köftesi nasıl yapılır diye merak edenlerden en güzel mercimek köftesi tarifini henüz bulamamış olanlara"
                      " tüm püf noktalarıyla pratik tariflerin gözdesi mercimek köftesi karşınızda!"
                      "Mercimek köftesi sunumunu, mercimek köftesinin yanına ne gider ya da mercimek köftesi cıvık olursa ne yapılmalı sorularının cevabını artık başka yerde aramanız gerek yok."
                      "Çünkü en güzelini annenin yaptığı mercimek köftesi için mutfağa girerek biraz da biz hünerlerimizi göstereceğiz bugün. Güzel annelerimize selamlar yollayacağız bu tarifle."
              ),
            ),
          ),
        ),
          ],
        ),
      ),
    );
  }
}

class Salata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ne Pisirsem',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Ne Pişirsem?"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.dehaze),
              tooltip: 'Diğerlerini gör',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute()),
                );
              },
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Image.asset(
              'images/yemek2.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.all(32),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            "Amerikan Salatası",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "Meze",
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                      ],
                    ),
                  ),
                  AddToFavorites(),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(
                        Icons.timer,
                        color: Colors.green,
                      ),
                      Text("Pişirme Süresi : 20 dakika"),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(
                        Icons.accessibility,
                        color: Colors.green,
                      ),
                      Text("Kalori : 255 Kcal"),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(32),
              child: Expanded(
                child: SingleChildScrollView(
                  child: Text(
                      "Biraz hassas bir konu Amerikan salatası. Neden derseniz çünkü Amerikan salatası olarak da bildiğimiz küp şeklinde doğranmış haşlanmış patates, havuç, bezelye ile hazırlanan ağırlıklı olarak mayonez ve yoğurtla kendine gelen salatanın orijinal adı aslında Rus salatası. "
                          "Yani uzun lafın kısası Amerikan salatası tarifi ile Rus salatası tarifi arasında aslında büyük bir fark yok."
                          "Rusça ve Almanca gibi dillerde hali hazırda bu salatanın adı mucidi şef Lucien Olivier nedeniyle "
                          "Olivier salatası olarak anılırken ülkemize 'soğuk savaş' yıllarında gelen ve restoranlarda servis edilmeye başlayan salata, ideolojik sebeplerden ötürü menülerde Amerikan salatası olarak geçmiştir.",
                ),
              ),
            ),
            )
          ],
        ),
      ),
    );
  }
}



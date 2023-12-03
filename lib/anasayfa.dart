import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var tfController = TextEditingController();
  String alinanVeri = "";
  String resimAdi = "smile.png";
  bool switchKontrol = false;
  bool checkboxKontrol = false;
  int radioDeger = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Widgets")),
      body: Center(
        child: Column(
          children: [
            Text(alinanVeri),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: tfController,
                decoration: const InputDecoration(hintText: "Veri"),
                keyboardType: TextInputType.number,
                obscureText: true,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    alinanVeri = tfController.text;
                  });
                },
                child: const Text("Veriyi Al")),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        resimAdi = "smile.png";
                      });
                    },
                    child: const Text("Resim 1")),
                Image.asset("resimler/$resimAdi"),//Localdeki resimleri yükler.
                /*  SizedBox(
                    width: 42,
                    height: 42,
                    child: Image.network(//internetteki resimleri kullanmamıza olanak sağlar.
                        "https://kasimadalan.pe.hu/yemekler/resimler/$resimAdi")),*/
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        resimAdi = "sad.png";
                      });
                    },
                    child: const Text("Resim 2")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 190,
                  child: SwitchListTile(
                      title: const Text("Dart"),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: switchKontrol,
                      onChanged: (veri) {
                        setState(() {
                          switchKontrol = veri;
                        });
                      }),
                ),
                SizedBox(
                  width: 190,
                  child: CheckboxListTile(
                      title: const Text("Flutter"),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: checkboxKontrol,
                      onChanged: (veri) {
                        setState(() {
                          checkboxKontrol = veri!;
                        });
                      }),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 190,
                  child: RadioListTile(
                      title: const Text("Barcelona"),
                      value: 1,
                      groupValue: radioDeger,
                      onChanged: (veri) {
                        setState(() {
                          radioDeger = veri!;
                        });
                      }),
                ),
                SizedBox(
                  width: 190,
                  child: RadioListTile(
                      title: const Text("Real Madrid"),
                      value: 2,
                      groupValue: radioDeger,
                      onChanged: (veri) {
                        setState(() {
                          radioDeger = veri!;
                        });
                      }),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  print("Switch durum: $switchKontrol");
                  print("Checkbox durum: $checkboxKontrol");
                  print("Radio durum: $radioDeger");
                },
                child: const Text("Göster")),
          ],
        ),
      ),
    );
  }
}

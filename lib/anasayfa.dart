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
  bool progressKontrol = false;
  double ilerleme = 50.0;
  var tfSaat = TextEditingController();
  var tfTarih = TextEditingController();
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
                Image.asset("resimler/$resimAdi"), //Localdeki resimleri yükler.
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        progressKontrol = true;
                      });
                    },
                    child: const Text("Başla")),
                Visibility(
                    visible: progressKontrol,
                    child: const CircularProgressIndicator()),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        progressKontrol = false;
                      });
                    },
                    child: const Text("Dur")),
              ],
            ),
            Text(ilerleme.toInt().toString()),
            Slider(
                min: 0.0,
                max: 100.0,
                value: ilerleme,
                onChanged: (veri) {
                  setState(() {
                    ilerleme = veri;
                  });
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 100,
                  child: TextField(
                    controller: tfSaat,
                    decoration: const InputDecoration(hintText: "Saat"),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      showTimePicker(
                              context: context,
                              initialTime:
                                  TimeOfDay.fromDateTime(DateTime.now()))
                          .then((value) {
                        tfSaat.text = "${value!.hour} : ${value.minute}";
                      });
                    },
                    icon: const Icon(Icons.access_time)),
                SizedBox(
                  width: 100,
                  child: TextField(
                    controller: tfTarih,//veriyi kontrol eder
                    decoration: const InputDecoration(hintText: "Tarih"),//Text içi boşken görünür veri girince kaybolur.
                  ),
                ),
                IconButton(
                    onPressed: () {
                      showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),//Anlık tarihi belirtir
                          firstDate: DateTime(2000),//Başlangıç yılı
                          lastDate: DateTime(2040))//Bitiş yılı
                          .then((value) {
                        tfTarih.text = "${value!.day} / ${value.month} / ${value.year}";//takvimde seçilen tarihleri texte gösterir.
                      });
                    },
                    icon: const Icon(Icons.date_range)),//İcon tipini belirtir.
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  print("Switch durum: $switchKontrol");
                  print("Checkbox durum: $checkboxKontrol");
                  print("Radio durum: $radioDeger");
                  print("Slider durum: $ilerleme");
                },
                child: const Text("Göster")),
          ],
        ),
      ),
    );
  }
}

import 'package:bidi/bidi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:toastification/toastification.dart';

import '../database/app_database.dart';
import '../database/mydb.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<SurahItem>> _surahListFuture;

  // Set default to surah al fatihah
  int fromSurah = 1;
  int fromAyat = 1;
  int toSurah = 1;
  int toAyat = 7;

  @override
  void initState() {
    super.initState();

    _surahListFuture = MyDb.instance.database.getAllSurah();
  }

  Future<int?> getTotalAyatInSurah(int surahNumber) async {
    final db = MyDb.instance.database;
    return await db.getTotalAyatInSurah(surahNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Quran Computer Publication',
                        style: Theme.of(context).textTheme.titleLarge),
                  ),
                  const Row(
                    children: [
                      Text('Mushaf'),
                      Text('Hafs'),
                      Text('Tajwid Option'),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Copy Range',
                            style: Theme.of(context).textTheme.titleMedium),
                        const Gap(12),
                        const Text('From'),
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: FutureBuilder(
                                future: _surahListFuture,
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return Text(snapshot.error.toString());
                                  }

                                  if (!snapshot.hasData) {
                                    return const LinearProgressIndicator();
                                  }

                                  return DropdownButtonFormField(
                                    isExpanded: true,
                                    decoration: const InputDecoration(
                                      hintText: 'Surah',
                                      border: OutlineInputBorder(),
                                    ),
                                    items: [
                                      for (var surah in snapshot.data!)
                                        DropdownMenuItem(
                                            value: surah.surahNo,
                                            child: Text(
                                                '${surah.surahNo}. ${surah.namaEnglish} - ${surah.namaArab}'))
                                    ],
                                    onChanged: (newFromSurah) {
                                      if (newFromSurah == null) return;
                                      if (newFromSurah == fromSurah) return;
                                      if (newFromSurah > toSurah) {
                                        setState(() {
                                          toSurah = newFromSurah;
                                        });
                                      }
                                      setState(() {
                                        fromSurah = newFromSurah;
                                      });
                                    },
                                    value: fromSurah,
                                  );
                                },
                              ),
                            ),
                            const Gap(8),
                            Expanded(
                              flex: 2,
                              child: FutureBuilder(
                                future: getTotalAyatInSurah(fromSurah),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return Text(snapshot.error.toString());
                                  }

                                  if (!snapshot.hasData) {
                                    return const LinearProgressIndicator();
                                  }

                                  return DropdownButtonFormField(
                                    isExpanded: true,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    items: [
                                      for (var i = 1; i <= snapshot.data!; i++)
                                        DropdownMenuItem(
                                            value: i, child: Text(i.toString()))
                                    ],
                                    onChanged: (newFromAyat) {
                                      if (newFromAyat == null) return;
                                      if (newFromAyat == fromAyat) return;
                                      if (toAyat < newFromAyat) {
                                        setState(() {
                                          toAyat = newFromAyat;
                                        });
                                      }
                                      setState(() {
                                        fromAyat = newFromAyat;
                                      });
                                    },
                                    // Default to the first ayat
                                    value: fromAyat,
                                  );
                                },
                              ),
                            ),
                            const Gap(8),
                            Expanded(
                              flex: 3,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white70,
                                ),
                                height: 45,
                                child: FutureBuilder(
                                  future: MyDb.instance.database
                                      .getCodePointsForAyat(
                                          surahNumber: fromSurah,
                                          ayatNumber: fromAyat),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      return Text(snapshot.error.toString());
                                    }

                                    if (!snapshot.hasData) {
                                      return const LinearProgressIndicator();
                                    }

                                    return Icon(
                                      IconData(
                                        snapshot.data!.$1.first,
                                        fontFamily: snapshot.data!.$2,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Gap(8),
                        const Text('To'),
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: FutureBuilder(
                                future: _surahListFuture,
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return Text(snapshot.error.toString());
                                  }

                                  if (!snapshot.hasData) {
                                    return const LinearProgressIndicator();
                                  }

                                  return DropdownButtonFormField(
                                    isExpanded: true,
                                    decoration: const InputDecoration(
                                      hintText: 'Surah',
                                      border: OutlineInputBorder(),
                                    ),
                                    items: [
                                      for (var surah in snapshot.data!)
                                        DropdownMenuItem(
                                            value: surah.surahNo,
                                            child: Text(
                                                '${surah.surahNo}. ${surah.namaEnglish} - ${surah.namaArab}'))
                                    ],
                                    onChanged: (value) {
                                      if (value == null) return;
                                      if (value == toSurah) return;
                                      setState(() {
                                        toSurah = value;
                                      });
                                    },
                                    value: toSurah,
                                  );
                                },
                              ),
                            ),
                            const Gap(8),
                            Expanded(
                              flex: 2,
                              child: FutureBuilder(
                                future: getTotalAyatInSurah(toSurah),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return Text(snapshot.error.toString());
                                  }

                                  if (!snapshot.hasData) {
                                    return const LinearProgressIndicator();
                                  }

                                  return DropdownButtonFormField(
                                    isExpanded: true,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    items: [
                                      for (var i = 1; i <= snapshot.data!; i++)
                                        DropdownMenuItem(
                                            value: i, child: Text(i.toString()))
                                    ],
                                    onChanged: (newToAyat) {
                                      if (newToAyat == null) return;
                                      if (newToAyat == toAyat) return;

                                      setState(() {
                                        toAyat = newToAyat;
                                      });
                                    },
                                    // Default to the last ayat in given surah
                                    value: toAyat,
                                  );
                                },
                              ),
                            ),
                            const Gap(8),
                            Expanded(
                              flex: 3,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white70,
                                ),
                                height: 45,
                                child: FutureBuilder(
                                  future: MyDb.instance.database
                                      .getCodePointsForAyat(
                                          surahNumber: toSurah,
                                          ayatNumber: toAyat),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      return Text(snapshot.error.toString());
                                    }

                                    if (!snapshot.hasData) {
                                      return const LinearProgressIndicator();
                                    }

                                    return Icon(
                                      IconData(
                                        snapshot.data!.$1.last,
                                        fontFamily: snapshot.data!.$2,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Gap(12),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                final db = MyDb.instance.database;

                                final result = await db.getManuscriptString(
                                    surahStart: fromSurah,
                                    ayatStart: fromAyat,
                                    surahEnd: toSurah,
                                    ayatEnd: toAyat);

                                final sb = StringBuffer();
                                for (var element in result) {
                                  sb.write(element.text);
                                }

                                // Added RIGHT-TO-LEFT OVERRIDE (RLO) to ensure pasted text will start at the right
                                // Here is the difference with & without RLO https://imgur.com/a/pQi21dy
                                // Still need to set alignment RTL in ms word, but at least the text will not inverted
                                // Added space so that the text would wrap to a new line
                                final data =
                                    '\u202E${sb.toString().replaceAll('', ' ')}';

                                await Clipboard.setData(
                                  ClipboardData(text: data),
                                );

                                toastification.show(
                                  context: context,
                                  type: ToastificationType.success,
                                  style: ToastificationStyle.flat,
                                  title: const Text("Ayat range copied"),
                                  alignment: Alignment.bottomLeft,
                                  autoCloseDuration: const Duration(seconds: 2),
                                  pauseOnHover: false,
                                  applyBlurEffect: true,
                                );
                              },
                              child: const Text('Copy'),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FutureBuilder(
                      future: MyDb.instance.database.getManuscriptString(
                          surahStart: fromSurah,
                          ayatStart: fromAyat,
                          surahEnd: toSurah,
                          ayatEnd: toAyat),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        }

                        if (!snapshot.hasData) {
                          return const LinearProgressIndicator();
                        }

                        final StringBuffer sb = StringBuffer();
                        for (var element in snapshot.data!) {
                          sb.write(element.text);
                        }

                        final bidiText = BidiString.fromLogical(sb.toString());
                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ...bidiText.paragraphs.map(
                                  (p) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Wrap(
                                      runSpacing: 8,
                                      spacing: 2,
                                      children: p.bidiText
                                          .map(
                                            (e) => InkWell(
                                              onTap: () {
                                                Clipboard.setData(
                                                  ClipboardData(
                                                    text:
                                                        String.fromCharCode(e),
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                String.fromCharCode(e),
                                                textScaler:
                                                    const TextScaler.linear(2),
                                                style: const TextStyle(
                                                  fontFamily:
                                                      'QCF4_Hafs_01_W_COLOR',
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

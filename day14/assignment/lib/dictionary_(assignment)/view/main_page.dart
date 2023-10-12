// 추가 코드를 작성할 것. 본 소스는 디자인만 작성되어 있으며
// 이 기본 틀을 통하여 과제에 필요한 소스코드를 추가적으로 구현할 것.
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../model/dict_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();

    // getData('pioneer');
  }

  Dict? showResult;

  Future<void> getData(String word) async {
    final dio = Dio();
    String url = 'https://api.dictionaryapi.dev/api/v2/entries/en/$word';
    final resp = await dio.get(url);

    // print(resp.data[0]);

    if (resp.statusCode == 200) {
      var data = Map<String, dynamic>.from(resp.data[0]);
      var word = Dict.fromMap(data);

      showResult = word;
      // print(word);
      // print(word.runtimeType);

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dictionary App'),
        elevation: 0,
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SearchBar(
              onSubmitted: (value) {
                getData(value);
              },
            ),
            if (showResult.runtimeType == Dict)
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  margin: const EdgeInsets.all(4),
                  color: Colors.black12,
                  child: ListView(
                    children: [
                      renderWord(),
                      const SizedBox(height: 16),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: showResult!.meanings
                              .map(
                                (e) => renderPartOfSpeeches(e),
                              )
                              .toList()),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget renderPartOfSpeeches(e) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            e.partOfSpeech,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          ...e.definitions
              .map(
                (f) => renderDefinitions(f),
              )
              .toList(),
          const Divider(),
        ],
      ),
    );
  }

  Widget renderDefinitions(f) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 2),
        Text('- ${f.definition.toString()}'),
        if (f.synonyms.length > 0) const SizedBox(height: 2),
        if (f.synonyms.length > 0) Text('- Synonyms: ${f.synonyms.join(', ')}'),
        if (f.antonyms.length > 0) const SizedBox(height: 2),
        if (f.antonyms.length > 0) Text('- Antonyms: ${f.antonyms.join('')}'),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget renderWord() {
    return Text(
      showResult!.word,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final Function(String)? onSubmitted;

  const SearchBar({
    required this.onSubmitted,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search",
                suffixIcon: Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              onSubmitted: onSubmitted,
            ),
          ),
        ),
      ],
    );
  }
}

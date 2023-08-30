
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/widgets/note_item.dart';

import '../cubits/noteView/note_view_cubit.dart';

class SearchData extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return clearMethodForSearch();
  }

  List<Widget> clearMethodForSearch() {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return leadingBackMethodForSearch(context);
  }

  IconButton leadingBackMethodForSearch(BuildContext context) {
     return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return showResultBasedOnTitle(context);
  }

  Padding showResultBasedOnTitle(BuildContext context) {
     var filteredData = BlocProvider.of<NoteViewCubit>(context)
        .notes!
        .where((element) =>
            element.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: ListView.builder(
        itemCount: filteredData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: CustomNoteItem(note: filteredData[index]),
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return contentOfBodySearch(context);
  }

  ListView contentOfBodySearch(BuildContext context) {
      var filteredData = BlocProvider.of<NoteViewCubit>(context)
        .notes!
        .where((element) =>
            element.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    List<String> listData = BlocProvider.of<NoteViewCubit>(context)
        .notes!
        .map((e) => e.title)
        .toList();
    return ListView.builder(
        itemCount: query.isEmpty ? listData.length : filteredData.length,
        itemBuilder: (context, index) {
          return  ListTile(
            leading: const Icon(
              Icons.notes,
              color: Colors.black,
            ),
            title: Text(
                query.isEmpty ? listData[index] : filteredData[index].title),
            onTap: () {
              query =
                  query.isEmpty ? listData[index] : filteredData[index].title;
              showResults(context);
            },
          );
        });
  }
}

import 'dart:async';
import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final Function(String value) onChanged;
  final String? labelText;
  const SearchWidget({
    Key? key,
    required this.onChanged,
    this.labelText = 'Pesquisa',
  }) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  Timer? debounce;
  TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 2),
          borderRadius: BorderRadius.circular(50),
        ),
        labelText: widget.labelText,
        prefixIcon: Icon(
          Icons.search,
          size: 16,
        ),
        suffixIcon: GestureDetector(
          child: Icon(
            Icons.clear,
            size: 16,
          ),
          onTap: () {
            textController.clear();
            widget.onChanged(textController.text);
          },
        ),
      ),
      onChanged: (value) {
        if (debounce?.isActive ?? false) debounce?.cancel();
        debounce = Timer(const Duration(milliseconds: 500), () {
          widget.onChanged(value);
        });
      },
    );
  }
}

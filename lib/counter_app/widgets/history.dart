import 'package:flutter/material.dart';

class HistoryWidget extends StatefulWidget {
  const HistoryWidget({super.key, required this.increaseHistory});
  final List<int> increaseHistory;

  @override
  State<HistoryWidget> createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  late Widget list = buildLists();
  late ScrollController _controller;

// Best way to use ScrollController
  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void didUpdateWidget(covariant HistoryWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Rebuilding the UI only when the list Change. In StatefulWidget, all the descendant UI is automatically updated[except for const Widgets()] when any value is changed (which can be expensive for big Widget/Large listview). This is a problem when taking state up (sharing state between children). So we are manually caching the ListView()
    // Manually caching the ListView(), only updating the list when ListView() changes
    if (widget.increaseHistory.length != oldWidget.increaseHistory.length) {
      list = buildLists();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      child: Column(
        children: [
          const Text(
            'Increases counter',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 40,
            child: list,
          ),
        ],
      ),
    );
  }

// Creating a scrollbar the right way
  Widget buildLists() {
    return Scrollbar(
      thumbVisibility: true,
      thickness: 12.0,
      controller: _controller,
      child: ListView.separated(
        addAutomaticKeepAlives: false,
        controller: _controller,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (_, index) => Text('${widget.increaseHistory[index]}'),
        separatorBuilder: (_, __) => const SizedBox(
          width: 10,
        ),
        itemCount: widget.increaseHistory.length,
      ),
    );
  }
}

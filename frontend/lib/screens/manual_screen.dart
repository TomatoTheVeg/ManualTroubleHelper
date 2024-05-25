import 'package:continental_manual_helper/providers/manual_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ManualScreen extends ConsumerStatefulWidget {
  const ManualScreen({super.key, this.pageNumber});

  final int? pageNumber;

  @override
  ConsumerState<ManualScreen> createState() => _WikiScreenState();
}

class _WikiScreenState extends ConsumerState<ManualScreen> {
  final PdfViewerController _pdfViewerController = PdfViewerController();

  @override
  Widget build(BuildContext context) {
    _pdfViewerController.jumpToPage(widget.pageNumber ?? 0);
    return Center(
      child: Column(
        children: [
          Expanded(
            child: SfPdfViewer.asset(
              controller: _pdfViewerController,
              ref.watch(manualListProvider.notifier).currentManual.path,
            ),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     _pdfViewerController.jumpToPage(90);
          //   },
          //   child: const Text("jump to 90"),
          // )
        ],
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ztech_hpih_app/core/localization/l10n_extension.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class AddProfileByCodePage extends ConsumerStatefulWidget {
  static const path = '/add-profile-by-code';

  const AddProfileByCodePage({super.key});

  @override
  ConsumerState<AddProfileByCodePage> createState() =>
      _AddProfileByCodePageState();
}

class _AddProfileByCodePageState extends ConsumerState<AddProfileByCodePage> {
  final _codeController = TextEditingController();
  final _scannerController = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
  );

  bool _searchingByInput = false;
  bool _searchingByScan = false;
  String? _lastScannedCode;

  bool get _canSearchByInput =>
      !_searchingByInput && _codeController.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    _codeController.addListener(_refresh);
  }

  @override
  void dispose() {
    _codeController.dispose();
    _scannerController.dispose();
    super.dispose();
  }

  void _refresh() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          title: Text(
            l10n.profile_add_by_code_title,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            splashFactory: NoSplash.splashFactory,
            tabs: [
              Tab(text: l10n.profile_add_by_code_tab_input),
              Tab(text: l10n.profile_add_by_code_tab_scan),
            ],
          ),
        ),
        body: TabBarView(
          children: [_buildManualTab(context), _buildScannerTab(context)],
        ),
      ),
    );
  }

  Widget _buildManualTab(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 16,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: const Color(0x1F234F9B),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Icon(
                      IconsaxPlusLinear.keyboard_open,
                      color: Color(0xFF234F9B),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    context.l10n.profile_add_by_code_instructions,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[900],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _codeController,
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      hintText: context.l10n.profile_add_by_code_hint,
                      prefixIcon: const Icon(IconsaxPlusLinear.scan_barcode),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: _canSearchByInput ? _searchByInput : null,
                child: _searchingByInput
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(context.l10n.profile_add_by_code_search_button),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScannerTab(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.12),
                      blurRadius: 20,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    MobileScanner(
                      controller: _scannerController,
                      onDetect: _handleBarcodeDetect,
                    ),
                    IgnorePointer(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withValues(alpha: 0.45),
                              Colors.transparent,
                              Colors.black.withValues(alpha: 0.45),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 220,
                        height: 220,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      right: 20,
                      bottom: 24,
                      child: Text(
                        _searchingByScan
                            ? context.l10n.profile_add_by_code_scanning_checking
                            : context
                                  .l10n
                                  .profile_add_by_code_scanning_instruction,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(IconsaxPlusLinear.scan_barcode),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      _lastScannedCode == null
                          ? context.l10n.profile_add_by_code_no_scanned
                          : context.l10n.profile_add_by_code_last_scanned(
                              _lastScannedCode ?? '',
                            ),
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _searchByInput() async {
    final code = _codeController.text.trim();
    if (code.isEmpty || _searchingByInput) return;

    setState(() => _searchingByInput = true);
    try {
      await _mockCheckProfile(code, source: 'manual');
    } finally {
      if (mounted) setState(() => _searchingByInput = false);
    }
  }

  Future<void> _handleBarcodeDetect(BarcodeCapture capture) async {
    if (_searchingByScan) return;

    final raw = capture.barcodes.isNotEmpty
        ? capture.barcodes.first.rawValue
        : null;
    final code = raw?.trim();
    if (code == null || code.isEmpty) return;
    if (code == _lastScannedCode) return;

    setState(() {
      _searchingByScan = true;
      _lastScannedCode = code;
    });

    try {
      await _mockCheckProfile(code, source: 'scanner');
    } finally {
      if (mounted) {
        setState(() => _searchingByScan = false);
      }
    }
  }

  Future<void> _mockCheckProfile(String code, {required String source}) async {
    log('Check profile by $source: {"code": "$code"}');
    await Future<void>.delayed(const Duration(milliseconds: 900));
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(context.l10n.profile_add_by_code_checked_snackbar(code)),
      ),
    );
  }
}

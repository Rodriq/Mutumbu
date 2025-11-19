// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:url_launcher/url_launcher.dart';

class MinimalMarkdownViewer extends StatefulWidget {
  const MinimalMarkdownViewer({
    super.key,
    this.width,
    this.height,
    required this.markdownText,
  });

  final double? width;
  final double? height;
  final String markdownText;

  @override
  State<MinimalMarkdownViewer> createState() => _MinimalMarkdownViewerState();
}

class _MinimalMarkdownViewerState extends State<MinimalMarkdownViewer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Markdown(
        data: widget.markdownText,
        styleSheet: MarkdownStyleSheet(
          h1: FlutterFlowTheme.of(context).headlineLarge,
          h2: FlutterFlowTheme.of(context).headlineMedium,
          h3: FlutterFlowTheme.of(context).headlineSmall,
          h4: FlutterFlowTheme.of(context).titleLarge,
          h5: FlutterFlowTheme.of(context).titleMedium,
          h6: FlutterFlowTheme.of(context).titleSmall,
          p: FlutterFlowTheme.of(context).bodyMedium,
          strong: FlutterFlowTheme.of(context).bodyMedium.copyWith(
                fontWeight: FontWeight.bold,
              ),
          em: FlutterFlowTheme.of(context).bodyMedium.copyWith(
                fontStyle: FontStyle.italic,
              ),
          blockquote: FlutterFlowTheme.of(context).bodyMedium.copyWith(
                fontStyle: FontStyle.italic,
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
          code: FlutterFlowTheme.of(context).bodyMedium.copyWith(
                fontFamily: 'monospace',
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              ),
          codeblockDecoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(8),
          ),
          listBullet: FlutterFlowTheme.of(context).bodyMedium,
          tableHead: FlutterFlowTheme.of(context).bodyMedium.copyWith(
                fontWeight: FontWeight.bold,
              ),
          tableBody: FlutterFlowTheme.of(context).bodyMedium,
          tableBorder: TableBorder.all(
            color: FlutterFlowTheme.of(context).primaryText.withOpacity(0.3),
            width: 1,
          ),
        ),
        onTapLink: (text, href, title) async {
          if (href != null && await canLaunch(href)) {
            await launch(href);
          }
        },
        selectable: true,
        softLineBreak: false,
        // extensionSet: MarkdownExtensionSet.githubWeb,
        shrinkWrap: true,
        padding: EdgeInsets.all(16),
      ),
    );
  }
}

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class CreedDetailWidget extends StatelessWidget {
  final String? creed;

  const CreedDetailWidget({super.key, this.creed});

  @override
  Widget build(BuildContext context) {
    final creedDetails = {
      'Nicene': {
        'title': 'Nicene Creed',
        'image': 'https://i.postimg.cc/63jxbvrZ/Nicene2.png',
        'description':
            'The Nicene Creed, established in 325 AD at the Council of Nicaea, affirms the divinity of Christ and the Trinity. It was formulated to combat Arianism and is widely used in Christian liturgy.',
      },
      'Apostles': {
        'title': 'Apostles\' Creed',
        'image': 'https://i.postimg.cc/PqMjZcN2/Apostles.png',
        'description':
            'The Apostles\' Creed, dating back to around 390 AD, is one of the oldest statements of Christian belief. It summarizes the core tenets of the faith and is used in many denominations.',
      },
      'Athanasian': {
        'title': 'Athanasian Creed',
        'image': 'https://i.postimg.cc/sXDRJchy/Athanasian.png',
        'description':
            'The Athanasian Creed, likely composed in the 5th century, emphasizes the doctrine of the Trinity and the Incarnation. It is named after Athanasius, though he did not author it.',
      },
    };

    final details = creedDetails[creed] ?? {
      'title': 'Unknown Creed',
      'image': '',
      'description': 'No details available for this creed.',
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(
          details['title']!,
          style: FlutterFlowTheme.of(context).titleLarge.override(
                fontFamily: 'Plus Jakarta Sans',
                letterSpacing: 0.0,
              ),
        ),
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (details['image']!.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    details['image']!,
                    width: double.infinity,
                    height: 200.0,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.error, size: 50.0),
                  ),
                ),
              SizedBox(height: 16.0),
              Text(
                details['title']!,
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Plus Jakarta Sans',
                      letterSpacing: 0.0,
                    ),
              ),
              SizedBox(height: 8.0),
              Text(
                details['description']!,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Plus Jakarta Sans',
                      letterSpacing: 0.0,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
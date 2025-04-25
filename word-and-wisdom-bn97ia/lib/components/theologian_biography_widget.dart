import '/components/theologian_biography_modal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'theologian_biography_model.dart';
export 'theologian_biography_model.dart';

class TheologianBiographyWidget extends StatefulWidget {
  const TheologianBiographyWidget({
    super.key,
    String? name,
    String? location,
    String? birthAndDeath,
    this.photoPath,
    String? biography,
    this.contributionBulletpoints,
    this.noableWorksBulletpoints,
    this.learnAboutTheologian,
  })  : this.name = name ?? 'UnKnow',
        this.location = location ?? 'state, country',
        this.birthAndDeath = birthAndDeath ?? 'birth - death',
        this.biography = biography ?? 'insert bio info';

  final String name;
  final String location;
  final String birthAndDeath;
  final String? photoPath;
  final String biography;
  final List<String>? contributionBulletpoints;
  final List<String>? noableWorksBulletpoints;
  final String? learnAboutTheologian;

  @override
  State<TheologianBiographyWidget> createState() =>
      _TheologianBiographyWidgetState();
}

class _TheologianBiographyWidgetState extends State<TheologianBiographyWidget> {
  late TheologianBiographyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TheologianBiographyModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        wrapWithModel(
          model: _model.theologianBiographyModalModel,
          updateCallback: () => safeSetState(() {}),
          child: TheologianBiographyModalWidget(
            parameter4: '',
            parameter6: List.generate(
                random_data.randomInteger(5, 5),
                (index) => random_data.randomString(
                      0,
                      0,
                      true,
                      false,
                      false,
                    )),
            parameter7: List.generate(
                random_data.randomInteger(5, 5),
                (index) => random_data.randomString(
                      0,
                      0,
                      true,
                      false,
                      false,
                    )),
          ),
        ),
      ],
    );
  }
}

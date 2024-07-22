import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:widget_mask/widget_mask.dart';

class EditingScreen extends StatefulWidget {
  final image;
  const EditingScreen({super.key, required this.image});
  @override
  State<EditingScreen> createState() => _EditingScreenState();
}

class _EditingScreenState extends State<EditingScreen> {
  Offset _offset = Offset.zero;
  Offset _initialFocalPoint = Offset.zero;
  Offset _sessionOffset = Offset.zero;
  double _scale = 1.0;
  double _initialScale = 1.0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WidgetMask(
                    blendMode: BlendMode.dstOver,
                    childSaveLayer: true,
                    mask:
                    GestureDetector(
                      onScaleStart: (details){
                        _initialFocalPoint = details.focalPoint;
                        _initialScale = _scale;
                      },
                      onScaleUpdate: (details) {
                        setState(() {
                          _sessionOffset = details.focalPoint - _initialFocalPoint;
                          _scale = _initialScale * details.scale;
                        });
                      },
                      onScaleEnd: (details) {
                        setState(() {
                          _offset += _sessionOffset;
                          _sessionOffset = Offset.zero;
                        });
                      },
                      child:Transform.translate(
                        offset: _offset + _sessionOffset,
                        child:Transform.scale(
                          scale: _scale,
                          child: Image.asset(
                            "assets/demo1.jpeg",
                          ),
                        ),
                      ),
                    ),
                    child:
                   // Image.network(widget.image)
                    Image.asset(
                      widget.image,
                      // width: size.width,
                      // height: size.height/3,
                      fit: BoxFit.fill,
                    ),
                  ),
        ],
      ),
    );
  }
}
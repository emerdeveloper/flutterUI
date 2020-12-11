import 'package:flutter/material.dart';

import 'package:ChatRoom/widgets/pictures_widget.dart';
import 'package:flutter/scheduler.dart';

class ViewImagePage extends StatefulWidget {
  final String data;
  ViewImagePage({Key key, @required this.data}) : super(key: key);

  @override
  _ViewImagePageState createState() => _ViewImagePageState(data);
}

class _ViewImagePageState extends State<ViewImagePage> {

  final String data;
  Offset offsetInitial;
  Offset offsetFinal = Offset(0.0, 0.0);
  TransformationController _transformationController = TransformationController();
  _ViewImagePageState(this.data);

  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    //getDataFromArguments(context)    
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.85),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.close),
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
          ),
        ),
      body: Center(
        child: InteractiveViewer(
          transformationController: _transformationController,
          child: WidgetUtils.pictureProfileHero('https://picsum.photos/300/300?random=$data', 'TagImage$data'),
          onInteractionEnd: (ScaleEndDetails scalesEnd) {
             _transformationController.value = Matrix4.identity();
          },
        )
      )
    );
  }

  Widget getDrawableImage(BuildContext context) {
    final GlobalKey containerKey = GlobalKey();
    _myCallback(() {
      getPosition(containerKey);
    });
    return Draggable(
          key: containerKey,
          axis: Axis.vertical,
          maxSimultaneousDrags: 1,
          feedback: WidgetUtils.pictureProfileHero('https://picsum.photos/300/300?random=$data', 'TagImage$data'),
          child: WidgetUtils.pictureProfileHero('https://picsum.photos/300/300?random=$data', 'TagImage$data'),
          childWhenDragging: Container(),
          onDragEnd: (drag) {
            if (offsetInitial.dy != drag.offset.dy && (drag.offset.dy > (offsetInitial.dy + 100) || drag.offset.dy < (offsetInitial.dy - 100))) {
              Navigator.pop(context);
            }
          }
    );
  }

  void getPosition(GlobalKey container) {
    RenderBox _box = container.currentContext.findRenderObject();
    offsetInitial = _box.localToGlobal(Offset.zero);
  }

  void getDataFromArguments(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;
    final indexImage = args['imageIndex'];
  }

  void _myCallback(Function callback) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }
  
}
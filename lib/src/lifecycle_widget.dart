import 'package:flutter/widgets.dart';

typedef Init = Dispose Function(BuildContext context);
typedef Dispose = Function();
typedef Builder = Widget Function(BuildContext context);

class LifeCycleWidget extends StatefulWidget {
  final Builder builder;
  final Init onInit;
  final Dispose onDispose;

  const LifeCycleWidget(
      {Key key, @required this.builder, this.onInit, this.onDispose})
      : super(key: key);

  @override
  _LifeCycleWidgetState createState() => _LifeCycleWidgetState();
}

class _LifeCycleWidgetState extends State<LifeCycleWidget> {
  Dispose disposer;

  @override
  void initState() {
    super.initState();
    if (widget.onInit != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        disposer = widget.onInit(context);
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (disposer != null) {
      disposer();
    }
    if (widget.onDispose != null) {
      widget.onDispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}

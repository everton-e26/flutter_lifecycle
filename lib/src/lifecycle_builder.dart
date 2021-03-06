import 'package:flutter/widgets.dart';

typedef Init = Dispose Function(BuildContext context);
typedef InitAsync = Future<Dispose> Function(BuildContext context);
typedef Dispose = Function();
typedef Builder = Widget Function(BuildContext context);

class LifeCycleBuilder extends StatefulWidget {
  final Builder builder;
  final Init onInit;
  final Dispose onDispose;
  final InitAsync onInitAsync;

  const LifeCycleBuilder(
      {Key key,
      @required this.builder,
      this.onInit,
      this.onInitAsync,
      this.onDispose})
      : super(key: key);

  @override
  _LifeCycleBuilderState createState() => _LifeCycleBuilderState();
}

class _LifeCycleBuilderState extends State<LifeCycleBuilder> {
  final List<Dispose> _diposerFunctionList = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.onInit != null) {
        _diposerFunctionList.add(widget.onInit(context));
      }
      if (widget.onInitAsync != null) {
        _diposerFunctionList.add(await widget.onInitAsync(context));
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _diposerFunctionList.forEach((disposer) {
      disposer();
    });

    if (widget.onDispose != null) {
      widget.onDispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}

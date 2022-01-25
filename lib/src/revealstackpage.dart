import 'package:flutter/material.dart';
import 'stack_model.dart';
import 'constants.dart';

class RevealStackWidget extends StatefulWidget {
  ///Creates a reveal stack with children layout
  ///
  /// By default verticalSpacing is 60, borderRadius is 25
  ///
  final List<Widget> children;
  final double verticalSpacing;
  final double borderRadius;
  ///
  /// reveals first widget from children, by default its false
  ///
  final bool openFirstWidget;
  const RevealStackWidget({
    Key? key,
    this.children = const <Widget>[],
    this.verticalSpacing = 60,
    this.borderRadius = 25,
    this.openFirstWidget = false,
  }) : super(key: key);

  @override
  _RevealStackWidgetState createState() => _RevealStackWidgetState();
}

class _RevealStackWidgetState extends State<RevealStackWidget> {
  List<StackModel> _stackModelList = [];
  ///
  /// Default widget height when its in open state
  ///
  double _defaultOpenHeight = kScreenSize.height * 0.85;


  ///
  /// Close height of a widget, by default its close height is 100
  ///
  double _closedHeight = 100;
  double _minHeight = kScreenSize.height * 0.45;
  late double _openHeight;

  @override
  void initState() {
    _openHeight = _defaultOpenHeight;
    _widgetToModel(widget.children);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: _buildStackChildren(widget.children)!,
    );
  }


  /// Builds stack widgets
  _buildStackChildren(List<Widget> children) {
    if (children.isNotEmpty && children.length>0) {
      List<Widget> _stackPageWidget = [];
      int _length = _stackModelList.length;
      for (int i = 0; i < _length; i++) {
        StackModel _model = _stackModelList[i];
        _stackPageWidget.add(AnimatedPositioned(
          bottom: 0,
          child: GestureDetector(
            onTap: () {
              _stackPageOpenClose(_model, i, _length);
            },
            child: _buildChildWidget(_model),
          ),
          duration: Duration(milliseconds: 500),
          height: _model.isActive
              ? !_model.isOpen
              ? _model.closedHeight
              : _model.openHeight
              : 0,
          curve: Curves.decelerate,
        ));
      }
      return _stackPageWidget;
    } else {
      throw Exception("Atleast one widget is requierd in children");
    }
  }

  Widget _buildChildWidget(StackModel _model) {
    return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(widget.borderRadius),
          topRight: Radius.circular(widget.borderRadius),
        ),
        child: Material(type: MaterialType.transparency, child: _model.widget));
  }

  void _stackPageOpenClose(StackModel _model, int i, int _length) {
    setState(() {
      _model.isOpen = !_model.isOpen;
      if (i + 1 < _length) {
        if (_model.isOpen) {
          _activateSecondStackPage(
              _stackModelList[i], _stackModelList[i + 1], i);
        } else {
          for (int _index = i + 1; _index < _length; _index++) {
            _deactivateStackPages(_index, _length, _stackModelList[_index]);
          }
        }
      }
    });
  }

  void _widgetToModel(List<Widget> _children) {
    _children.forEach((_child) {
      _stackModelList.add(StackModel(
        widget: _child,
        openHeight: _getOpenHeight(),
        closedHeight: _calculateCloseHeight(),
        isOpen: false,
        isActive: false,
      ));
    });
    // by default opens first stack widget
    _openFirstStackPage(openFirstWidget: widget.openFirstWidget);
  }

  void _openFirstStackPage({bool openFirstWidget = false}) {
    _stackModelList.first.isOpen = openFirstWidget;
    _stackModelList.first.isActive = true;
    if (_stackModelList.length > 2) {
      if (openFirstWidget) {
        _stackModelList[1].isOpen = false;
        _stackModelList[1].isActive = true;
      }
    }
  }

  void _deactivateStackPages(int nextIndex, int length, StackModel _model) {
    _model.isActive = false;
    _model.isOpen = false;
    // _model.openHeight = _getOpenHeight();
  }

  double _getOpenHeight() {
    if (_openHeight < _minHeight) {
      _openHeight = _defaultOpenHeight;
      return _openHeight;
    } else {
      _openHeight -= widget.verticalSpacing;
      return _openHeight;
    }
  }

  double _calculateCloseHeight() {
    return _closedHeight;
  }

  // List<double> _widgetHeights = [];
  // void _calculateMinWidget(List<Widget> _list) {
  //   double _height = _defaultOpenHeight;
  //   for (int i = 0; i < _list.length; i++) {
  //     if (_height < _minHeight) {
  //       break;
  //     } else {
  //       _height -= widget.verticalSpacing;
  //       _widgetHeights.add(_height);
  //     }
  //   }
  //   print(_widgetHeights);
  // }

  void _activateSecondStackPage(
      StackModel firstModel, StackModel secondModel, int _index) {
    secondModel.isActive = true;
    // if (secondModel.openHeight == _widgetHeights.last) {}
  }
}


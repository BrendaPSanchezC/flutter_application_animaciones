import 'package:flutter/material.dart';
import 'package:flutter_application_animaciones/coffe_concept/coffe.dart';

class CoffeConceptList extends StatefulWidget {
  @override
  State<CoffeConceptList> createState() => _CoffeConceptListState();
}

class _CoffeConceptListState extends State<CoffeConceptList> {

  final _pageCoffeeController = PageController(
    viewportFraction: 0.35,
  );

  double _curretPage = 0.0;

  void _coffeeScrollListener(){
    setState(() {
      _curretPage = _pageCoffeeController.page!;
    });
  }

  @override
  void initState (){
    _pageCoffeeController.addListener(_coffeeScrollListener);
    super.initState();
  }

  @override
  void dispose(){
    _pageCoffeeController.removeListener(_coffeeScrollListener);
    _pageCoffeeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        ),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            height: 100,
            child: Container(
              color: Colors.red,
            ),
          ),
          PageView.builder(
            controller: _pageCoffeeController,
            scrollDirection: Axis.vertical,
            itemCount: coffees.length + 1,
            itemBuilder: (context, index){
              if( index == 0){
                return const SizedBox.shrink();
              }
            final coffee = coffees[index - 1];
            final result = _curretPage - index + 1;
            final value = -0.4 * result + 1;
            print(result);
            return Transform(
              transform: Matrix4.identity()..setEntry(3, 2, 0.001)
              ..translate(MediaQuery.of(context).size.height)
              ..scale(value),
              child: Image.asset(coffee.image));
          }),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:pokemon_app/enums/types_etension.dart';
import 'package:pokemon_app/helpers/string_helper.dart';
import 'package:pokemon_app/widgets/pokemon_type_tag.dart';

class MoveDetailPage extends StatefulWidget {
  static String routeName = '/move-details';
  @override
  _MoveDetailPageState createState() => _MoveDetailPageState();
}

class _MoveDetailPageState extends State<MoveDetailPage> {
  bool _isInit = true;
  bool _isLoading = false;
  String _nameFromRoute;
  List _typesFromRoute;
  String _idFromRoute;
  String _imageUrlFromRoute;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _getPokemonData();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void _getPokemonData() async {
    final data =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    setState(() {
      _isLoading = true;
      _nameFromRoute = data['name'];
      _idFromRoute = data['id'];
      _typesFromRoute = data['types'];
      _imageUrlFromRoute = data['imageUrl'];
    });

    setState(() {
      _isLoading = false;
    });
  }

  Row _buildTypesRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _typesFromRoute
          .map((type) => Padding(
                padding: const EdgeInsets.all(5),
                child: PokemonTypeTag(
                  typeName: type.toString(),
                  typeIcon: AssetImage('assets/images/$type.png'),
                  gradientColors: TypesExtension.parseToType(type).colors,
                ),
              ))
          .toList(),
    );
  }

  Widget _verticalSpacer({double height = 30}) {
    return SizedBox(
      height: height,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: TypesExtension.parseToType(_typesFromRoute[0]).colors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 40,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Stack(
                overflow: Overflow.visible,
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 60, 20, 20),
                      child: SingleChildScrollView(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                StringHelper.setToDisplayPattern(
                                    _nameFromRoute),
                                style: TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.w300),
                              ),
                              _verticalSpacer(),
                              _buildTypesRow(),
                              _verticalSpacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -50,
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors:
                                TypesExtension.parseToType(_typesFromRoute[0])
                                    .colors,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Hero(
                          tag: _idFromRoute,
                          child: Image.asset(
                            _imageUrlFromRoute,
                            height: 100,
                            width: 100,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

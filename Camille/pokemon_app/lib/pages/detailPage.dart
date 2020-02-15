import 'package:flutter/material.dart';
import 'package:pokemon_app/components/loader.dart';
import 'package:pokemon_app/components/stats.dart';
import 'package:pokemon_app/components/typeWithName.dart';
import 'package:pokemon_app/models/pokemon.dart';
import 'package:pokemon_app/models/types.dart';
import 'package:pokemon_app/service/api.dart';

class DetailPage extends StatefulWidget {
  String id;
  Color color;
  String image;

  DetailPage({this.id, this.color, this.image});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Pokemon pokemon;

  _getPokemonDetail() async {
    String id = widget.id;

    Pokemon _pokemon = await Api.getDetail(id);
    setState(() {
      pokemon = _pokemon;
    });
  }

  @override
  void initState() {
    super.initState();
    _getPokemonDetail();
  }

  Widget _renderType(Types item) {
    return TypeWithName(
      color: item.color,
      icon: item.icon,
      name: item.name,
    );
  }

  Widget _renderTypes() {
    return Row(
      children: pokemon.types.map((item) => _renderType(item)).toList(),
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  Widget _renderStatus() {
    return Column(
      children: pokemon.stats
          .map((item) => StatsProgress(
                name: item.name,
                value: item.value,
                color: widget.color,
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: widget.color,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.83,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(80.0),
                        topRight: const Radius.circular(80.0))),
                child: Column(
                  children: <Widget>[getContent()],
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: (MediaQuery.of(context).size.width / 2) - 75,
            child: SizedBox(
              width: 150,
              height: 150,
              child: Hero(
                tag: widget.id,
                child: Image.network(widget.image),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getContent() {
    if (pokemon == null)
      return Loader(
        height: MediaQuery.of(context).size.height * 0.83,
      );

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 15, top: 35),
          child: Text(
            pokemon.name,
            style:
                TextStyle(color: Color.fromRGBO(79, 79, 79, 1), fontSize: 30),
          ),
        ),
        _renderTypes(),
        Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 35),
          child: Text(
            pokemon.description,
            style:
                TextStyle(color: Color.fromRGBO(79, 79, 79, 1), fontSize: 15),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: Text(
            "STATS",
            style: TextStyle(color: widget.color, fontSize: 15),
          ),
        ),
        _renderStatus()
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nir/model/model_manager.dart';
import 'package:nir/painting/block_tile.dart';

class ModelDetailsScreen extends StatefulWidget {
  ModelDetailsScreen({Key? key, required this.manager}) : super(key: key);

  ModelManager manager;

  @override
  State<ModelDetailsScreen> createState() => _ModelDetailsScreenState();
}

class _ModelDetailsScreenState extends State<ModelDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Внутренний контур'),
              BlockTile(
                block: widget.manager.model.he1,
                temperature: true,
                pressure: true,
              ),
              const SizedBox(height: 10),
              BlockTile(
                block: widget.manager.model.he2,
                temperature: true,
                pressure: true,
              ),
              const SizedBox(height: 10),
              BlockTile(
                block: widget.manager.model.td,
                temperature: true,
                koef: true,
              ),
              const SizedBox(height: 10),
              BlockTile(
                block: widget.manager.model.th1,
                temperature: true,
                pressure: true,
              )
            ],
          ),
          const SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Наружний контур'),
              BlockTile(
                block: widget.manager.model.he3,
                temperature: true,
                pressure: true,
              ),
              const SizedBox(height: 10),
              BlockTile(
                block: widget.manager.model.th2,
                temperature: true,
                pressure: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

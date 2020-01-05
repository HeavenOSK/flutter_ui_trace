import 'package:flutter/material.dart';

const _message = 'Happy New Year, HeavenOSK!';

class ListItem extends StatelessWidget {
  const ListItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.black.withOpacity(0.3),
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(width: 32),
          Expanded(
            child: _buildContent(),
          ),
          Icon(
            Icons.navigate_next,
            size: 32,
            color: Colors.black.withOpacity(0.3),
          ),
        ],
      ),
    );
  }

  Column _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitleRow(),
        _buildHeading(),
        _buildMessage(),
      ],
    );
  }

  Text _buildMessage() {
    return Text(
      _message * 3,
      style: TextStyle(
        fontSize: 18,
        color: Colors.black.withOpacity(0.3),
      ),
      maxLines: 2,
    );
  }

  Text _buildHeading() {
    return const Text(
      _message,
      style: TextStyle(
        fontSize: 18,
      ),
    );
  }

  Row _buildTitleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTitle(),
        _buildTime(),
      ],
    );
  }

  Text _buildTitle() {
    return const Text(
      'Hi! HeavenOSK!',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  Text _buildTime() {
    return Text(
      '20:06',
      style: TextStyle(
        fontSize: 18,
        color: Colors.black.withOpacity(0.3),
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:http/http.dart';
import 'package:webfeed/webfeed.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() => runApp(HelloApp());

class HelloApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _title = "Telescope";
    return MaterialApp(
      title: _title,
      home: TelescopePage(title: _title),
    );
  }
}

class TelescopePage extends StatefulWidget {
  TelescopePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TelescopePageState createState() => _TelescopePageState();
}

class _TelescopePageState extends State<TelescopePage> {
  List<RssItem> _rssItems = [];

  @override
  Widget build(BuildContext context) {
    _readFeed("https://www.nasa.gov/rss/dyn/lg_image_of_the_day.rss");
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: _createUI());
  }

  _createUI() {
    return ListView.separated(
        padding: EdgeInsets.all(8.0),
        separatorBuilder: (context, index) => Divider(),
        itemCount: _rssItems.length,
        itemBuilder: _buildItem);
  }

  Widget _buildItem(BuildContext context, int index) {
    RssItem _item = _rssItems[index];
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TelescopeDetailsPage(item: _item)));
      },
      title: _createText(_item.title),
      subtitle: _createText(_item.description),
    );
  }

  Widget _createText(String text) {
    if (text != null && text.isNotEmpty) {
      return new Text(text);
    }
    return null;
  }

  Future<bool> _readFeed(String url) async {
    bool _success = false;
    var _httpClient = new Client();
    var _response = await _httpClient.get(Uri.parse(url));
    if (_response.statusCode == 200) {
      String _body = _response.body;
      var _feed = new RssFeed.parse(_body);
      setState(() {
        _rssItems = _feed.items;
      });
      _success = true;
    }
    _httpClient.close();
    return _success;
  }
}

class TelescopeDetailsPage extends StatefulWidget {
  TelescopeDetailsPage({Key key, @required this.item}) : super(key: key);

  final RssItem item;

  @override
  _TelescopeDetailsPageState createState() => _TelescopeDetailsPageState();
}

class _TelescopeDetailsPageState extends State<TelescopeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.item.title),
        ),
        body: _createImageFromRssItem(widget.item));
  }

  Widget _createImageFromRssItem(RssItem item) {
    if (item != null && item.enclosure != null) {
      return Align(
          child: CachedNetworkImage(
              imageUrl: item.enclosure.url, fit: BoxFit.contain),
          alignment: Alignment.topCenter);
    }
    return null;
  }
}

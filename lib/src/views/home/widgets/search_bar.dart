part of 'home_widgets.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: <Widget>[
          SizedBox(width: 8.0),
          FaIcon(FontAwesomeIcons.search),
          SizedBox(width: 20.0),
          Text(
            '¿Qué estas busacando?',
            style: TextStyle(fontSize: 16.0),
          )
        ],
      ),
    );
  }
}

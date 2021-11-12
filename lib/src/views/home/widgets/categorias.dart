part of 'home_widgets.dart';

const categorias = [
  {'nombre': 'Restuarantes', 'icon': FontAwesomeIcons.utensils},
  {'nombre': 'Bebidas', 'icon': FontAwesomeIcons.wineBottle},
  {'nombre': 'Tecnologia', 'icon': FontAwesomeIcons.seedling},
  {'nombre': 'Market', 'icon': FontAwesomeIcons.seedling},
  {'nombre': 'Ferreteria', 'icon': FontAwesomeIcons.hammer},
  {'nombre': 'Farmacia', 'icon': FontAwesomeIcons.pills},
];

class Categorias extends StatelessWidget {
  const Categorias({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: responsive.portrait
          ? Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _Categoria(
                      responsive: responsive,
                      title: categorias[0]['nombre'] as String?,
                      icon: categorias[0]['icon'] as IconData?,
                    ),
                    _Categoria(
                      responsive: responsive,
                      title: categorias[1]['nombre'] as String?,
                      icon: categorias[1]['icon'] as IconData?,
                    ),
                    _Categoria(
                      responsive: responsive,
                      title: categorias[2]['nombre'] as String?,
                      icon: categorias[2]['icon'] as IconData?,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _Categoria(
                      responsive: responsive,
                      title: categorias[3]['nombre'] as String?,
                      icon: categorias[3]['icon'] as IconData?,
                    ),
                    _Categoria(
                      responsive: responsive,
                      title: categorias[4]['nombre'] as String?,
                      icon: categorias[4]['icon'] as IconData?,
                    ),
                    _Categoria(
                      responsive: responsive,
                      title: categorias[5]['nombre'] as String?,
                      icon: categorias[5]['icon'] as IconData?,
                    ),
                  ],
                )
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                categorias.length,
                (index) => _Categoria(
                  responsive: responsive,
                  title: categorias[index]['nombre'] as String?,
                  icon: categorias[index]['icon'] as IconData?,
                ),
              ),
            ),
    );
  }
}

class _Categoria extends StatelessWidget {
  const _Categoria({
    Key? key,
    this.responsive,
    this.title,
    this.icon,
  }) : super(key: key);
  final ResponsiveUtil? responsive;

  final String? title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: responsive!.diagonalP(10),
      height: responsive!.diagonalP(14),
      // decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipOval(
            child: Container(
              height: responsive!.diagonalP(9),
              width: responsive!.diagonalP(9),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.2),
              ),
              child: IconButton(
                onPressed: () {},
                icon: FaIcon(icon),
                iconSize: responsive!.diagonalP(6),
              ),
            ),
          ),
          FittedBox(child: Text(title!))
        ],
      ),
    );
  }
}

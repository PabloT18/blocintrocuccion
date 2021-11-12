part of 'home_widgets.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil(context);

    return SafeArea(
      child: Drawer(
        child: Column(
          children: <Widget>[
            //Imagen y nombre del usuario logeado
            _UserIcon(responsive: responsive),

            //Listado de opciones
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    _Item(
                      icon: FontAwesomeIcons.home,
                      title: 'Home',
                      onTap: () {
                        print("dadad");
                      },
                    ),
                    _Item(
                      icon: FontAwesomeIcons.user,
                      title: 'Mis Cuenca',
                      onTap: () {
                        print("dadad");
                      },
                    ),
                    _Item(
                      icon: FontAwesomeIcons.clipboardList,
                      title: 'Mis Pedidos',
                      onTap: () {
                        print("dadad");
                      },
                    ),
                    _Item(
                      icon: Icons.home,
                      title: 'Informacion',
                      onTap: () {
                        print("dadad");
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Btn Crerrar secion
            ListTile(
              title: Text(
                'Cerrar sesion',
                style: TextStyle(fontSize: 14.0),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _UserIcon extends StatelessWidget {
  const _UserIcon({
    Key? key,
    required this.responsive,
  }) : super(key: key);

  final ResponsiveUtil responsive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: responsive.altoP(20),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.supervised_user_circle,
              size: responsive.diagonalP(10),
            ),
          ),
          Text('User Name',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0))
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FaIcon(icon),
      title: Text(
        title,
        style: TextStyle(fontSize: 16.0),
      ),
      onTap: () => onTap(),
    );
  }
}

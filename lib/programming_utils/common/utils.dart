import 'package:warhammer/global_imports.dart';

///Empty non-constructed class that contains a bunch of common methods
class CommonUtils {

  static Padding paddedIcon({required Icon icon, double padding = 8.0})
  => Padding( 
              padding: EdgeInsets.all(padding),
              child: icon,
            );
//-----------------------------------------------------
///From the immediate context, pops the stack and also displays the IOS icon button.
  static IconButton customBackButton(BuildContext context) 
   => IconButton.filled
      (
        onPressed: ()=>Navigator.maybePop(context), 
        icon: Icon(Icons.arrow_back_ios_new), 
        style: IconButton.styleFrom
                (
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.black,
                ),
      );
//-----------------------------------------------------
//Displays a rounded image with custom width and height.
  static SizedBox roundedImage({required double width, required double height, required String imagePath}) =>
  SizedBox(
            width: width,
            height: height,
            child: ClipRRect
            (
              borderRadius: BorderRadiusGeometry.circular(25),
              child: Image.asset
                    (
                      imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.broken_image);
                      },
                    ),
            ),
          );
//-----------------------------------------------------
//Displays data given the strings and preforms a function based on onTap if given
  static Card abilityCardNavigator({
          required BuildContext context,required String usage,required String title,
          required String description, VoidCallback? onTap, IconData icon = Icons.hide_image}) 
    => Card
    (
    elevation: 5.0,
    child: ListTile(
      onTap: onTap,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          const Spacer(flex: 4),
          Icon(icon), // This should be replaced with the spearhead faction image
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(usage),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(description),
          ),
        ],
      ),
    ),
  );
  
}

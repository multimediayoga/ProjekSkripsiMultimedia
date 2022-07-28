import 'package:kelolapps/config/kelolaku/constant.dart';

class ProductPromoModel{
  final String name, description, image, variant;
  final double price;

  ProductPromoModel(this.name, this.description, this.image, this.price, this.variant);
}

ProductPromoModel foodModel1 = ProductPromoModel("Lampia Tiga Lima with Japanese Sauce", "In to am attended desirous raptures declared diverted confined at. Collected instantly remaining up certainly to necessary as. Over walk dull into son boy door went new. At or happiness commanded daughters as. Is handsome an declared at received in extended vicinity subjects. "
    "Into miss on he over been late pain an. Only week bore boy what fat case left use. Match round scale now sex style far times. Your me past an much. Left till here away at to whom past. Feelings laughing at no wondered repeated provided finished. It acceptance thoroughly my advantages everything as. Are projecting inquietude affronting preference saw who. Marry of am do avoid ample as. Old disposal followed she ignorant desirous two has. Called played entire roused though for one too. He into walk roof made tall cold he. Feelings way likewise addition wandered contempt bed indulged.", "$PRODUCT_IMAGE_URL/food-1.jpg", 20000, "Level 5");

ProductPromoModel burger1 = ProductPromoModel("Burger Tower Izayaki", "In to am attended desirous raptures declared diverted confined at. Collected instantly remaining up certainly to necessary as. Over walk dull into son boy door went new. At or happiness commanded daughters as. Is handsome an declared at received in extended vicinity subjects. "
    "Into miss on he over been late pain an. Only week bore boy what fat case left use. Match round scale now sex style far times. Your me past an much. Left till here away at to whom past. Feelings laughing at no wondered repeated provided finished. It acceptance thoroughly my advantages everything as. Are projecting inquietude affronting preference saw who. Marry of am do avoid ample as. Old disposal followed she ignorant desirous two has. Called played entire roused though for one too. He into walk roof made tall cold he. Feelings way likewise addition wandered contempt bed indulged.", "$PRODUCT_IMAGE_URL/burger-1.jpg", 50000, "Level 3");

ProductPromoModel beverage1 = ProductPromoModel("Nata de Coco", "In to am attended desirous raptures declared diverted confined at. Collected instantly remaining up certainly to necessary as. Over walk dull into son boy door went new. At or happiness commanded daughters as. Is handsome an declared at received in extended vicinity subjects. "
    "Into miss on he over been late pain an. Only week bore boy what fat case left use. Match round scale now sex style far times. Your me past an much. Left till here away at to whom past. Feelings laughing at no wondered repeated provided finished. It acceptance thoroughly my advantages everything as. Are projecting inquietude affronting preference saw who. Marry of am do avoid ample as. Old disposal followed she ignorant desirous two has. Called played entire roused though for one too. He into walk roof made tall cold he. Feelings way likewise addition wandered contempt bed indulged.", "$PRODUCT_IMAGE_URL/beverage-1.jpg", 10000, "Jumbo");


class PaketBundleModel{
  String name, description, image;
  double normalPrice;
  double newPrice;
  List<ProductPromoModel>? productInsideBundle;
  PaketBundleModel({required this.name, required this.description, required this.normalPrice, required this.newPrice, required this.image, this.productInsideBundle});
}

List<PaketBundleModel> getPaketBundle(){
  List<PaketBundleModel> list = [];
  list.add(PaketBundleModel(name: "Paket Terang Benderang", description: "Makanan Tengah Malam untuk Pasangan", normalPrice: 200000, newPrice: 180000, image: "$PROMO_IMAGES_URL/3.png", productInsideBundle: [foodModel1, beverage1]));
  list.add(PaketBundleModel(name: "Paket Kenyang", description: "Lebih murah meriah dengan pesan produk ini", normalPrice: 200000, newPrice: 150000, image: "$PROMO_IMAGES_URL/4.png", productInsideBundle: [burger1, beverage1]));
  return list;
}
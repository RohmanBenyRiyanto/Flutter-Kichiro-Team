import '../utils/importer.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({
    Key? key,
    required this.produkModel,
    this.onPressed,
    this.buttonTitle,
  }) : super(key: key);

  final ProdukModel produkModel;
  final String? buttonTitle;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ThemesMargin.screenWidth(),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: ThemesColor.secondaryColor,
        borderRadius: ThemesMargin.defaultRadius,
      ),
      child: Row(
        children: [
          Container(
            height: 116.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: ThemesColor.whiteColor,
              borderRadius: BorderRadius.circular(4.0.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0.r),
              child: Image.network(
                produkModel.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: ThemesMargin.horizontalMargin8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      produkModel.name,
                      style: FontStyles.h3.copyWith(
                        color: ThemesColor.darkColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
                    ),
                    Text(
                      'By ${produkModel.creator}',
                      style: FontStyles.smallregular.copyWith(
                        color: ThemesColor.subtitleColor,
                      ),
                    ),
                    Text(
                      produkModel.description,
                      style: FontStyles.caption.copyWith(
                        color: ThemesColor.subtitleColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rp. ${produkModel.price}',
                          style: FontStyles.h4.copyWith(
                            color: ThemesColor.greyColor,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),
                        SizedBox(
                          width: ThemesMargin.horizontalMargin8,
                        ),
                        GestureDetector(
                          onTap: onPressed,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 8.0,
                            ),
                            decoration: BoxDecoration(
                              color: ThemesColor.primaryColor,
                              borderRadius: BorderRadius.circular(4.0.r),
                            ),
                            child: Text(
                              buttonTitle ?? 'Add to Cart',
                              style: FontStyles.overlineMedium.copyWith(
                                color: ThemesColor.whiteColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

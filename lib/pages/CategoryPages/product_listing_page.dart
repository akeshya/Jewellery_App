import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/components/filter_row_component.dart';
import 'package:shopping_cart/components/flicker_animation_loader.dart';
import 'package:shopping_cart/controllers/PostControllers/get_sub_category_list_controller.dart';
import 'package:shopping_cart/controllers/filters_controller.dart';
import 'package:shopping_cart/model/category_list_modal.dart';
import 'package:shopping_cart/pages/product_details_page.dart';
import '../../components/categories_components.dart';
import '../../components/common_components.dart';
import '../../components/filter_row.dart';
import '../../utils/CustomColors.dart';
import '../../utils/CustomTextStyle.dart';
import '../../utils/app_colors.dart';

class ProductListingPage extends StatefulWidget {
  const ProductListingPage({Key? key})
      : super(key: key);

  @override
  State<ProductListingPage> createState() => _ProductListingPageState();
}

class _ProductListingPageState extends State<ProductListingPage> {
  late Category currentCategory;
  String selectedSubCategory = 'All';
  String selectedViewMode = 'GridView';

  final getSubCategoryController = Get.find<GetSubCategoryListController>();

  final filtersController = Get.put(FiltersController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final arguments = Get.arguments;

    currentCategory = arguments['category'];

    print('selected category is: $currentCategory');
    Future.delayed(Duration.zero, () {
      filtersController.getProductsList(currentCategory.id.toString());
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<List<Object>> fetchSuggestions(String query) async {
    final List<Object> filteredProducts = [];

    for (var product in filtersController.filteredProductList) {
      if (product.name.toLowerCase().contains(query.toLowerCase())) {
        filteredProducts.add(product);
      }
    }

    return filteredProducts;
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: commonAppBar(
          currentCategory.cname,
          context,
          [
            InkWell(
              onTap: () => filterBottomSheet(context),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: filterRow(Icons.filter_list, "Filter"),
              ),
            ),
            SizedBox(width: 20),
          ]),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 50,
                  child: commonSearchBar(context, 'productListing', 'Search',
                      (query) async {
                    return fetchSuggestions(query);
                  }, 20, CustomColors.COLOR_PRIMARY_500, Colors.white),
                ),
                SizedBox(height: 5),
                FilterRow(
                  filterOptions: getSubCategoryController.categorySubCategoryList,
                  selectedFilter: selectedSubCategory,
                  selectedViewMode: selectedViewMode,
                  onFilterSelected: (filter) {
                    // Handle filter selection here
                    if (filter == 'All') {
                      filtersController.filteredProductList.value = filtersController.categoryProductList;
                    } else {
                      filtersController.filteredProductList.value = filtersController.categoryProductList
                          .where((data) => data.subName == filter)
                          .toList();
                    }
                    setState(() {
                      selectedSubCategory = filter;
                    });
                  },
                  onViewModeSelected: (viewMode) {
                    // Handle view mode selection here
                    setState(() {
                      selectedViewMode = viewMode;
                    });
                  },
                ),
                SizedBox(height: 10),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () => filtersController.getProductsList(currentCategory.id.toString()),
                    child: Padding(
                        padding: const EdgeInsets.only(bottom: 150.0),
                        child: categoryProductListing(context)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  categoryProductListing(BuildContext context) {
    if (filtersController.filtersApplied.isTrue) applyFilters();

    return selectedViewMode == 'GridView'
        ? Obx(
            () => GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.6,
                crossAxisCount: 2, // Number of columns
                mainAxisSpacing: 8, // Vertical spacing between items
                crossAxisSpacing: 8, // Horizontal spacing between items
              ),
              itemCount: filtersController.applyFilters.isTrue
                  ? 10
                  : filtersController.filteredProductList.length,
              itemBuilder: (BuildContext context, int index) {
                return filtersController.applyFilters.isTrue
                    ? FlickeringLoadingWidget(Colors.grey)
                    : GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => ProductDetailsPage(
                                    product: filtersController.filteredProductList[index]))),
                        child: categoryProductItem(
                            context, filtersController.filteredProductList[index]));
              },
            ),
          )
        : Obx(
            () => ListView.builder(
                shrinkWrap: true,
                itemCount: filtersController.applyFilters.isTrue
                    ? 10
                    : filtersController.filteredProductList.length,
                itemBuilder: (BuildContext context, int index) {
                  return filtersController.applyFilters.isTrue
                      ? FlickeringLoadingWidget(Colors.grey)
                      : GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => ProductDetailsPage(
                                      product: filtersController.filteredProductList[index]))),
                          child: Container(
                              height: MediaQuery.of(context).devicePixelRatio *
                                  MediaQuery.of(context).size.height *
                                  0.2,
                              child: categoryProductItem(
                                  context, filtersController.filteredProductList[index])),
                        );
                }),
          );
  }

  filterBottomSheet(BuildContext context) {
    _scaffoldKey.currentState!.showBottomSheet(
      (context) {
        return filterBottomSheetContent(context);
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16), topLeft: Radius.circular(16))),
    );
  }

  filterBottomSheetContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border.all(color: AppColors.primaryColor500, width: 2),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(16), topLeft: Radius.circular(16)),
      ),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(elevation: 5,
            color: AppColors.primaryColor500,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.close,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
                Obx(() =>
                  Text(
                    "Sort & Filter: ${filtersController.filteredProductList.length} Items",
                    style: CustomTextStyle.textFormFieldMedium.copyWith(
                        color: Colors.white, fontSize: 16),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await filtersController.getProductsList(currentCategory.id.toString());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Reset",
                      style: CustomTextStyle.textFormFieldBold.copyWith(
                          color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Weight filters
          SizedBox(height: 5),
          Card(elevation: 5,
          child: Column(children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Weight (Low-High)",
                      style: CustomTextStyle.textFormFieldMedium),
                  Obx(() => Switch(
                      value: filtersController.weightLowToHigh.value,
                      onChanged: (val) async {
                        filtersController.weightLowToHigh.value = val;
                        filtersController.applyFilters.value = true;
                        applyFilters();
                      }))
                ],
              ),
              margin: EdgeInsets.only(left: 4),
            ),
            SizedBox(height: 5),
            Container(
              child: Obx(() => Text(
                  'Range ${filtersController.weightRange.value.start.toStringAsFixed(2)}-${filtersController.weightRange.value.end.toStringAsFixed(2)} (in grams)',
                  style: CustomTextStyle.textFormFieldMedium)),
              margin: EdgeInsets.only(left: 4),
            ),
            SizedBox(height: 5),
            Obx(
                  () => RangeSlider(
                values: filtersController.weightRange.value,
                onChanged: (RangeValues values) {
                  filtersController.updateWeightRange(values.start, values.end);
                },
                onChangeStart: (RangeValues values) async {
                  filtersController.applyFilters.value = true;
                },
                onChangeEnd: (RangeValues values) {
                  applyFilters();
                },
                min: filtersController.minWeight.value,
                max: filtersController.maxWeight.value,
              ),
            ),
          ],),
          ),
          Container(
            width: double.infinity,
            height: 1.5,
            color: Colors.grey,
          ),

          //Size filters
          SizedBox(height: 5),
          Card(elevation: 5, child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Size (Low-High)",
                        style: CustomTextStyle.textFormFieldMedium),
                    Obx(
                          () => Switch(
                          value: filtersController.sizeLowToHigh.value,
                          onChanged: (val) async {
                            filtersController.sizeLowToHigh.value = val;
                            filtersController.applyFilters.value = true;
                            applyFilters();
                          }),
                    )
                  ],
                ),
                margin: EdgeInsets.only(left: 4),
              ),
              SizedBox(height: 5),
              Container(
                child: Obx(() => Text(
                    'Range ${filtersController.sizeRange.value.start.toInt()}-${filtersController.sizeRange.value.end.toInt()} (in inch)',
                    style: CustomTextStyle.textFormFieldMedium)),
                margin: EdgeInsets.only(left: 4),
              ),
              SizedBox(height: 5),
              Obx(
                    () => RangeSlider(
                  values: filtersController.sizeRange.value,
                  onChanged: (RangeValues values) {
                    filtersController.updateSizeRange(
                        values.start.toInt(), values.end.toInt());
                  },
                  onChangeStart: (RangeValues values) async {
                    filtersController.applyFilters.value = true;
                  },
                  onChangeEnd: (RangeValues values) {
                    applyFilters();
                  },
                  min: filtersController.minSize.value,
                  max: filtersController.maxSize.value,
                ),
              ),
            ],
          )),
          Container(
            width: double.infinity,
            height: 1.5,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  var border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.grey.shade300, width: 1));

  void applyFilters() async {
    print('products list is:::::::: ${filtersController.filteredProductList}');

    filtersController.filteredProductList.value = filtersController.categoryProductList;

    filtersController.filteredProductList.value = filtersController.filteredProductList.where((product) {
        final productWeight = product.productsize[0].productWeight;
        if (productWeight != null &&
            productWeight >= filtersController.weightRange.value.start.toInt() &&
            productWeight <= filtersController.weightRange.value.end.toInt()) {
          return true; // Include the product in the filtered list
        }
      return false; // Exclude the product from the filtered list
    }).toList();

    if (filtersController.weightLowToHigh.isTrue) {
      filtersController.filteredProductList.sort((a, b) => a.productsize[0].productWeight
          .compareTo(b.productsize[0].productWeight));
    }

    filtersController.filteredProductList.value = filtersController.filteredProductList.where((product) {
      final productSize = int.parse(product.productsize[0].size);
      if (productSize >= filtersController.sizeRange.value.start.toInt() &&
          productSize <= filtersController.sizeRange.value.end.toInt()) {
        return true; // Include the product in the filtered list
      }
      return false; // Exclude the product from the filtered list
    }).toList();

    if (filtersController.sizeLowToHigh.isTrue) {
      filtersController.filteredProductList.sort((a, b) => a.productsize[0].size
          .compareTo(b.productsize[0].size));
    }

    filtersController.applyFilters.value = false;
    filtersController.filtersApplied.value = true;
  }
}
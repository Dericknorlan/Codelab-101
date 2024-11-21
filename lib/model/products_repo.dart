// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:codelab101/model/products.dart';

class ProductsRepository {
  static List<Product> loadProducts(Category category) {
    const allProducts = <Product>[
      Product(
        category: Category.Food,
        id: 0,
        isFeatured: true,
        name: 'Rice',
        price: 75,
        description: "Premium quality rice, perfect for every meal. Known for its soft texture and rich flavor, this rice cooks to perfection every time. Whether you're preparing a simple side dish or a hearty main course, it’s a versatile ingredient that complements any cuisine. Packed with essential nutrients, it's an ideal choice for healthy, delicious meals.",
      ),
      Product(
        category: Category.Food,
        id: 1,
        isFeatured: true,
        name: 'Oil',
        price: 65,
        description: "High-quality cooking oil, perfect for all your culinary needs. Whether frying, sautéing, or dressing salads, this oil ensures a smooth texture and enhances the natural flavors of your ingredients. Rich in healthy fats, it provides a versatile and nutritious addition to your kitchen, promoting both taste and health in every dish.",
      ),
      Product(
        category: Category.Food,
        id: 2,
        isFeatured: false,
        name: 'Noodle',
        price: 35,
        description: 'Delicious and versatile noodles, perfect for creating a wide variety of dishes. Made from high-quality ingredients, these noodles have a smooth texture and absorb flavors beautifully. Whether used in soups, stir-fries, or as a side dish, they cook quickly and easily, making them an ideal choice for fast, flavorful meals.',
      ),
      Product(
        category: Category.Food,
        id: 3,
        isFeatured: true,
        name: 'Biscuit',
        price: 12,
        description: 'Crispy, golden biscuits that melt in your mouth with every bite. Perfectly baked to a light and flaky texture, these biscuits are an ideal snack or accompaniment to any meal. Made with high-quality ingredients, they offer a deliciously comforting taste, whether enjoyed on their own or with a spread.',
      ),
      Product(
        category: Category.Clothes,
        id: 4,
        isFeatured: false,
        name: 'T-shirt',
        price: 400,
        description: 'Comfortable and stylish, this T-shirt is crafted from soft, breathable fabric for all-day wear. With a flattering fit and versatile design, it’s perfect for casual outings or layering under a jacket. Available in a variety of colors, this T-shirt combines comfort, durability, and a timeless look for any wardrobe.',
      ),
      Product(
        category: Category.Clothes,
        id: 5,
        isFeatured: true,
        name: 'pant',
        price: 1000,
        description: 'Versatile and comfortable, these pants are designed for both style and functionality. Made from high-quality fabric, they offer a perfect balance of durability and breathability, ensuring comfort throughout the day. Whether dressing up or down, these pants provide a sleek, tailored look that pairs effortlessly with any outfit.',
      ),
      Product(
        category: Category.Clothes,
        id: 6,
        isFeatured: true,
        name: '',
        price: 0,
        description: '',
      ),
      Product(
        category: Category.Clothes,
        id: 7,
        isFeatured: true,
        name: '',
        price: 0,
        description: '',
      ),
      Product(
        category: Category.Clothes,
        id: 8,
        isFeatured: false,
        name: '',
        price: 0,
        description: '',
      ),
      Product(
        category: Category.Clothes,
        id: 9,
        isFeatured: false,
        name: '',
        price: 0,
        description: '',
      ),

    ];
    
    if (category == Category.all) {
      return allProducts;
    } else {
      return allProducts.where((Product p) {
        return p.category == category;
      }).toList();
    }
  }
}

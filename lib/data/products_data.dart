import '../models/product.dart';

class ProductsData {
  static final Map<String, List<Product>> products = {
    'kids': [
      Product(
        id: 1,
        name: "Kids T-Shirt",
        price: 19.99,
        oldPrice: 24.99,
        images: [
          "https://picsum.photos/300/300?random=6",
          "https://picsum.photos/300/300?random=60",
          "https://picsum.photos/300/300?random=61",
          "https://picsum.photos/300/300?random=62"
        ],
        discount: "-20%",
        category: 'kids',
      ),
      Product(
        id: 2,
        name: "Children's Jeans",
        price: 29.99,
        images: [
          "https://picsum.photos/300/300?random=7",
          "https://picsum.photos/300/300?random=70",
          "https://picsum.photos/300/300?random=71",
          "https://picsum.photos/300/300?random=72"
        ],
        category: 'kids',
      ),
      Product(
        id: 3,
        name: "Kids Sweater",
        price: 34.99,
        oldPrice: 39.99,
        images: [
          "https://picsum.photos/300/300?random=8",
          "https://picsum.photos/300/300?random=80",
          "https://picsum.photos/300/300?random=81",
          "https://picsum.photos/300/300?random=82"
        ],
        discount: "-13%",
        category: 'kids',
      ),
      Product(
        id: 4,
        name: "Children's Shoes",
        price: 49.99,
        images: [
          "https://picsum.photos/300/300?random=9",
          "https://picsum.photos/300/300?random=90",
          "https://picsum.photos/300/300?random=91",
          "https://picsum.photos/300/300?random=92"
        ],
        category: 'kids',
      ),
    ],
    'baby': [
      Product(
        id: 5,
        name: "Baby Bodysuit",
        price: 14.99,
        oldPrice: 19.99,
        images: [
          "https://picsum.photos/300/300?random=10",
          "https://picsum.photos/300/300?random=100",
          "https://picsum.photos/300/300?random=101",
          "https://picsum.photos/300/300?random=102"
        ],
        discount: "-25%",
        category: 'baby',
      ),
      Product(
        id: 6,
        name: "Baby Romper",
        price: 22.99,
        images: [
          "https://picsum.photos/300/300?random=11",
          "https://picsum.photos/300/300?random=110",
          "https://picsum.photos/300/300?random=111",
          "https://picsum.photos/300/300?random=112"
        ],
        category: 'baby',
      ),
    ],
    'women': [
      Product(
        id: 7,
        name: "Women's Dress",
        price: 59.99,
        oldPrice: 69.99,
        images: [
          "https://picsum.photos/300/300?random=12",
          "https://picsum.photos/300/300?random=120",
          "https://picsum.photos/300/300?random=121",
          "https://picsum.photos/300/300?random=122"
        ],
        discount: "-14%",
        category: 'women',
      ),
      Product(
        id: 8,
        name: "Women's Blouse",
        price: 39.99,
        images: [
          "https://picsum.photos/300/300?random=13",
          "https://picsum.photos/300/300?random=130",
          "https://picsum.photos/300/300?random=131",
          "https://picsum.photos/300/300?random=132"
        ],
        category: 'women',
      ),
    ],
    'men': [
      Product(
        id: 9,
        name: "Men's Shirt",
        price: 44.99,
        images: [
          "https://picsum.photos/300/300?random=14",
          "https://picsum.photos/300/300?random=140",
          "https://picsum.photos/300/300?random=141",
          "https://picsum.photos/300/300?random=142"
        ],
        category: 'men',
      ),
      Product(
        id: 10,
        name: "Men's Pants",
        price: 49.99,
        oldPrice: 59.99,
        images: [
          "https://picsum.photos/300/300?random=15",
          "https://picsum.photos/300/300?random=150",
          "https://picsum.photos/300/300?random=151",
          "https://picsum.photos/300/300?random=152"
        ],
        discount: "-17%",
        category: 'men',
      ),
    ],
    'accessories': [
      Product(
        id: 11,
        name: "Baby Blanket",
        price: 29.99,
        images: [
          "https://picsum.photos/300/300?random=16",
          "https://picsum.photos/300/300?random=160",
          "https://picsum.photos/300/300?random=161",
          "https://picsum.photos/300/300?random=162"
        ],
        category: 'accessories',
      ),
      Product(
        id: 12,
        name: "Nursing Cover",
        price: 24.99,
        oldPrice: 29.99,
        images: [
          "https://picsum.photos/300/300?random=17",
          "https://picsum.photos/300/300?random=170",
          "https://picsum.photos/300/300?random=171",
          "https://picsum.photos/300/300?random=172"
        ],
        discount: "-17%",
        category: 'accessories',
      ),
    ],
    'sale': [
      Product(
        id: 13,
        name: "Winter Jacket",
        price: 79.99,
        oldPrice: 99.99,
        images: [
          "https://picsum.photos/300/300?random=18",
          "https://picsum.photos/300/300?random=180",
          "https://picsum.photos/300/300?random=181",
          "https://picsum.photos/300/300?random=182"
        ],
        discount: "-20%",
        category: 'sale',
      ),
      Product(
        id: 14,
        name: "Baby Shoes",
        price: 19.99,
        oldPrice: 29.99,
        images: [
          "https://picsum.photos/300/300?random=19",
          "https://picsum.photos/300/300?random=190",
          "https://picsum.photos/300/300?random=191",
          "https://picsum.photos/300/300?random=192"
        ],
        discount: "-33%",
        category: 'sale',
      ),
    ],
    'electronics': [
      Product(
        id: 15,
        name: "Smartphone",
        price: 599.99,
        oldPrice: 699.99,
        images: [
          "https://picsum.photos/300/300?random=20",
          "https://picsum.photos/300/300?random=200",
          "https://picsum.photos/300/300?random=201",
          "https://picsum.photos/300/300?random=202"
        ],
        discount: "-14%",
        category: 'electronics',
      ),
      Product(
        id: 16,
        name: "Wireless Earbuds",
        price: 89.99,
        images: [
          "https://picsum.photos/300/300?random=21",
          "https://picsum.photos/300/300?random=210",
          "https://picsum.photos/300/300?random=211",
          "https://picsum.photos/300/300?random=212"
        ],
        category: 'electronics',
      ),
    ],
    'home': [
      Product(
        id: 19,
        name: "Kitchen Set",
        price: 129.99,
        oldPrice: 159.99,
        images: [
          "https://picsum.photos/300/300?random=24",
          "https://picsum.photos/300/300?random=240",
          "https://picsum.photos/300/300?random=241",
          "https://picsum.photos/300/300?random=242"
        ],
        discount: "-19%",
        category: 'home',
      ),
    ],
    'beauty': [
      Product(
        id: 23,
        name: "Perfume",
        price: 59.99,
        oldPrice: 79.99,
        images: [
          "https://picsum.photos/300/300?random=28",
          "https://picsum.photos/300/300?random=280",
          "https://picsum.photos/300/300?random=281",
          "https://picsum.photos/300/300?random=282"
        ],
        discount: "-25%",
        category: 'beauty',
      ),
    ],
    'auto': [
      Product(
        id: 27,
        name: "Car Oil Filter",
        price: 12.99,
        oldPrice: 16.99,
        images: [
          "https://picsum.photos/300/300?random=32",
          "https://picsum.photos/300/300?random=320",
          "https://picsum.photos/300/300?random=321",
          "https://picsum.photos/300/300?random=322"
        ],
        discount: "-24%",
        category: 'auto',
      ),
    ],
    'sports': [
      Product(
        id: 31,
        name: "Yoga Mat",
        price: 29.99,
        oldPrice: 39.99,
        images: [
          "https://picsum.photos/300/300?random=36",
          "https://picsum.photos/300/300?random=360",
          "https://picsum.photos/300/300?random=361",
          "https://picsum.photos/300/300?random=362"
        ],
        discount: "-25%",
        category: 'sports',
      ),
    ],
  };

  static final Map<String, String> categoryTitles = {
    'kids': 'Kids Clothing',
    'baby': 'Baby Essentials',
    'women': "Women's Fashion",
    'men': "Men's Fashion",
    'accessories': 'Accessories',
    'sale': 'Sale Items',
    'electronics': 'Electronics & Gadgets',
    'home': 'Home & Kitchen',
    'beauty': 'Beauty & Perfumes',
    'auto': 'Auto Parts & Accessories',
    'sports': 'Sports & Fitness'
  };

  static Product? findProductById(int id) {
    for (var categoryProducts in products.values) {
      for (var product in categoryProducts) {
        if (product.id == id) return product;
      }
    }
    return null;
  }

  static List<Product> searchProducts(String query) {
    final results = <Product>[];
    final lowerQuery = query.toLowerCase();

    for (var categoryProducts in products.values) {
      for (var product in categoryProducts) {
        if (product.name.toLowerCase().contains(lowerQuery)) {
          results.add(product);
        }
      }
    }
    return results;
  }
}
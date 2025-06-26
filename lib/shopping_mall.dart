class Product {
  String name;
  int price;

  Product(this.name, this.price);
}

class ShoppingMall {
  List<Product> productList = [
    Product("셔츠", 30000),
    Product("청바지", 40000),
    Product("운동화", 60000),
    Product("모자", 15000),
    Product("넥타이", 10000),
  ];

  Map<String, int> cart = {};

  void showProducts() {
    print("\n[ 판매 중인 상품 목록 ]");
    for (var product in productList) {
      print("- ${product.name} : ${product.price}원");
    }
  }

  void addToCart(String name, int quantity) {
    var product = productList.firstWhere(
      (p) => p.name == name,
      orElse: () => Product("", 0),
    );

    if (product.name == "") {
      print("입력값이 올바르지 않아요 !");
      return;
    }

    if (quantity <= 0) {
      print("0개보다 많은 개수의 상품만 담을 수 있어요 !");
      return;
    }

    cart.update(name, (value) => value + quantity, ifAbsent: () => quantity);
    print("장바구니에 상품이 담겼어요 !");
  }

  void showCartItems() {
    if (cart.isEmpty) {
      print("장바구니에 담긴 상품이 없습니다.");
      return;
    }

    int total = 0;
    List<String> items = [];

    cart.forEach((name, qty) {
      var product = productList.firstWhere((p) => p.name == name);
      items.add(name);
      total += product.price * qty;
    });

    print("장바구니에 ${items.join(", ")}가 담겨있네요. 총 ${total}원 입니다!");
  }

  void showTotalPrice() {
    if (cart.isEmpty) {
      print("장바구니가 비어있습니다.");
      return;
    }

    int total = 0;
    cart.forEach((name, qty) {
      var product = productList.firstWhere((p) => p.name == name);
      total += product.price * qty;
    });

    print("장바구니에 ${total}원 어치를 담으셨네요 !");
  }

  void clearCart() {
    if (cart.isEmpty) {
      print("이미 장바구니가 비어있습니다.");
    } else {
      cart.clear();
      print("장바구니를 초기화합니다.");
    }
  }

  void removeItem(String name) {
    if (cart.containsKey(name)) {
      cart.remove(name);
      print("${name} 상품을 장바구니에서 제거했습니다.");
    } else {
      print("해당 상품은 장바구니에 없습니다.");
    }
  }

  void showItemCount() {
    if (cart.isEmpty) {
      print("장바구니가 비어있습니다.");
      return;
    }

    int count = cart.values.reduce((a, b) => a + b);
    print("장바구니에 총 ${count}개의 상품이 담겨있어요 !");
  }
}

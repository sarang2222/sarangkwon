import 'dart:io';
import '../lib/shopping_mall.dart';

void main() {
  ShoppingMall mall = ShoppingMall();

  while (true) {
    print("\n====== 패션 쇼핑몰 콘솔 ======");
    print("1. 상품 목록 보기");
    print("2. 상품 장바구니에 담기");
    print("3. 장바구니 목록 및 총 가격 보기");
    print("4. 종료하기");
    print("5. 장바구니 초기화");
    print("6. 장바구니 총 가격 보기");
    print("7. 장바구니에서 특정 상품 삭제");
    print("8. 장바구니에 담긴 총 상품 개수 보기");
    stdout.write("번호를 입력하세요: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        mall.showProducts();
        break;
      case "2":
        stdout.write("담을 상품 이름을 입력하세요: ");
        String? name = stdin.readLineSync();
        stdout.write("상품 개수를 입력하세요: ");
        String? qtyStr = stdin.readLineSync();
        int? quantity = int.tryParse(qtyStr ?? "");
        if (name == null || name.isEmpty || quantity == null) {
          print("입력값이 올바르지 않아요 !");
        } else {
          mall.addToCart(name, quantity);
        }
        break;
      case "3":
        mall.showCartItems();
        break;
      case "4":
        stdout.write("정말 종료하시겠습니까? (5 입력 시 종료): ");
        String? confirm = stdin.readLineSync();
        if (confirm == "5") {
          print("이용해 주셔서 감사합니다 ~ 안녕히 가세요 !");
          return;
        } else {
          print("종료하지 않습니다.");
        }
        break;
      case "5":
        mall.clearCart();
        break;
      case "6":
        mall.showTotalPrice();
        break;
      case "7":
        stdout.write("삭제할 상품 이름을 입력하세요: ");
        String? name = stdin.readLineSync();
        if (name == null || name.isEmpty) {
          print("입력값이 올바르지 않아요 !");
        } else {
          mall.removeItem(name);
        }
        break;
      case "8":
        mall.showItemCount();
        break;
      default:
        print("올바른 번호를 입력해주세요.");
    }
  }
}

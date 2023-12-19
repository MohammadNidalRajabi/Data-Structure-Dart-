class Node {
  dynamic data;
  Node? next;

  Node(this.data);
}

class LinkedList {
  Node? head;

  void append(dynamic data) {
    Node newNode = Node(data);
    if (head == null) {
      head = newNode;
    } else {
      Node? current = head;
      while (current!.next != null) {
        current = current.next;
      }
      current.next = newNode;
    }
  }

  void printList() {
    Node? current = head;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }

  void reverse() {
    Node? prev = null;
    Node? current = head;
    Node? next;
    while (current != null) {
      next = current.next;
      current.next = prev;
      prev = current;
      current = next;
    }
    head = prev;
  }

  void removeAllOccurrences(dynamic value) {
    while (head != null && head!.data == value) {
      head = head!.next;
    }

    if (head == null) {
      return;
    }

    Node? current = head;
    while (current != null && current.next != null) {
      if (current.next!.data == value) {
        current.next = current.next!.next;
      } else {
        current = current.next;
      }
    }
  }

  void printListReverse() {
    List<dynamic> data = [];
    Node? current = head;
    while (current != null) {
      data.add(current.data);
      current = current.next;
    }
    data.reversed.forEach((element) {
      print(element);
    });
  }

  void findMiddleNode() {
    int counter = 0;
    int target = (counter / 2).ceil();
    Node? node = head;
    while (node != null && target >= 0) {
      target--;
      node = node.next;
    }
    print(node?.data);
  }
}

class Stack<T> {
  List<T> _items = [];

  void push(T item) {
    _items.add(item);
  }

  T pop() {
    if (_items.isNotEmpty) {
      return _items.removeLast();
    } else {
      throw StateError('Cannot pop an empty stack.');
    }
  }

  void printStak() {
    _items.forEach((element) {
      print(element);
    });
  }

  void printStakReverse() {
    _items.reversed.forEach((element) {
      print(element);
    });
  }

  bool get isEmpty => _items.isEmpty;

  int get length => _items.length;
}

bool checkParentheses(String input) {
  Stack<String> stack = Stack<String>();

  for (var char in input.runes) {
    String currentChar = String.fromCharCode(char);

    if (currentChar == '(') {
      stack.push(currentChar);
    } else if (currentChar == ')') {
      if (stack.isEmpty || stack.pop() != '(') {
        return false;
      }
    }
  }
  return stack.isEmpty;
}

void main() {
  Stack<int> stack = Stack<int>();
  stack.push(1);
  stack.push(2);
  stack.push(3);
  stack.push(4);
  stack.printStak();
  // Challenge 1: Reverse a List
  stack.printStakReverse();
  // Challenge 2: Balance the Parentheses
  print(checkParentheses("(N + R)"));

  LinkedList myList = LinkedList();

  myList.append(1);
  myList.append(2);
  myList.append(3);
  myList.append(4);
  myList.printList();
  // Challenge 1: Print in Reverse
  myList.printListReverse();
  // Challenge 2: Find the Middle Node
  myList.findMiddleNode();
  // Challenge 3: Reverse a Linked List
  myList.reverse();
  myList.printList();
  // Challenge 4: Remove All Occurrences
  myList.removeAllOccurrences(4);
  myList.printList();
}

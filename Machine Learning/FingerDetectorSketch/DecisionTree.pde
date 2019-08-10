class DecisionTree{
  Node head;
  int index;
  
  DecisionTree(ArrayList<Float> data, int depth){
    head = createNode(depth);
    
    index=0;
    inOrder(head, data);
  }
  
  Node createNode(int depth){
    if(depth == -1)
      return null;
    
    Node node = new Node();
    
    node.right = createNode(depth-1);
    node.left = createNode(depth-1);
    
    return node;
  }
  
  void inOrder(Node node, ArrayList<Float> data){
    if(node == null) return;
    
    inOrder(node.left, data);
    node.x = data.get(index).intValue();
    node.y = data.get(index+1).intValue();
    node.purity = data.get(index+2);
    node.el = data.get(index+3);
    node.er = data.get(index+4);
    index+=5;
    inOrder(node.right, data);
  }
  
  Boolean decide(Box b){
    return decide(b,head);
  }
  
  Boolean decide(Box b, Node n){
    if(n.left == null){
      if(n.check(b)){
        return n.er > 0.5;
      } else {
        return n.el > 0.5;
      }
    }
    
    if(n.check(b))
      return decide(b,n.right);
    else
      return decide(b,n.left);
  }
}

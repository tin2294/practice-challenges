# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end
# @param {TreeNode} root
# @return {TreeNode}

root = TreeNode.new(1, nil, TreeNode.new(0, TreeNode.new(0,nil,nil), TreeNode.new(1, nil, nil)))

def mini_tree_pruning(tree)
  # unless tree == nil
  #   # make left and right blocks
  #   if (tree.left == 0 || tree.left == nil) && (tree.right == 0 || tree.right == nil) && tree.val == 0
  #     tree = nil
  #   elsif (tree.left == 0 || tree.left == nil) && (tree.right == 0 || tree.right == nil) && tree.val == 1
  #     tree.val = 1
  #   elsif (tree.left == 0 || tree.left == nil) && (tree.right == 0 || tree.right == nil)
  #    tree = nil
  #   elsif tree.left == 0
  #     tree.left = nil
  #   elsif tree.right == 0
  #     tree.right = nil
  #   elsif tree.left.class == TreeNode
  #     tree.left = mini_tree_pruning(tree.left)
  #   elsif tree.right.class == TreeNode
  #     tree.right = mini_tree_pruning(tree.right)
  #   end
  # end
  # return tree
end

def prune_tree(root)
    return nil if root==nil
    root.left=prune_tree(root.left) #keeps pruning left until it returns nil
    root.right=prune_tree(root.right)
    return nil if root.val==0 and root.left==nil and root.right==nil
    return root
  # final_tree = TreeNode.new(root.val)
  # left = mini_tree_pruning(root.left)
  # right = mini_tree_pruning(root.right)
  # final_tree.left = left
  # final_tree.right = right
  # return final_tree
end

p prune_tree(root)

# if tree.left.val == 0
#   tree.left = nil
# elsif tree.right.val == 0
#   tree.left = nil
# elsif tree.left.class == TreeNode
#   tree.left = mini_tree_pruning(tree.left)
# elsif tree.right.class == TreeNode
#   tree.right = mini_tree_pruning(tree.right)
# elsif tree.left == nil
#   tree.left = nil
# elsif tree.right == nil
#   tree.right = nil
# end

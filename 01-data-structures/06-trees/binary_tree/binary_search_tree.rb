require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

#Uses depth first search to insert the data.
  def insert(root, node)
    if root.rating > node.rating
      root.left.nil? ? (root.left = node) : insert(root.left, node)
    else
      root.right.nil? ? (root.right = node) : insert(root.right, node)
    end
  end

# Recursive Depth First Search
  def find(root, data)
    if root.nil? || data.nil?
      return nil
    else
      if root.title == data
        return root
      elsif root.left != nil
        find(root.left, data)
      elsif root.right != nil
        find(root.right, data)
      end
    end
  end

  def delete(root, data)
    if root.nil? || data.nil?
      return nil
    else
      target_node = find(root, data)
      target_node.nil? ? nil : (target_node.title = nil && target_node = nil)
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    queue = [@root]
    result = []
    while queue.length > 0
      new_root = queue.shift
      if new_root.left != nil
        queue.push(new_root.left)
      end
      if new_root.right != nil
        queue.push(new_root.right)
      end
      result.push("#{new_root.title}: #{new_root.rating}")
    end
    result.each {|x| puts x}
  end
end

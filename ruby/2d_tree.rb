class Tree
  attr_accessor :childrens, :node_name

  def initialize(node_name,childrens = [])
    @node_name = node_name
    @childrens = childrens
  end

  def visit_all(&block)
    visit &block
    childrens.each { |c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

ruby_tree = Tree.new('Ruby',[
  Tree.new('Raia'),
  Tree.new('MacRuby')
])

puts 'Visiting a node'
ruby_tree.visit { |node| puts node.node_name }
puts

puts 'Visiting entire tree'
ruby_tree.visit_all { |node| puts node.node_name }

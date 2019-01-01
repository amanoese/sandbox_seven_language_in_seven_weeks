class Tree
  attr_accessor :childrens, :node_name

  def initialize(nodes = {})
    @node_name = nodes.keys[0]
    @childrens = []
    nodes.values[0].each { |key,value| childrens.push(Tree.new({ key => value })) }
  end

  def visit_all(&block)
    visit &block
    childrens.each { |c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

ruby_tree = Tree.new({
  'grandpa' => {
    'dad' => {
      'child 1' => [],
      'child 2' => []
    },
    'uncle' => {
      'child 3' => [],
      'child 4' => []
    }
  }
})

puts 'Visiting a node'
ruby_tree.visit { |node| puts node.node_name }
puts

puts 'Visiting entire tree'
ruby_tree.visit_all { |node| puts node.node_name }

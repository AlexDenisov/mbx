require 'sxp'

ast = SXP.read File.read "swift.ast"

def properties class_def
  class_def.map do |node|
    node[1] if node[0] == :var_decl
  end.compact
end

ast.each do |node|
  next unless node[0] == :class_decl
  puts "class: #{node[1]}"
  properties(node).each do |p|
    puts " -> #{p}"
  end
end


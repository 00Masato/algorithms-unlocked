def topological_sort(g_graph)
  linear_order = []
  in_degree = Hash.new(0)
  g_graph.each_value do |v|
    v.each {|x| in_degree[x] += 1}
  end
  g_next = g_graph.keys.select { |x| in_degree[x] == 0 }
  until g_next.size.zero? do
    g_graph_u = g_next.shift
    linear_order.push(g_graph_u)
    g_graph[g_graph_u].each do |v|
      in_degree[v] -= 1
      g_next.push(v) if in_degree[v] == 0
    end
  end
  linear_order
end

g = {1=>[3], 2=>[4], 3=>[4, 5], 4=>[6], 5=>[6], 6=>[7, 11],
  7=>[8], 8=>[13], 9=>[10], 10=>[11], 11=>[12], 12=>[13],
  13=>[14], 14=>[]}
p topological_sort(g)

def topological_sort(g_graph, n)
  linear_order = []
  in_degree = Array.new(n, 0)
  graph_keys = g_graph.keys
  graph_keys.each do |u|
    g_graph[u].each do |v|
      next if in_degree[v-1].nil?
      in_degree[v-1] += 1
    end
  end
  g_next = graph_keys.select { |x| in_degree[x-1] == 0 }
  until g_next.empty? do
    g_graph_u = g_next.shift
    linear_order.push(g_graph_u)
    g_graph[g_graph_u].each do |v|
      next if in_degree[v-1].nil?
      in_degree[v-1] -= 1
      g_next.push(v) if in_degree[v-1] == 0
    end
  end
  linear_order
end

g = {1=>[3], 2=>[4], 3=>[4, 5], 4=>[6], 5=>[6], 6=>[7, 11],
  7=>[8], 8=>[13], 9=>[10], 10=>[11], 11=>[12], 12=>[13],
  13=>[14], 14=>[]}
p topological_sort(g, 14)
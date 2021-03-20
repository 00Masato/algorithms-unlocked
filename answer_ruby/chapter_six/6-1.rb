
def dijkstra(graph, start)
  h = graph.map {|x| [x[0], x[1].keys]}.to_h
  
  shortest = Hash.new(Float::INFINITY)    #デフォルトは充分大きな数
  pred = {}
  done = h.keys.map {|node| [node, false]}.to_h
  
  shortest[start] = 0
  
  loop do
    #確定していない中でスタート地点から最短のノードを探す（u）
    u = nil
    h.each_key.reject {|node| done[node]}.each do |node|
      u = node if !u or shortest[node] < shortest[u]
    end
    break unless u
    done[u] = true    #探されたuは確定
    
    #ノードuから行けるノードvまで、スタート地点からuを経由した方が短ければshortest[v]を更新する
    h[u].each do |v|
      if (a = shortest[u] + graph[u][v]) < shortest[v]
        shortest[v] = a
        pred[v] = u
      end
    end
  end
  
  [shortest, pred]
end

graph = {s: {t: 6, y: 4}, t: {x: 3, y: 2},
           x: {z: 4}, y: {z: 3, t: 1, x: 9}, z: {s: 7, x: 5}}

p dijkstra(graph, :s)
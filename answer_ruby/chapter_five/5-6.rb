require './5-2'

class Hash
  def dag_shortest_paths(s)
    #%dis = Rational or Integer or Float, %node = Object
    #Hash{self[%node]: (Hash[%node]: %dis)}, %node{s} ->
    #Hash{h[%node]: Array[%node], @shortest[%node]: %dis, @pred[%node]: %node}
    #%node{l[]}
    
    h = map {|x| [x[0], x[1].keys]}.to_h
    l = topological_sort(h)
    
    @shortest = h.keys.map {|k| [k, Float::INFINITY]}.to_h
    @pred = {}
    
    @shortest[s] = 0
    
    l.each do |u|
      h[u].each {|v| relax(u, v)}
    end
    
    [@shortest, @pred]
  end
  
  def relax(u, v)
    #%node{u, v} --> %dis{a}
    if (a = @shortest[u] + self[u][v]) < @shortest[v]
      @shortest[v] = a
      @pred[v] = u
    end
  end
  private :relax
end


if __FILE__ == $0
  g = {s: {t: 2, x: 6}, t: {x: 7, y: 4},
       x: {y: -1, z: 1}, y: {z: -2}, z: {}}
  p g.dag_shortest_paths(:s)
end
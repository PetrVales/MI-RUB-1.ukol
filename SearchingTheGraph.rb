class Graph 
	def initialize()
		@vertices = Hash.new
	end

	def size
		@vertices.size
	end

	def addVertex(label)
		@vertices[label] = Vertex.new(label)
	end

	def vertex(label)
		@vertices[label]
	end

	def connectVerticesWithEdge(from, to)
		vertex(from).addConnectionsTo(vertex(to))
	end

	def to_s() 
		@vertices.to_s
	end

	def dfsFrom(vertex) 
		dfs = ""
		visited = []
		stack = []
		stack.push(vertex(vertex))
		while (!stack.empty?)
			v = stack.pop
			if (visited.index(v) == nil)
				visited.push(v)
				dfs = dfs + " " + v.label.to_s
				conn = v.connections().sort {|x,y| y.label.to_i <=> x.label.to_i }
				conn.each {|x| 
					if (visited.index(x) == nil)
						stack.push(x) 
					end
				}
			end
		end
		dfs.strip 
	end

	def bfsFrom(vertex) 
		bfs = ""
		visited = []
		stack = []
		stack.push(vertex(vertex))
		while (!stack.empty?)
			v = stack.first
			stack = stack.last(stack.size - 1)
			visited.push(v)
			bfs = bfs + " " + v.label.to_s
			conn = v.connections().sort {|x,y| x.label.to_i <=> y.label.to_i }
			conn.each {|x| 
				if ((visited.index(x) == nil) && (stack.index(x) == nil))
					stack.push(x) 
				end
			}
		end
		bfs.strip 
	end
end

class Vertex 
	def initialize(label)
		@label = label
		@connections = []
	end

	def addConnectionsTo(vertex) 
		@connections.push(vertex)
	end

	def connections() 
		@connections
	end

	def label()
		@label
	end

	def to_s()
		"Vertex: " + @label.to_s
	end
end

class TdbfsSolver

	def solve()
		for counter in 1..gets.to_i
			size = gets.to_i	
			graph = Graph.new 
			for i in 1..size
				graph.addVertex(i)
			end
			# puts graph.to_s #
			for i in 1..size
				line = gets
				# puts line #
				lineAsArray = line.split(' ')
				for j in 2..(lineAsArray[1].to_i + 1)
					graph.connectVerticesWithEdge(i, lineAsArray[j].to_i)
				end
			end
			taskLine = gets
			puts "graph " + counter.to_s
			while ((taskLine <=> "0 0\n") != 0) 
				taskAsArray = taskLine.split(' ')
				if (taskAsArray[1] == "0")
					# puts "From " + taskAsArray[0].to_i.to_s
					puts graph.dfsFrom(taskAsArray[0].to_i)
				else
					# puts "From " + taskAsArray[0].to_i.to_s
					puts graph.bfsFrom(taskAsArray[0].to_i)
				end
				taskLine = gets
			end
		end
	end
end

TdbfsSolver.new.solve

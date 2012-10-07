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
		dfs = DepthFirstSearcher.new(vertex(vertex))
		dfs.search
	end

	def bfsFrom(vertex) 
		bfs = BepthFirstSearcher.new(vertex(vertex))
		bfs.search
	end

	class BepthFirstSearcher
		def initialize(beginNode)
			@stack = []
			@stack.push(beginNode)
			@result = ""
			@visited = []
		end

		def search()
			if (@result.empty?)
				searchGraph()
			end
			@result.strip
		end

		def searchGraph()
			while (hasNext?)
				node = getNext
				@result = @result + " " + node.label.to_s
				addFollowing(node)
			end
		end

		def hasNext?()
			!@stack.empty?
		end

		def getNext()
			nextNode = @stack.first
			@stack = @stack.last(@stack.size - 1)
			@visited.push(nextNode)
			nextNode
		end

		def addFollowing(node)
			connections = node.connections().sort {|x,y| x.label.to_i <=> y.label.to_i }
			connections.each {|x| 
				if ((@visited.index(x) == nil) && (@stack.index(x) == nil))
					@stack.push(x) 
				end
			}
		end
	end

	class DepthFirstSearcher
		def initialize(beginNode)
			@stack = []
			@stack.push(beginNode)
			@result = ""
			@visited = []
		end

		def search()
			if (@result.empty?)
				searchGraph()
			end
			@result.strip
		end

		def searchGraph()
			while (hasNext?)
				node = getNext
				@result = @result + " " + node.label.to_s
				addFollowing(node)
			end
		end

		def hasNext?()
			result = false
			while (!@stack.empty?)
				node = @stack.pop
				if (@visited.index(node) == nil)
					@stack.push(node)
					result = true
					break
				end
			end
			result
		end

		def getNext()
			nextNode = @stack.pop
			@visited.push(nextNode)
			nextNode
		end

		def addFollowing(node)
			connections = node.connections().sort {|x,y| y.label.to_i <=> x.label.to_i }
			connections.each {|x| 
				if (@visited.index(x) == nil)
					@stack.push(x) 
				end
			}
		end
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

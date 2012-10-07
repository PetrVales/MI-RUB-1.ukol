require './SearchingTheGraph.rb'

describe Graph do
  it "initialize empty graph" do
    graph = Graph.new
    graph.size.should eq(0)
  end

  it "increase its size when vertex is added" do
    graph = Graph.new
    graph.addVertex("1")
    graph.addVertex("2")
    graph.size.should eq(2)
  end

  it "returns its vertex" do
    graph = Graph.new
    graph.addVertex("1")
    graph.addVertex("2")
    graph.vertex("1").should be_true
    graph.vertex("2").should be_true
  end

  it "allows connect vertices with edge" do 
  	graph = Graph.new
    graph.addVertex("1")
    graph.addVertex("2")
    graph.connectVerticesWithEdge("1", "2")
	graph.vertex("1").connections.should include(graph.vertex("2"))
  end

  it "Depth First Search of single vertex is only its label" do 
  	graph = Graph.new
    graph.addVertex("1")
	graph.dfsFrom("1").should eq("1")
  end 	

  it "\nDepth First Search of  1\n" +
      "                       /\\\n" +
      "                      2  5\n" +
      "                     /\\  /\\\n" + 
      "                    3  4 6 7\n" +
      "is 1 2 3 4 5 6 7" do 
  	graph = Graph.new
    graph.addVertex("1")
    graph.addVertex("2")
    graph.addVertex("3")
    graph.addVertex("4")
    graph.addVertex("5")
    graph.addVertex("6")
    graph.addVertex("7")
    graph.connectVerticesWithEdge("1", "2")
    graph.connectVerticesWithEdge("1", "5")
    graph.connectVerticesWithEdge("2", "3")
    graph.connectVerticesWithEdge("2", "4")
    graph.connectVerticesWithEdge("5", "6")
    graph.connectVerticesWithEdge("5", "7")
	graph.dfsFrom("1").should eq("1 2 3 4 5 6 7")
  end

  it "Depth First Search of cycle graph 1 2 3" do 
  	graph = Graph.new
    graph.addVertex("1")
    graph.addVertex("2")
    graph.addVertex("3")
    graph.connectVerticesWithEdge("1", "2")
    graph.connectVerticesWithEdge("2", "3")
    graph.connectVerticesWithEdge("3", "1")
	graph.dfsFrom("1").should eq("1 2 3")
  end 

  it "Breadth First Search of single vertex is only its label" do 
  	graph = Graph.new
    graph.addVertex("1")
	graph.bfsFrom("1").should eq("1")
  end

  it "\nBepth First Search of  1\n" +
      "                       /\\\n" +
      "                      2  5\n" +
      "                     /\\  /\\\n" + 
      "                    3  4 6 7\n" +
      "is 1 2 5 3 4 6 7" do 
  	graph = Graph.new
    graph.addVertex("1")
    graph.addVertex("2")
    graph.addVertex("3")
    graph.addVertex("4")
    graph.addVertex("5")
    graph.addVertex("6")
    graph.addVertex("7")
    graph.connectVerticesWithEdge("1", "2")
    graph.connectVerticesWithEdge("1", "5")
    graph.connectVerticesWithEdge("2", "3")
    graph.connectVerticesWithEdge("2", "4")
    graph.connectVerticesWithEdge("5", "6")
    graph.connectVerticesWithEdge("5", "7")
	graph.bfsFrom("1").should eq("1 2 5 3 4 6 7")
  end

  it "Bepth First Search of cycle graph 1 2 3" do 
  	graph = Graph.new
    graph.addVertex("1")
    graph.addVertex("2")
    graph.addVertex("3")
    graph.connectVerticesWithEdge("1", "2")
    graph.connectVerticesWithEdge("2", "3")
    graph.connectVerticesWithEdge("3", "1")
	graph.bfsFrom("1").should eq("1 2 3")
  end

  it "First task" do 
  	graph = Graph.new
    graph.addVertex("1")
    graph.addVertex("2")
    graph.addVertex("3")
    graph.addVertex("4")
    graph.addVertex("5")
    graph.addVertex("6")
    graph.connectVerticesWithEdge("1", "3")
    graph.connectVerticesWithEdge("1", "4")
    graph.connectVerticesWithEdge("2", "3")
    graph.connectVerticesWithEdge("2", "6")
    graph.connectVerticesWithEdge("3", "1")
    graph.connectVerticesWithEdge("3", "2")
    graph.connectVerticesWithEdge("4", "1")
    graph.connectVerticesWithEdge("6", "2")
	graph.bfsFrom("5").should eq("5")
	graph.dfsFrom("1").should eq("1 3 2 6 4")
  end

  it "Second task" do 
  	graph = Graph.new
    graph.addVertex("1")
    graph.addVertex("2")
    graph.addVertex("3")
    graph.addVertex("4")
    graph.addVertex("5")
    graph.addVertex("6")
    graph.addVertex("7")
    graph.addVertex("8")
    graph.addVertex("9")
    graph.addVertex("10")
    graph.connectVerticesWithEdge("1", "3")
    graph.connectVerticesWithEdge("1", "5")
    graph.connectVerticesWithEdge("1", "6")
    graph.connectVerticesWithEdge("1", "7")
    graph.connectVerticesWithEdge("1", "8")
    graph.connectVerticesWithEdge("1", "9")
    graph.connectVerticesWithEdge("2", "9")
    graph.connectVerticesWithEdge("3", "1")
    graph.connectVerticesWithEdge("3", "5")
    graph.connectVerticesWithEdge("4", "6")
    graph.connectVerticesWithEdge("4", "7")
    graph.connectVerticesWithEdge("4", "8")
    graph.connectVerticesWithEdge("4", "9")
    graph.connectVerticesWithEdge("4", "10")
    graph.connectVerticesWithEdge("5", "1")
    graph.connectVerticesWithEdge("5", "3")
    graph.connectVerticesWithEdge("5", "7")
    graph.connectVerticesWithEdge("5", "8")
    graph.connectVerticesWithEdge("6", "1")
    graph.connectVerticesWithEdge("6", "4")
    graph.connectVerticesWithEdge("6", "7")
    graph.connectVerticesWithEdge("7", "1")
    graph.connectVerticesWithEdge("7", "4")
    graph.connectVerticesWithEdge("7", "5")
    graph.connectVerticesWithEdge("7", "6")
    graph.connectVerticesWithEdge("7", "8")
    graph.connectVerticesWithEdge("8", "1")
    graph.connectVerticesWithEdge("8", "4")
    graph.connectVerticesWithEdge("8", "5")
    graph.connectVerticesWithEdge("8", "7")
    graph.connectVerticesWithEdge("8", "10")
    graph.connectVerticesWithEdge("9", "1")
    graph.connectVerticesWithEdge("9", "2")
    graph.connectVerticesWithEdge("9", "4")
    graph.connectVerticesWithEdge("10", "4")
    graph.connectVerticesWithEdge("10", "8")
  	graph.bfsFrom("7").should eq("7 1 4 5 6 8 3 9 10 2")
  	graph.dfsFrom("1").should eq("1 3 5 7 4 6 8 10 9 2")
  	graph.bfsFrom("2").should eq("2 9 1 4 3 5 6 7 8 10")
  	graph.bfsFrom("4").should eq("4 6 7 8 9 10 1 5 2 3")
  	graph.bfsFrom("7").should eq("7 1 4 5 6 8 3 9 10 2")
  end

end

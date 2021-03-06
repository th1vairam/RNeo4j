getLabel = function(object) UseMethod("getLabel")

getLabel.default = function(x) {
  stop("Invalid object. Must supply a graph or node object.")
}

getLabel.graph = function(graph) {
  url = attr(graph, "node_labels")
  headers = setHeaders(graph)
  response = http_request(url, "GET", "OK", httpheader=headers)
  result = fromJSON(response)
  if(length(result) == 0) {
    message("No labels in the graph.")
    return(invisible(NULL))
  }
  return(result)
}

getLabel.node = function(node) {
  url = attr(node, "labels")
  headers = setHeaders(node)
  response = http_request(url, "GET", "OK", httpheader=headers)
  result = fromJSON(response)
  if(length(result) == 0) {
    message("No labels on the node.")
    return(invisible(NULL))
  }
  return(result)
}

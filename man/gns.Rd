% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GlobalSparse.R
\name{gns}
\alias{gns}
\title{Global Network Sparsification}
\usage{
gns(network, remove.prop, cutoff, directed = FALSE)
}
\arguments{
\item{network}{Weighted adjacency matrix, weighted \code{igraph} network, or edge list formatted | n1 | n2 | weight | with colnames \code{c("n1", "n2", "weight")}.}

\item{remove.prop}{The proportion of highest weighted edges to retain. A value between 0 and 1.}

\item{cutoff}{Threshold value for edge weight thresholding.}

\item{directed}{If \code{TRUE}, specifies that the inputted network is directed. Default is \code{FALSE}.}
}
\value{
Edge list of sparsified network
}
\description{
Remove all edges under certain edge weight threshold.
}
\examples{
#Generate random ER graph with uniformly random edge weights
g = igraph::erdos.renyi.game(100, 0.1)
igraph::E(g)$weight <- runif(length(igraph::E(g)))
#Sparsify g via GNS
S = gns(g, remove.prop = 0.5)
sg = simplifyNet::net.as(S, net.to="igraph", directed=FALSE)
igraph::ecount(sg)/igraph::ecount(g)#fraction of edges in the sparsifier
}
\author{
Andrew Kramer

Alexander Mercier
}

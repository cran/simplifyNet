% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/EffRSparse.R
\name{EffRSparse}
\alias{EffRSparse}
\title{Sparsification through edge sampling via effective resistances}
\usage{
EffRSparse(network, q, effR, seed, n)
}
\arguments{
\item{network}{Weighted adjacency matrix, weighted \code{igraph} network, or edge list formatted | n1 | n2 | weight | with colnames \code{c("n1", "n2", "weight")}.}

\item{q}{The numbers of samples taken. The fidelity to the original network increases as the number of samples increases, but decreases the sparseness.}

\item{effR}{Effective resistances corresponding to each edge. Should be in the same order as "weight".}

\item{seed}{Set the seed to reproduce results of random sampling.}

\item{n}{The number of nodes in the network. Default is the max node index of the edge list.}
}
\value{
A sparsified network, \code{H}, edge list where the number of edges is dependent on the number of samples taken, \code{q}.
}
\description{
Sparsify an undirected network by sampling edges proportional to \eqn{w_e * R_e} where \eqn{w_e} is the weight of edge \eqn{e} and \eqn{R_e} is the effective resistance of edge \eqn{e}.\cr
Approximately preserves the graph Laplacian, \code{L}, with increasing fidelity as the number of samples taken increases.
}
\details{
The performance of this method is dependent on the size of the network and fidelity of the effective resistance approximation. The network should be "sufficiently large." \cr
For more details, see: https://epubs.siam.org/doi/epdf/10.1137/080734029
}
\examples{
#Generate random ER graph with uniformly random edge weights
g = igraph::erdos.renyi.game(100, 0.1)
igraph::E(g)$weight <- runif(length(igraph::E(g)))
#Approximate effective resistances
effR = simplifyNet::EffR(g)
#Use effective resistances to create spectral sparsifier by edge sampling
S = simplifyNet::EffRSparse(g, q = 200, effR = effR, seed = 150)
sg = simplifyNet::net.as(S, net.to="igraph", directed=FALSE)
igraph::ecount(sg)/igraph::ecount(g)#fraction of edges in the sparsifier
}
\references{
Spielman, D. A., & Srivastava, N. (2011). Graph sparsification by effective resistances. SIAM Journal on Computing, 40(6), 1913-1926.
}
\author{
Daniel A. Spielman,

Alexander Mercier
}

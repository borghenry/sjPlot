% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sjPlotClusterAnalysis.R
\name{sjc.qclus}
\alias{sjc.qclus}
\title{Compute quick cluster analysis}
\usage{
sjc.qclus(data, groupcount = NULL, groups = NULL, method = c("kmeans",
  "hclust"), distance = c("euclidean", "maximum", "manhattan", "canberra",
  "binary", "minkowski"), agglomeration = c("ward", "ward.D", "ward.D2",
  "single", "complete", "average", "mcquitty", "median", "centroid"),
  iter.max = 20, algorithm = c("Hartigan-Wong", "Lloyd", "MacQueen"),
  show.accuracy = FALSE, title = NULL, axis.labels = NULL,
  wrap.title = 40, wrap.labels = 20, wrap.legend.title = 20,
  wrap.legend.labels = 20, facet.grid = FALSE, geom.colors = "Paired",
  geom.size = 0.5, geom.spacing = 0.1, show.legend = TRUE,
  show.grpcnt = TRUE, legend.title = NULL, legend.labels = NULL,
  coord.flip = FALSE, reverse.axis = FALSE, prnt.plot = TRUE)
}
\arguments{
\item{data}{A data frame with variables that should be used for the
cluster analysis.}

\item{groupcount}{Amount of groups (clusters) used for the cluster solution. May also be
a set of initial (distinct) cluster centres, in case \code{method = "kmeans"}
(see \code{\link{kmeans}} for details on \code{centers} argument).
If \code{groupcount = NULL} and \code{method = "kmeans"}, the optimal
amount of clusters is calculated using the gap statistics (see
\code{\link{sjc.kgap}}). For \code{method = "hclust"}, \code{groupcount}
needs to be specified. Following functions may be helpful for estimating
the amount of clusters:
\itemize{
  \item Use \code{\link{sjc.elbow}} to determine the group-count depending on the elbow-criterion.
  \item If \code{method = "kmeans"}, use \code{\link{sjc.kgap}} to determine the group-count according to the gap-statistic.
  \item If \code{method = "hclust"} (hierarchical clustering, default), use \code{\link{sjc.dend}} to inspect different cluster group solutions.
  \item Use \code{\link{sjc.grpdisc}} to inspect the goodness of grouping (accuracy of classification).
  }}

\item{groups}{Optional, by default, this argument is \code{NULL} and will be
ignored. However, to plot existing cluster groups, specify \code{groupcount}
and \code{groups}. \code{groups} is a vector of same length as
\code{nrow(data)} and indicates the group classification of the cluster
analysis. The group classification can be computed with the
\code{\link{sjc.cluster}} function. See 'Examples'.}

\item{method}{Method for computing the cluster analysis. By default (\code{"kmeans"}), a
kmeans cluster analysis will be computed. Use \code{"hclust"} to
compute a hierarchical cluster analysis. You can specify the
initial letters only.}

\item{distance}{Distance measure to be used when \code{method = "hclust"} (for hierarchical
clustering). Must be one of \code{"euclidean"}, \code{"maximum"}, \code{"manhattan"},
\code{"canberra"}, \code{"binary"} or \code{"minkowski"}. See \code{\link{dist}}.
If is \code{method = "kmeans"} this argument will be ignored.}

\item{agglomeration}{Agglomeration method to be used when \code{method = "hclust"} (for hierarchical
clustering). This should be one of \code{"ward"}, \code{"single"}, \code{"complete"}, \code{"average"},
\code{"mcquitty"}, \code{"median"} or \code{"centroid"}. Default is \code{"ward"} (see \code{\link{hclust}}).
If \code{method = "kmeans"} this argument will be ignored. See 'Note'.}

\item{iter.max}{Maximum number of iterations allowed. Only applies, if
\code{method = "kmeans"}. See \code{\link{kmeans}} for details on this argument.}

\item{algorithm}{Algorithm used for calculating kmeans cluster. Only applies, if
\code{method = "kmeans"}. May be one of \code{"Hartigan-Wong"} (default),
\code{"Lloyd"} (used by SPSS), or \code{"MacQueen"}. See \code{\link{kmeans}}
for details on this argument.}

\item{show.accuracy}{Logical, if \code{TRUE}, the \code{\link{sjc.grpdisc}} function will be called,
which computes a linear discriminant analysis on the classified cluster groups and plots a
bar graph indicating the goodness of classification for each group.}

\item{title}{character vector, used as plot title. Depending on plot type and function,
will be set automatically. If \code{title = ""}, no title is printed.
For effect-plots, may also be a character vector of length > 1,
to define titles for each sub-plot or facet.}

\item{axis.labels}{character vector with labels used as axis labels. Optional
argument, since in most cases, axis labels are set automatically.}

\item{wrap.title}{numeric, determines how many chars of the plot title are displayed in
one line and when a line break is inserted.}

\item{wrap.labels}{numeric, determines how many chars of the value, variable or axis
labels are displayed in one line and when a line break is inserted.}

\item{wrap.legend.title}{numeric, determines how many chars of the legend's title
are displayed in one line and when a line break is inserted.}

\item{wrap.legend.labels}{numeric, determines how many chars of the legend labels are
displayed in one line and when a line break is inserted.}

\item{facet.grid}{\code{TRUE} to arrange the lay out of of multiple plots
in a grid of an integrated single plot. This argument calls
\code{\link[ggplot2]{facet_wrap}} or \code{\link[ggplot2]{facet_grid}}
to arrange plots. Use \code{\link{plot_grid}} to plot multiple plot-objects
as an arranged grid with \code{\link[gridExtra]{grid.arrange}}.}

\item{geom.colors}{user defined color for geoms. See 'Details' in \code{\link{sjp.grpfrq}}.}

\item{geom.size}{size resp. width of the geoms (bar width, line thickness or point size,
depending on plot type and function). Note that bar and bin widths mostly
need smaller values than dot sizes.}

\item{geom.spacing}{the spacing between geoms (i.e. bar spacing)}

\item{show.legend}{logical, if \code{TRUE}, and depending on plot type and
function, a legend is added to the plot.}

\item{show.grpcnt}{Logical, if \code{TRUE} (default), the count within each cluster group is added to the
legend labels (e.g. \code{"Group 1 (n=87)"}).}

\item{legend.title}{character vector, used as title for the plot legend.}

\item{legend.labels}{character vector with labels for the guide/legend.}

\item{coord.flip}{logical, if \code{TRUE}, the x and y axis are swapped.}

\item{reverse.axis}{Logical, if \code{TRUE}, the values on the x-axis are reversed.}

\item{prnt.plot}{logical, if \code{TRUE} (default), plots the results as graph. Use \code{FALSE} if you don't
want to plot any graphs. In either case, the ggplot-object will be returned as value.}
}
\value{
(Invisibly) returns an object with
          \itemize{
           \item \code{data}: the used data frame for plotting,
           \item \code{plot}: the ggplot object,
           \item \code{groupcount}: the number of found cluster (as calculated by \code{\link{sjc.kgap}})
           \item \code{classification}: the group classification (as calculated by \code{\link{sjc.cluster}}), including missing values, so this vector can be appended to the original data frame.
           \item \code{accuracy}: the accuracy of group classification (as calculated by \code{\link{sjc.grpdisc}}).
          }
}
\description{
Compute a quick kmeans or hierarchical cluster analysis and displays "cluster characteristics"
               as plot.
}
\details{
Following steps are computed in this function:
         \enumerate{
           \item If \code{method = "kmeans"}, this function first determines the optimal group count via gap statistics (unless argument \code{groupcount} is specified), using the \code{\link{sjc.kgap}} function.
           \item A cluster analysis is performed by running the \code{\link{sjc.cluster}} function to determine the cluster groups.
           \item Then, all variables in \code{data} are scaled and centered. The mean value of these z-scores within each cluster group is calculated to see how certain characteristics (variables) in a cluster group differ in relation to other cluster groups.
           \item These results are plotted as graph.
         }
         This method can also be used to plot existing cluster solution as graph witouth computing
         a new cluster analysis. See argument \code{groups} for more details.
}
\note{
See 'Note' in \code{\link{sjc.cluster}}
}
\examples{
\dontrun{
# k-means clustering of mtcars-dataset
sjc.qclus(mtcars)

# k-means clustering of mtcars-dataset with 4 pre-defined
# groups in a faceted panel
sjc.qclus(airquality, groupcount = 4, facet.grid = TRUE)}

# k-means clustering of airquality data
# and saving the results. most likely, 3 cluster
# groups have been found (see below).
airgrp <- sjc.qclus(airquality)

# "re-plot" cluster groups, without computing
# new k-means cluster analysis.
sjc.qclus(airquality, groupcount = 3, groups = airgrp$classification)

}
\references{
Maechler M, Rousseeuw P, Struyf A, Hubert M, Hornik K (2014) cluster: Cluster Analysis Basics and Extensions. R package.
}

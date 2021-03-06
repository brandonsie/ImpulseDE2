% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/srcImpulseDE2_plotHeatmap.R
\name{plotHeatmap}
\alias{plotHeatmap}
\title{Plot structured z-value heatmaps of differentially expressed genes}
\usage{
plotHeatmap(objectImpulseDE2, strCondition, boolIdentifyTransients,
  scaQThres = 0.01)
}
\arguments{
\item{objectImpulseDE2}{(instance of class ImpulseDE2Object)
ImpulseDE2 output object to create heatmap from.}

\item{strCondition}{(str) {'case','control','combined}
Heatmap is created from samples of this condition.}

\item{boolIdentifyTransients}{(bool) 
Whether to structure heatmap into transient and transition
trajectories, only possible if sigmoids were fit to the
indicated condition.}

\item{scaQThres}{(scalar) FDR-corrected p-value threshold
for calling differentially expressed genes: Only genes
below this threshold are included in the heatmap.}
}
\value{
(list length 3)
\itemize{
\item complexHeatmapRaw (complexHeatmap plot)
Heatmap of raw data by time point: Average of the
size factor (and batch factor) normalised counts 
per time point and gene.
Plot with draw(complexHeatmapRaw).
\item complexHeatmapFit (complexHeatmap plot)
Heatmap of impulse-fitted data by time point.
Plot with draw(complexHeatmapFit).
\item lsvecGeneGroups (list)
List of gene ID vectors: One per heatmap group 
with all gene IDs of the the profiles displayed
in the heatmap.
}
}
\description{
Creates a complexHeatmap heatmap structured into 
subsets of genes according to their behaviour and 
sorted by peak time for raw counts and for the
fitted signal.
}
\examples{
library(ComplexHeatmap)
lsSimulatedData <- simulateDataSetImpulseDE2(
vecTimePointsA   = rep(seq(1,8),3),
vecTimePointsB   = NULL,
vecBatchesA      = NULL,
vecBatchesB      = NULL,
scaNConst        = 0,
scaNImp          = 50,
scaNLin          = 0,
scaNSig          = 50)
objectImpulseDE2 <- runImpulseDE2(
matCountData    = lsSimulatedData$matObservedCounts, 
dfAnnotation    = lsSimulatedData$dfAnnotation,
boolCaseCtrl    = FALSE,
vecConfounders  = NULL,
boolIdentifyTransients = TRUE,
scaNProc        = 1 )
lsHeatmaps <- plotHeatmap(
objectImpulseDE2=objectImpulseDE2,
strCondition='case',
boolIdentifyTransients=TRUE,
scaQThres=0.01)
draw(lsHeatmaps$complexHeatmapRaw)

}
\seealso{
Called seperately by used.
}
\author{
David Sebastian Fischer
}

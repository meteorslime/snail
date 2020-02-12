## Data sources
#setwd("C:/Users/Research/Dropbox/DFW/GIS/Projects/Snail/GRTS")
setwd("./DFW/GIS/Projects/Snail/GRTS")

## Libraries
require(spsurvey)

## Read in dataset
df <- read.dbf("Snail/Source/Tinian_Frame_Points")

## Unstratified, equal probability design
unstrat.equal.design <- list(
    None = list(
        panel = c(PanelOne = 30), 
        seltype = "Equal", 
        caty.n = NULL, 
        over = 30
    )
)

## Unstratified, equal probability draw
unstrat.equal.sites <- grts(
    design = unstrat.equal.design, 
    DesignID = "Site", 
    #SiteBegin = "1", 
    type.frame = "finite", 
    src.frame = "shapefile", 
    in.shape = "Snail/Source/Tinian_Frame_Points", 
    att.frame = df, 
    id = "Site", 
    stratum = NULL, 
    mdcaty = NULL, 
    shapefile = T, 
    prjfilename = "Snail/Source/Tinian_Frame_Points", 
    out.shape = "Snail/Results/TinianDraw1"
)

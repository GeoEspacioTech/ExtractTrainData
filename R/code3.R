#' Add a Line shapefile and raster image.
#' @author  Subhadip Datta
#' @param img Raster image
#' @param line.shp Line shapefile with class info
#' @param In.colName Name of the column contain line id's
#' @param Out.colName Name of the output column contain line id's
#' @import sp
#' @import raster
#' @import rgeos
#' @import rgdal
#' @examples
#' library(raster)
#' library(ExtractTrainData)
#' img<-brick(system.file("extdata","ras.tif",package = "ExtractTrainData"))
#' line.shp<-shapefile(system.file("extdata","lines.shp",package = "ExtractTrainData"))
#' Out.colName<-In.colName<-"Id"
#' ExtractByPoly(img,line.shp,In.colName,Out.colName)
#' @export

ExtractByLine<-function(img,line.shp,In.colName,Out.colName){
  ltr<-rasterize(line.shp,img)
  rtp<-rasterToPoints(ltr,spatial = T)
  ev<-ExtractByPoint(img,rtp,"layer",Out.colName)
  return(ev)
}

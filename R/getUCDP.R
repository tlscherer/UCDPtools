getUCDP <-
function(dataset="ArmedConflict", rawnames=FALSE, rawdata=FALSE, local.folder, verbose=TRUE){
    
  message.dl<-function(dataset){cat("Getting UCDP ", dataset, " dataset \n\n", sep="")}
  
#### Actor ####  
  if(dataset=="Actor"){
    if(verbose) message.dl(dataset)
    dat<-gdata::read.xls("http://www.pcr.uu.se/digitalAssets/208/208522_ucdp-actor-dataset-v.2.2-2013.xls")
    
    if(rawdata==FALSE){
      if(verbose) cat("no changes found for data \n", sep="") 
    }
    if(rawnames==FALSE){
      dat<-plyr::rename(dat, c("Splinter." = "Sprinter")) 
      dat<-plyr::rename(dat, c("Alliance_Name" = "Name_Alliance")) 
      dat<-plyr::rename(dat, c("ActorID_.Alliance" = "ActorID_Alliance")) 
      dat<-plyr::rename(dat, c("Loc" = "Location"))
      if(verbose) cat("names changed \n\n", sep="") 
      }
  }

#### Agreement ####
  if(dataset=="Agreement"){
    if(verbose) message.dl(dataset)
    dat<-gdata::read.xls("http://www.pcr.uu.se/digitalAssets/141/141929_peace-agreements-1975-2011.xls")
    
    if(rawdata==FALSE){
      if(verbose) cat("no changes found for data \n", sep="") 
    }
    if(rawnames==FALSE){
      dat<-plyr::rename(dat, c("pa_date." = "pa_date")) 
      dat<-plyr::rename(dat, c("Duration" = "duration")) 
      dat<-plyr::rename(dat, c("cease" = "Cease")) 
      dat<-plyr::rename(dat, c("pp" = "Pp")) 
      dat<-plyr::rename(dat, c("Interrim" = "Interim")) 
      dat<-plyr::rename(dat, c("pris" = "Pris")) 
      dat<-plyr::rename(dat, c("txt" = "Txt")) 
      dat<-plyr::rename(dat, c("no_dyad." = "no_dyad")) 
      dat<-plyr::rename(dat, c("Out_iss." = "Out_iss")) 
      if(verbose) cat("names changed \n\n", sep="") 
    } 
  }

#### ArmedConflict ####  
  if(dataset=="ArmedConflict"){
    if(verbose) message.dl(dataset)
    
    if(missing(local.folder)) local.folder <- tempdir()
    download.file("http://www.pcr.uu.se/digitalAssets/167/167663_ucdp.prio.armed.conflict.v4.2013.zip",paste(local.folder, "167663_ucdp.prio.armed.conflict.v4.2013.zip", sep="/"))
    dat<-read.csv(unz(paste(local.folder, "167663_ucdp.prio.armed.conflict.v4.2013.zip", sep="/"),"ucdp.prio.armed.conflict.v4.2013.csv"))
    unlink(local.folder) 
    
    if(rawdata==FALSE){
      if(verbose) cat("no changes found for data \n", sep="") 
    }
    if(rawnames==FALSE){
      dat<-plyr::rename(dat, c("YEAR" = "Year")) 
      dat<-plyr::rename(dat, c("StartDate2" = "Startdate2")) 
      dat<-plyr::rename(dat, c("GWNOA" = "GWNoA")) 
      dat<-plyr::rename(dat, c("GWNOA2nd" = "GWNoA2nd")) 
      dat<-plyr::rename(dat, c("GWNOB" = "GWNoB")) 
      dat<-plyr::rename(dat, c("GWNOB2nd" = "GWNoB2nd")) 
      dat<-plyr::rename(dat, c("GWNOLoc" = "GWNoLoc")) 
      if(verbose) cat("names changed \n\n", sep="") 
    } 
    
  }

#### BattleDeaths ####
  if(dataset=="BattleDeaths"){
    if(verbose) message.dl(dataset)
    
    dat<-gdata::read.xls("http://www.pcr.uu.se/digitalAssets/167/167657_ucdp-battle-related-deaths-dataset-v5-2013.xls")
    dat<-dat[,1:24]
    if(verbose) cat("",sep="")
    if(rawdata==FALSE){
      if(verbose) cat("no changes found for data \n", sep="") 
    }
    if(rawnames==FALSE){
      dat<-plyr::rename(dat, c("Dyad_ID" = "DyadID")) 
      dat<-plyr::rename(dat, c("YEAR" = "Year")) 
      if(verbose) cat("names changed \n\n", sep="") 
    }
  }

#### Categorical ####
  if(dataset=="Categorical"){
    if(verbose) message.dl(dataset)
    
    dat<-list(
      gdata::read.xls("http://www.pcr.uu.se/digitalAssets/55/55066_UCDP_categorical_variables_1989-2008.xls",sheet=1),
      gdata::read.xls("http://www.pcr.uu.se/digitalAssets/55/55066_UCDP_categorical_variables_1989-2008.xls",sheet=2),
      gdata::read.xls("http://www.pcr.uu.se/digitalAssets/55/55066_UCDP_categorical_variables_1989-2008.xls",sheet=3),
      gdata::read.xls("http://www.pcr.uu.se/digitalAssets/55/55066_UCDP_categorical_variables_1989-2008.xls",sheet=4), 
      gdata::read.xls("http://www.pcr.uu.se/digitalAssets/55/55066_UCDP_categorical_variables_1989-2008.xls",sheet=5),
      gdata::read.xls("http://www.pcr.uu.se/digitalAssets/55/55066_UCDP_categorical_variables_1989-2008.xls",sheet=6))
    cat("note that output is a list with 6 spreadsheets") 
    if(rawdata==FALSE){
      if(verbose) cat("no changes found for data \n", sep="") 
    }
    if(rawnames==FALSE){
      dat[[1]]<-plyr::rename(dat[[1]], c("inc" = "Inc"))
      dat[[1]]<-plyr::rename(dat[[1]], c("Conflict.Name" = "ConflictName"))
      dat[[2]]<-plyr::rename(dat[[2]], c("X3rd" = "3rd"))
      dat[[3]]<-plyr::rename(dat[[3]], c("inc" = "Inc"))
      dat[[3]]<-plyr::rename(dat[[3]], c("Dyad.Name" = "DyadName"))
      dat[[4]]<-plyr::rename(dat[[4]], c("Dyad.Name" = "DyadName"))
      dat[[5]]<-plyr::rename(dat[[5]], c("side" = "Side"))
      dat[[5]]<-plyr::rename(dat[[5]], c("tp" = "Tp"))
      dat[[5]]<-plyr::rename(dat[[5]], c("X2nd_s" = "2nd_s"))
      if(verbose) cat("names changed \n\n", sep="")}
  }

#### Dyadic ####

  if(dataset=="Dyadic"){
    if(verbose) message.dl(dataset)
    
    if(missing(local.folder)) local.folder <- tempdir()
    download.file("http://www.pcr.uu.se/digitalAssets/167/167667_ucdp.dyadic.dataset.v1-2013.zip",paste(local.folder, "167667_ucdp.dyadic.dataset.v1-2013.zip", sep="/"))
    dat<-read.csv(unz(paste(local.folder, "167667_ucdp.dyadic.dataset.v1-2013.zip", sep="/"),"ucdp.dyadic.dataset.v1-2013.csv"))
    unlink(local.folder) 
    
    if(rawdata==FALSE){ 
      # Fix GWNoB for Georgia 2008 error
      dat[dat$DyadID==297 & dat$Year==2008,c("GWNoB", "GWNoB2nd")]<-c("","")  
      # replace Macedonia, FYR to Macedonia in Location, SideA, SideA2nd
      dat$SideA<-stringr::str_replace(as.character(dat$SideA), "Macedonia, FYR", "Macedonia")
      dat$SideA2nd<-stringr::str_replace(as.character(dat$SideA2nd), "Macedonia, FYR", "Macedonia")
      dat$Location<-stringr::str_replace(as.character(dat$Location), "Macedonia, FYR", "Macedonia")
      if(verbose) cat("data changed \n\n", sep="") 
    }

    if(rawnames==FALSE){
      dat<-plyr::rename(dat, c("YEAR" = "Year"))
      dat<-plyr::rename(dat, c("StartPrec" = "Startprec"))
      dat<-plyr::rename(dat, c("StartDate2" = "Startdate2"))
      dat<-plyr::rename(dat, c("StartPrec2" = "Startprec2"))
      if(verbose) cat("names changed \n\n", sep="") 
    } 
  }

#### ExtSupport ####  
if(dataset=="ExtSupport"){
  if(verbose) message.dl(dataset)
  
  dat<-gdata::read.xls("http://www.pcr.uu.se/digitalAssets/89/89149_External_support_compact_dataset_1.00_20110325-1.xls", quote = "", method = "tab")
  
  if(rawdata==FALSE){
    if(verbose) cat("no changes found for data \n", sep="") 
  }
  if(rawnames==FALSE){
    names(dat)<-c("ymp_id", "ymp_year", "ymp_name", "actorID", "bc_id", "conflictID", "bc_name", "country1", "country2", "location1", "location2", "bwd_id", "bwd_name", "external_exists", "external_alleged", "external_name", "external_code", "external_type_text", "external_X", "external_L","external_Y","external_W","external_M","external_T","external_$","external_I","external_O","external_U","external_comment")
    if(verbose) cat("names changed \n\n", sep="") 
  }
  
}

#### GeorefEvents ####  
if(dataset=="GeorefEvents"){
  if(verbose) message.dl(dataset)
  
  if(missing(local.folder)) local.folder <- tempdir()
  download.file("http://www.ucdp.uu.se/ged/data/ucdp-ged-points-v-1-5-csv.zip",paste(local.folder, "ucdp-ged-points-v-1-5-csv.zip", sep="/"))
  dat<-read.csv(unz(paste(local.folder, "ucdp-ged-points-v-1-5-csv.zip", sep="/"),"ucdp-ged15.csv"))
  unlink(local.folder) 
  
  if(rawdata==FALSE){
    if(verbose) cat("no changes found for data \n", sep="") 
  }
  if(rawnames==FALSE){
    dat<-plyr::rename(dat, c("isonumber" = "isonumeric"))
    dat<-plyr::rename(dat, c("date_prec" = "temp_prec"))
    dat<-plyr::rename(dat, c("deaths_a" = "side_a_deaths"))
    dat<-plyr::rename(dat, c("deaths_b" = "side_b_deaths"))
    dat<-plyr::rename(dat, c("unknown" = "unknown_deaths"))
    dat<-plyr::rename(dat, c("geom_wkt" = "geom_WKT")) 
    if(verbose) cat("names changed \n\n", sep="")   }
}  

#### MIC ####

if(dataset=="MIC"){
  if(verbose) message.dl(dataset)
  
  if(missing(local.folder)) local.folder <- tempdir()
  download.file("http://www.pcr.uu.se/digitalAssets/200/200349_micfinal.csv.zip", paste(local.folder, "200349_micfinal.csv.zip", sep="/"))  
  dat<-read.csv(unz(paste(local.folder, "200349_micfinal.csv.zip", sep="/"),"micFINAL.csv"))
  unlink(local.folder)
  
  if(rawdata==FALSE){
    if(verbose) cat("no changes found for data \n", sep="") 
  }
  if(rawnames==FALSE){
    if(verbose) cat("no changes found for names \n\n", sep="") 
  }
  
}

#### MILC ####

if(dataset=="MILC"){
  cat("MILC cannot be loaded into R at this time \n")
  cat("Access the excel file with the following command \n")
  cat("browseURL(UCDPindex$data_link[UCDPindex$shortname=='MILC']) \n \n")
  # dat<-gdata::read.xls("http://www.pcr.uu.se/digitalAssets/55/55086_MILC_DATASET_VERSION_1.0_PUBLIK_1_okt_07.xls")
  
  if(rawdata==FALSE){
    # if(verbose) cat("no changes found for data \n", sep="") 
  }
  if(rawnames==FALSE){
    # if(verbose) cat("no changes found for names \n\n", sep="") 
  } 
  
}

#### Non-State ####
  if(dataset=="Non-State"){
    if(verbose) message.dl(dataset)
    
    dat<-gdata::read.xls("http://www.pcr.uu.se/digitalAssets/208/208534_ucdp-non-state-conflict-dataset-v2.5-2013-1989-2012.xlsx")
    
    if(rawdata==FALSE){
      if(verbose) cat("no changes found for data \n", sep="") 
    }
    if(rawnames==FALSE){
      names(dat)[1:8]<-c("ConflictID", "Org", "SideA", "SideAID", "SideAComponents", "SideB", "SideBID", "SideBComponents")
      dat<-plyr::rename(dat, c("YEAR" = "Year"))
      if(verbose) cat("names changed \n\n", sep="")     
    } 
  }

#### One-Sided ####
  if(dataset=="One-Sided"){
    if(verbose) message.dl(dataset)
    
    dat<-gdata::read.xls("http://www.pcr.uu.se/digitalAssets/208/208528_ucdp-one-sided-violence-dataset-v1.4-2013.xlsx")
    
    if(rawdata==FALSE){
      if(verbose) cat("no changes found for data \n", sep="") 
    }
    if(rawnames==FALSE){
      dat<-plyr::rename(dat, c("Actor.ID" = "ActorID"))
      dat<-plyr::rename(dat, c("Coalition.components" = "CoalitionComponents"))
      dat<-plyr::rename(dat, c("Actor.Name" = "ActorName"))
      dat<-plyr::rename(dat, c("Gov.actor" = "GovActor")) 
      if(verbose) cat("names changed \n\n", sep="")     } 
    
  }

#### Onset ####
  if(dataset=="Onset"){
    if(verbose) message.dl(dataset)
    
    dat<-read.csv("http://www.pcr.uu.se/digitalAssets/133/133280_onset2012csv.csv") 
    
    if(rawdata==FALSE){
      if(verbose) cat("no changes found for data \n", sep="") 
    }
    if(rawnames==FALSE){
      names(dat)<-c("year", "gwno", "incidence", "newconflictinyear", "onset1", "onset2", "onset5", "onset8", "onset20", "maxintyear", "govonly", "terronly", "bothgovterr", "sumconf") 
      if(verbose) cat("names changed \n\n", sep="") 
    } 
  }

#### Termination Conflict ####
if(dataset=="TerminationConflict"){
  if(verbose) message.dl(dataset)
  
  dat<-gdata::read.xls("http://www.pcr.uu.se/digitalAssets/55/55052_UCDP_Conflict_Termination_2010_Conflict.xls")
  dat<-dat[,1:22]
  
  if(rawdata==FALSE){
    if(verbose) cat("no changes found for data \n", sep="") 
  }
  if(rawnames==FALSE){
    dat<-plyr::rename(dat, c("YEAR..final." = "YearFinal"))
    if(verbose) cat("names changed \n\n", sep="")  
  }  
}

#### Termination Dyad ####
  if(dataset=="TerminationDyad"){
    if(verbose) message.dl(dataset)
    
    dat<-gdata::read.xls("http://www.pcr.uu.se/digitalAssets/55/55054_UCDP_Conflict_Termination_2010_Dyad.xls")
    dat<-dat[,1:25]
    
    if(rawdata==FALSE){
      if(verbose) cat("no changes found for data \n", sep="") 
    }
    if(rawnames==FALSE){
      dat<-plyr::rename(dat, c("YEAR..final." = "YearFinal"))
      if(verbose) cat("names changed \n\n", sep="")     
    }  
  }

#### Fin ####
dat 
}

library(ggplot2)
library(tanggle)
library(dplyr)

Nnet <- read.nexus.networx("COI_seqs_Mbra_copy1.aln.cl2.fa.nex")

pn <- ggsplitnet(Nnet)

tips <- pn$data[pn$data$isTip, ]
tips$id <- sapply(tips$label, function(x) strsplit(x, split = "\\|")[[1]][1])
tips$id <- substr(tips$id, 1, 5)
#tips$species <- sapply(tips$label, function(x) strsplit(x, split = "\\|")[[1]][2])
#coord.info$latlon <- paste0(coord.info$lat, "_", coord.info$lon)

#tips$place <- sapply(tips$id, function(x) coord.info[which(coord.info$sampleid == x), "latlon"][1])
#tips$BIN <- sapply(tips$id, function(x) coord.info[which(coord.info$sampleid == x), "bin_uri"][1])

tips %>% count(x, y, id) -> tips.occur
#  tips.occur <- tips.occur[(!(tips.occur$place %in% c("NA_NA", ""))), ]
#tips.occur <- tips.occur[complete.cases(tips.occur$BIN), ]

#unique(tips.occur$BIN)

ggsplitnet(Nnet) +
  geom_point(data = tips.occur, aes(x=x, y=y, color = id, shape=id), 
             size=10, alpha=1) + 
  coord_fixed() + 
  geom_treescale(offset = 0, width = 0.01) 
theme(legend.position = 'bottom')


library(phangorn)
library(pegas)
algn <- read.dna("COI_seqs_Mbra_copy1.aln.cl2.fa", format = "fasta")

Haps <- haplotype(algn)
Net <- haploNet(Haps)
nt.labs <- attr(Net, "labels")

region <- substr(rownames(algn), 1, 5)

## convert data to the necessary format
R <- haploFreq(algn, fac = region, haplo = Haps)
#R <- R[nt.labs, ]

#xy <- replot()

#colors <- c("darkseagreen1", "darkseagreen4", "cyan1", "cyan3", "cyan1")

plot(Net, size = attr(Net, "freq"), pie = R, legend = c(-3, -25),
     scale.ratio = 3, label=F) #, xy=xy)


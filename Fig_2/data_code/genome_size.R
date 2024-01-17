library(ggplot2)
library(openxlsx)
library(forcats)

gs_kar <- read.xlsx("Karyotypes_Kamaltynov.xlsx")
gs_kar <- gs_kar[!(is.na(gs_kar$Genome.size.FIAD)), ]

svg(width = 10, height=5)
ggplot(gs_kar, aes(x=fct_reorder(paste(Genus, "\n", Species), Genome.size.FIAD), y=Genome.size.FIAD)) + 
  geom_bar(stat="identity") + 
  xlab("") + ylab("Genome size, pg") + 
  geom_label(aes(y=2.5, label=`2n`)) + 
#  geom_point(aes(y=`2n`), col = "black") + 
#  geom_line(aes(y=`2n`), col = "black") + 
  theme_bw(base_size = 16) + 
  theme(axis.text.x = element_text(angle = 90, face="italic", hjust = 1, vjust=0.5, lineheight = 0.6))
dev.off()

# d <- data.frame(method=c("CCSD", "OLCCD", "ODC12"),
#                 mae=c(0.171, 0.091, 0.075),
#                 std=c(0.046, 0.109, 0.080))
d <- data.frame(method=c("CCSD", "OLCCD", "ODC12"),
                mae=c(0.114, 0.054, 0.064),
                std=c(0.064, 0.066, 0.074))
d$method <- factor(d$method, levels=c("CCSD", "OLCCD", "ODC12"))

library(ggplot2)
library(ggthemes)

p <- (ggplot(data=d, aes(x=method, y=mae, fill=method)) +
      geom_bar(stat="identity", color="black", width=0.7) +
      geom_errorbar(aes(ymin=mae-std, ymax=mae+std), width=0.1, lwd=1) +
      ylim(0.091-0.108, 0.171+0.046) +
      theme_base())

ggsave(file="chart.pdf", plot=p, width=7, height=6)

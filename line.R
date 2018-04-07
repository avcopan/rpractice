library(ggplot2)
library(readr)
library(dplyr)
library(ggthemes)

d <- readr::read_delim('memory.txt', delim=' ',
                       col_names=c('m', 't'),
                       col_types=c(col_double(), col_double()))
d <- dplyr::mutate(d, dt=t-t[[1]])
print(typeof(d))
print(d)

p <- (ggplot2::ggplot(d) +
      ggplot2::geom_line(mapping=ggplot2::aes_(x=quote(dt), y=quote(m)),
                         colour="red") +
      ggplot2::xlab('time (s)') +
      ggplot2::ylab('memory (mb)') +
      ggthemes::theme_base())

ggplot2::ggsave(file='mem.pdf', plot=p, width=10, height=5)

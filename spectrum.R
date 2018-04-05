library(ggplot2)
library(ggthemes)

d <- data.frame(eth1=c(4.46, 4.52, 4.59), # 4.66,
                eth2=c(8.14, 8.13, 8.05), # 8.20,
                but1=c(3.20, 3.43, 3.37), # 3.58,
                but2=c(6.53, 6.67, 6.45), # 6.76,
                but3=c(7.28, 6.81, 6.58), # 7.14,
                hex1=c(2.64, 2.83, 2.77), # 3.01,
                hex2=c(5.60, 5.74, 5.59), # 5.89,
                hex3=c(6.55, 5.73, 5.58), # 4.21,
                labels=c("eom", "dc", "fci")) # "od",

print(d)
print(attributes(d))

eth <- (ggplot(d) +
        geom_vline(aes(xintercept=eth1, color=labels)) +
        geom_vline(aes(xintercept=eth2, color=labels)) +
        xlim(2.55, 8.15) +
        theme_base())
but <- (ggplot(d) +
        geom_vline(aes(xintercept=but1, color=labels)) +
        geom_vline(aes(xintercept=but2, color=labels)) +
        geom_vline(aes(xintercept=but3, color=labels)) +
        xlim(2.55, 8.15) +
        theme_base())
hex <- (ggplot(d) +
        geom_vline(aes(xintercept=hex1, color=labels)) +
        geom_vline(aes(xintercept=hex2, color=labels)) +
        geom_vline(aes(xintercept=hex3, color=labels)) +
        xlim(2.6, 8.15) +
        theme_base())

ggsave(file="eth.pdf", plot=eth, width=7, height=2)
ggsave(file="but.pdf", plot=but, width=7, height=2)
ggsave(file="hex.pdf", plot=hex, width=7, height=2)

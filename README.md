# What is this?
Welcome to my portfolio of data analytics projects. I'm currently busy populating it with past projects - most of them analyses performed in R. In the future I'll be adding toy analyses showcasing whatever new skills I'm learning!

## What's inside?
So far, much of the source data comes from work I did during my PhD on monkey beetles (Coleoptera: Scarabaeidae), a group of beetles that's found all over the world but is exceptionally diverse in South Africa's summer rainfall regions, where monkey beetles are important pollinators. I've found that this data is also handy for practicising SQL on, as it consists of a number of inter-related tables housing several data types, including geographic coordinates, which gives me the opportunity to explore the [PostGIS extender](www.postgis.net) for PostgreSQL!

-  Duels between male monkey beetles _Heterochelus chiragricus_
    - [Source data](https://github.com/ariellanr/DataAnalystPortfolio/blob/main/beetle_fights_chiragricus.csv): data from fights between 172 pairs of beetles, including the weapon (hind leg) size and body size of each competitor and the duration of the fight.
    - [Likelihood of resident beetles winning contests](https://github.com/ariellanr/DataAnalystPortfolio/blob/main/beetle_glm_rmarkdown.md): using relative differences in weapon size between competitors to predict how likely a resident male is to win against an intruder.

- Relational database containing data from several populations of blue monkey beetles _Scelophysa trimeni_
    - [DUMP](https://github.com/ariellanr/DataAnalystPortfolio/blob/main/monkeybeetle_db.txt): pre- and post-data only!

- Ridgeplot illustrating variation in size of the four anatomical structures comprising the hind leg weaponry of _S. trimeni_ - ggplot2
    - [Data](https://github.com/ariellanr/DataAnalystPortfolio/blob/main/beetle_leg-component_sizes.csv)
    - [R script](https://github.com/ariellanr/DataAnalystPortfolio/blob/main/ridge_plots_17-06-2022.R)

- FORTHCOMING
    - Map with inset (QGIS)
    - Stuff in Python!



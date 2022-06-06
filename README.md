# What is this?
Welcome to my portfolio of data analytics projects. I'm currently busy populating it with past projects - most of them analyses performed in R. In the future I'll be adding toy analyses showcasing whatever new skills I'm learning!

## What's inside?
So far, much of the source data comes from work I did during my PhD on monkey beetles (Coleoptera: Scarabaeidae), a group of beetles that's found all over the world but is exceptionally diverse in South Africa's summer rainfall regions, where monkey beetles are important pollinators. I've found that this data is also handy for practicising SQL on, as it consists of a number of inter-related tables housing several data types, including geographic coordinates, which gives me the opportunity to explore the [PostGIS extender](www.postgis.net) for PostgreSQL!

-  Duels between male monkey beetles _Heterochelus chiragricus_
    - [Source data](https://github.com/ariellanr/DataAnalystPortfolio/blob/main/beetle_fights_chiragricus.csv): data from fights between 172 pairs of beetles, including the weapon (hind leg) size and body size of each competitor and the duration of the fight.
    - (Exploratory analyses): getting a bird's eye view of the data with visualisations and descriptive statistics.
    - [Contestant size ~ contest duration](https://github.com/ariellanr/DataAnalystPortfolio/blob/main/generalized_linear_models.R): to understand how contestant sizes are correlated with contest duration, I constructed several candidate models examining key aspects of contestant size and compared their fit to the data using the Akaike Information Criterion (AIC) (for more information, see the length comment at the beginning of the [code file](https://github.com/ariellanr/DataAnalystPortfolio/blob/main/generalized_linear_models.R))

- Relational database containing data from several populations of blue monkey beetles _Scelophysa trimeni_
    - [DUMP](): schema only!





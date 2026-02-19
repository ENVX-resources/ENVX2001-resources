# Packages
library(readr)
library(tidyverse)

# Read in data
sites <- read.csv('browsing_data_2003_2020_2.csv')

# Filter out the sites that Ripple did not include in his analysis

# Ripple used all 21 observational sites, but only 4 control sites
# These control sites were: wb-cc, elk-cc, eb2-cc, eb1-cc
# Here is a list of all the sites that Ripple did *not* analyse:

sites_not_analysed <- c(
  'wb-dx','wb-dc','wb-cx',
  'elk-dx','elk-dc','elk-cx',
  'eb2-dx','eb2-dc','eb2-cx',
  'eb1-dx','eb1-dc','eb1-cx'
)

# We use the subset function:
sites_Ripple <- sites[,]

# Remember that to filter for specific rows, we code before the comma: [*,]
sites_Ripple <- sites[sites$site_full == 'wb2-obs',]
# This picks out the specific row named wb2-obs.

# Now, things get a little bit tricky! 

# We have to use the "%in%" function to pick out multiple rows at once:
sites_Ripple <- sites[sites$site_full %in% sites_not_analysed,]

# Finally, we need to use the "!" argument.

# "!" tells R that we want to remove the rows we selected, not keep them
sites_Ripple <- sites[!sites$site_full %in% sites_not_analysed,]


# Graph
ggplot(sites_Ripple, aes(x = year, y = site_full))+
  geom_line()+
  geom_point()+
  theme_classic()

# What do we notice?
# It looks like we only have 4 sites sampled in 2001.
# We have far more 'after' sites than 'before' sites.
# Why might this be a problem?


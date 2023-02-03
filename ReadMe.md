# Founder Calcium Study

Goal: Stimulating insulin secretion in beta cells yields calcium activity. Compare across
founders of both sexes with protein mRNA. 

Chris Emfinger <emfinger@wisc.edu> added a folder in the research drive `/Volumes/adattie/General/founder_calcium_website` in a new subfolder called `updated files`. The `correlations` subfolder should have the correlation data with the updated nomenclature to be more matched term for term.

Also in the subfolder is `raw_data` (each animal's average for the calcium in the calcium study). I included the proteomic raw data as well. Please note that the individual animal IDs from the proteomic study and the calcium study are not related. The two studies use different animal sets.

The relevant data and a small ppt summarizing our "artists' impression" of what the resource might look like are on the [UW ResearchDrive](https://it.wisc.edu/services/researchdrive/) at </Volumes/adattie/General/founder_calcium_website/>.

The first file (Calcium_parameter_data.xlsx) would be used to plot the distributions of the various calcium parameters (the boxplots in the slides). It has two tabs. We moved the islets through four solutions and analyzed the calcium trace segments in each solution. The tools we used to analyze the islet calcium waves gave us certain parameters describing their shapes and were made in Matlab (matlab data tab) and R (the spectral density data tab). 

For the matlab data tab, the column names for columns A-F and H-K are calcium parameters. The "condition" column (column G) defines what solution the islets were in for the period of time that the analysis was performed. Columns L-N describe the mice (strain, sex and ID). 

Basal calcium "condition" is used to normalize some of the other measurements but is of interest itself as a measurement because it can be an indicator of islet functionality. 

For the spectral density tab, A-D describe the calcium parameters related to spectral density. Column E is the animal ID, column F is the solution the islets were in for that trace segment analyzed, and column G and H describe the mouse strain and sex, respectively. 

Data for this github repository are identified by a local `data/source.csv`,
which is not saved with the repo. Data are not included with the repository.

# Interactive web viewer to visualize future hydropower impact
Authors: Leela Dixit, Megan Hessel, Aakriti Poudel, Lucian Scher

## Description
This repository containing code and output for the interactive web viewer created for the UCSB MEDS 2026 NetZeroHydro capstone project. The goal of the web viewer is for users to input metrics of their choosing to visualize future and current dams on a river network of their choosing. 

## File structure
Descriptions of each folder and file can be viewed in the table below.

| File/Folder | **Description** |
|----|----|
| global.R | Script for reading packages, data, and necessary data cleaning. |
| ui.R | Code for creating the user interface of the interactive web viewer. |
| server.R | Code for backend processing of data filtering and visualizations. |
| session_info.txt | R session info including package versions and software requirements. |

## Data sources
This web viewer visualizes the data product of the NetZeroHydro capstone project. The final dataset for this web viewer is house [somewhere!](). For this project, the input data was prepared in the companion [\`connectivity\`](https://github.com/NetZeroHydro)repository using the following datasets:
-   [Global Dam Watch (GDW)](https://www.globaldamwatch.org/):Comprehensive database of existing hydropower infrastructure worldwide.

-   [Future Hydropower and Reservoir Data (FhRED)](https://www.globaldamwatch.org/directory): Planned and proposed hydropower projects with installed capacity ≥ 1 MW.

-   [Global River Networks (HydroRIVERS Dataset)](https://www.hydrosheds.org/products/hydrorivers): Vectorized global river network at \~500 m resolution with hydrological attributes.

-   [Free-Flowing Rivers database (FFR)](https://www.hydrosheds.org/applications/free-flowing-rivers):Classification of free-flowing and at-risk rivers derived from the HydroSHEDS network.

-   [Protected Planet](https://www.protectedplanet.net/en): Global database of terrestrial and marine protected areas and OECMs.

## Packages and software
See `session_info.txt` for the full list of R packages, versions, and software dependencies. (TBD!!)

### Technical Documentation

To read more about the project and modeling processes, please refer to our [Bren project page](https://bren.ucsb.edu/projects/hydropowers-low-hanging-fruits-leveraging-least-impact-dams-power-net-zero-futurehttps://bren.ucsb.edu/projects/hydropowers-low-hanging-fruits-leveraging-least-impact-dams-power-net-zero-future) and technical documentation.

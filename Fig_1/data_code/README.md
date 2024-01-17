This folder contains all the data and description of procedures to reproduce Figure 1 from the manuscript.

Analysis pipeline:
1. Available data for the analyzed sequences were downloaded from BOLD [boldsystems.org/](boldsystems.org/) and merged into the document `1_bold_data_3sp` in LibreOffice Calc. Lacking or apparently wrong coordinates were added / corrected with the corresponding publications. The resulting document was exported into plain text csv format in order to easen import into R.
2. COI sequences were merged to form `2_BOLD_COI_3sp.fas`.
3. The sequences were aligned with mafft v7.490 in the interface of UGENE v44 and manually trimmed to the shortest sequence => `3_BOLD_COI_3sp_aln_trimmed.fa`.
4. Spaces (' ') in sequence names were replaced with underscores ('_') to avoid further troubles wih SplitsTree => `4_BOLD_COI_3sp_aln_trimmed_cl2.fa`.
5. The file was split into three files (one for each species) => `5_BOLD_COI_Ecy_aln_trimmed_cl2.fa', `5_BOLD_COI_Eve_aln_trimmed_cl2.fa`. `5_BOLD_COI_Gfa_aln_trimmed_cl2.fa`.
6. Split networks were created with SplitsTree v4 and exported as nexus files => `6_BOLD_COI_Ecy_aln_trimmed_cl2.fa.nex`, `6_BOLD_COI_Ecy_aln_trimmed_cl2.fa.nex`, `6_BOLD_COI_Ecy_aln_trimmed_cl2.fa.nex`.
7. The networks and maps were visualized with the `tanggle`, `phangorn` and and `rnaturalearth` packages for `R` (see `draw_network_maps.R` for details).
8. All components of the figure were assembled with [inkscape.org](Inkscape).

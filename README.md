## Langmead UCLA CGSI Tutorial

This README accompanies my UCLA SGSI tutorial of Monday, July 7 2018.  The tutorial has three coding portions, corresponding to three levels of summarization/queryability:

1. R code (`jx1.Rmd`) for exploring summarized exon-exon splice-junction data (henceforth: *junction data*) over tens of thousands of datasets at once.  This mimics the kinds of analysis performed in the *Intropolis* paper:

    * Human splicing diversity and the extent of unannotated splice junctions across human RNA-seq samples on the Sequence Read Archive -- https://doi.org/10.1186/s13059-016-1118-6

2. R code from the `recount2` getting started guide, demonstrating an in-depth analysis of a few RNA-seq *studies*, and making use of different summary types.  This mimics the kinds of analysis performed in the *recount2* paper:

    * Reproducible RNA-seq analysis using recount2 -- https://doi.org/10.1038/nbt.3838

3. Python code for querying the [Snaptron service](http://snaptron.cs.jhu.edu) 

Thus, all the relevant code can be found in these files:

* `jx1.Rmd`
* `recount.Rmd`
* `snaptron.py`

## Related papers

1. Cloud computing for genomic data analysis and collaboration -- https://doi.org/10.1038/nrg.2017.113
2. Snaptron: querying splicing patterns across tens of thousands of RNA-seq samples -- https://doi.org/10.1093/bioinformatics/btx547
3. Reproducible RNA-seq analysis using recount2 -- https://doi.org/10.1038/nbt.3838
4. Human splicing diversity and the extent of unannotated splice junctions across human RNA-seq samples on the Sequence Read Archive -- https://doi.org/10.1186/s13059-016-1118-6
5. Rail-RNA: scalable analysis of RNA-seq splicing and coverage -- https://doi.org/10.1093/bioinformatics/btw575

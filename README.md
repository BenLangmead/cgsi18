## Langmead UCLA CGSI Tutorial

This README accompanies my UCLA SGSI tutorial of Monday, July 30 2018.  The tutorial has three coding portions, corresponding to three levels of summarization/queryability:

1. R code (`jx1.Rmd`) for exploring summarized exon-exon splice-junction data (henceforth: *junction data*) over tens of thousands of datasets at once.  This mimics the kinds of analysis performed in the *Intropolis* paper:

    * Nellore A, Jaffe AE, Fortin JP, Alquicira-Hernández J, Collado-Torres L, Wang S, Phillips RA III, Karbhari N, Hansen KD, Langmead B, Leek JT. Human splicing diversity and the extent of unannotated splice junctions across human RNA-seq samples on the Sequence Read Archive. Genome Biol. 2016 Dec 30;17(1):266.  https://doi.org/10.1186/s13059-016-1118-6

2. R code from the `recount2` getting started guide, demonstrating an in-depth analysis of a few RNA-seq *studies*, and making use of different summary types.  Similar to the analyses performed in the *recount2* paper:

    * Collado-Torres L, Nellore A, Kammers K, Ellis SE, Taub MA, Hansen KD, Jaffe AE, Langmead B, Leek JT. Reproducible RNA-seq analysis using recount2. Nat Biotechnol. 2017 Apr 11;35(4):319-321. https://doi.org/10.1038/nbt.3838

3. Python code for querying the [Snaptron service](http://snaptron.cs.jhu.edu)

    * Wilks C, Gaddipati P, Nellore A, Langmead B. Snaptron: querying splicing patterns across tens of thousands of RNA-seq samples. Bioinformatics. 2018 Jan 1;34(1):114-116. https://doi.org/10.1093/bioinformatics/btx547

Thus, all the relevant code can be found in these files:

* `jx1.Rmd`
* `recount.Rmd`
* `snaptron.py`

## Related links

* recount2
    * [Front page](https://jhubiostatistics.shinyapps.io/recount/): search study metadata and download data
    * [SciServer](): use Jupyter/R/Python & computers at JHU to work with recount2 data without downloading it
    * [Paper](https://doi.org/10.1038/nbt.3838) & [Workflow paper]()
* Snaptron
    * [Front page](http://snaptron.cs.jhu.edu): API docs, installation instructions
    * [Raw data](http://snaptron.cs.jhu.edu/data/), which we used in the first coding portion
    * [Paper](https://doi.org/10.1093/bioinformatics/btx547)

## Related papers

1. Langmead B, Nellore A. Cloud computing for genomic data analysis and collaboration. Nat Rev Genet. 2018 May;19(5):325. https://doi.org/10.1038/nrg.2017.113
2. Wilks C, Gaddipati P, Nellore A, Langmead B. Snaptron: querying splicing patterns across tens of thousands of RNA-seq samples. Bioinformatics. 2018 Jan 1;34(1):114-116. https://doi.org/10.1093/bioinformatics/btx547
3. Collado-Torres L, Nellore A, Kammers K, Ellis SE, Taub MA, Hansen KD, Jaffe AE, Langmead B, Leek JT. Reproducible RNA-seq analysis using recount2. Nat Biotechnol. 2017 Apr 11;35(4):319-321. https://doi.org/10.1038/nbt.3838
4. Nellore A, Jaffe AE, Fortin JP, Alquicira-Hernández J, Collado-Torres L, Wang S, Phillips RA III, Karbhari N, Hansen KD, Langmead B, Leek JT. Human splicing diversity and the extent of unannotated splice junctions across human RNA-seq samples on the Sequence Read Archive. Genome Biol. 2016 Dec 30;17(1):266.  https://doi.org/10.1186/s13059-016-1118-6
5. Nellore A, Collado-Torres L, Jaffe AE, Alquicira-Hernández J, Wilks C, Pritt J, Morton J, Leek JT, Langmead B. Rail-RNA: scalable analysis of RNA-seq splicing and coverage. Bioinformatics. 2017 Dec 15;33(24):4033-4040. https://doi.org/10.1093/bioinformatics/btw575

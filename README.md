# rhodesthesis

This is a modified version of [`thesisdown`](https://github.com/ismayc/thesisdown) to be compatible with the [Rhodes University reserach degree regulations]. The updates are mainly around the ordering of sections and spacing/font sizing.


The PDF and HTML (gitbook) versions work pretty well. The word version is hit or miss and really should only be used if you want to get comments/feedback from supervisors etc..

You should follow the [`thesisdown`](https://github.com/ismayc/thesisdown) guide and when it comes to it you should then install `rhodesthesis`:

```{r}
# Install devtools
install.packages("devtools")
library(devtools)

# Install rhodesthesis directly from GitHub
devtools::install_github("fmcron/RhodesStatistics")
library(rhodesthesis)
```

In `RStudio` (you may need to restart it first) go to new file, R Markdown, from template, rhodesthesis. You *must* give it the name **index** or it will not work. `knit` the `index.Rmd` file and it will pull the guide up.
![](rhodesthesis.png)


## Important stuff 

### Set-up
I put all of my figures that I wanted to use in the `figure/` folder and then within individual chapter folders. I did a similar thing with any data I wanted to use by using the `data/` folder and then using chapters within that.

### help / advice

* [figures](https://bookdown.org/yihui/bookdown/figures.html)
* [tables](https://bookdown.org/yihui/bookdown/tables.html)
* [`kableExtra`](http://haozhu233.github.io/kableExtra/awesome_table_in_html.html)
* [`flextable`](https://davidgohel.github.io/flextable/articles/overview.html)
* [cross-referencing](https://bookdown.org/yihui/bookdown/cross-references.html)


### Microsoft word and tables
If you want to `knit` to word and pdf/HTML interchangeably then there might be issues with tables specifically. To get around this I make tables for html/pdf using `kable` and `kableExtra` and for word I use `flextable`. The issue here is that `R Markdown` needs to know what document you are knitting to. To tell it you should include `doc.type <- knitr::opts_knit$get('rmarkdown.pandoc.to')` at the top of your `index.Rmd` file and just for safety (and if you want to knit individual chapters) at the top of each `.Rmd` file. You can then use an `ifelse` statement to produce tables:

```{r}
if(doc.type == "docx"){
}else{
}
```

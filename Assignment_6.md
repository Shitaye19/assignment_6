Assignment 6: Relational data plus revisiting data wrangling and
visualization
================

\#\#**Instructions: Please read through this before you begin**

  - This assignment is due by **10pm on Monday 11/02/20.**

  - Please **reproduce this markdown template.** Pay attention to all
    the formating in this file, including bullet points, bolded
    characters, inserted code chunks, headings, text colors, blank
    lines, and etc.

  - For exercise 1 use the apppropriate `join` function to join some
    relational datasets, and use the resulting datasets to answer some
    questions.

  - Have all your code embedded within the R markdown file, and show
    both of your **code** and **plots** in the knitted markdown file.

  - Use R Markdown functionalities to **hide messages and warnings when
    needed.** (Suggesstion: messages and warnings can often be
    informative and important, so please examine them carefully and only
    turn them off when you finish the exercise).

  - Please name your R markdown file `assignment_6.Rmd` and the knitted
    markdown `assignment_6.md.` Please upload both files using your
    personal GitHub repository for this class.

  - First, load all the required packages with the following code.
    Install them if they are not installed yet.

<!-- end list -->

``` r
library(tidyverse)
```

    ## ── Attaching packages ────────────────────────────────────────────────────────────────── tidyverse 1.3.0 ──

    ## ✓ ggplot2 3.3.2     ✓ purrr   0.3.4
    ## ✓ tibble  3.0.3     ✓ dplyr   1.0.2
    ## ✓ tidyr   1.1.2     ✓ stringr 1.4.0
    ## ✓ readr   1.3.1     ✓ forcats 0.5.0

    ## ── Conflicts ───────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
library(knitr)
```

## **Exercise 1: Join functions**

**Acknowledgments:** The datasets and some of the questions for this
exercise has been borrowed (with permission) from lain Carmichael’s
course STOR 290: Introduction to Data Science.

**Read in some relational datasets from GitHub**

``` r
## for 4.1
toy1 <- read_csv('https://raw.githubusercontent.com/idc9/stor390/master/data/joins/toy_one.csv')
```

    ## Parsed with column specification:
    ## cols(
    ##   key = col_character(),
    ##   value = col_character()
    ## )

``` r
toy2 <- read_csv('https://raw.githubusercontent.com/idc9/stor390/master/data/joins/toy_two.csv')
```

    ## Parsed with column specification:
    ## cols(
    ##   label = col_character(),
    ##   animal = col_character()
    ## )

``` r
## for 4.2
play1 <- read_csv('https://raw.githubusercontent.com/idc9/stor390/master/data/joins/play_one.csv')
```

    ## Parsed with column specification:
    ## cols(
    ##   key = col_character(),
    ##   label = col_character(),
    ##   value = col_double()
    ## )

``` r
play2 <- read_csv('https://raw.githubusercontent.com/idc9/stor390/master/data/joins/play_two.csv')
```

    ## Parsed with column specification:
    ## cols(
    ##   key = col_character(),
    ##   label = col_character(),
    ##   othervalue = col_double()
    ## )

``` r
## for 4.3
banking_account_types <- read_csv('https://raw.githubusercontent.com/idc9/stor390/master/data/joins/banking_account_types.csv')
```

    ## Parsed with column specification:
    ## cols(
    ##   account_id = col_character(),
    ##   account_type = col_character()
    ## )

``` r
banking_transactions <- read_csv('https://raw.githubusercontent.com/idc9/stor390/master/data/joins/banking_transactions.csv')
```

    ## Parsed with column specification:
    ## cols(
    ##   id = col_character(),
    ##   transaction_amount = col_double()
    ## )

``` r
## for 4.4
crime_arrests <- read_csv('https://raw.githubusercontent.com/idc9/stor390/master/data/joins/crime_arrests.csv')
```

    ## Parsed with column specification:
    ## cols(
    ##   State = col_character(),
    ##   Murder = col_double(),
    ##   Assault = col_double(),
    ##   UrbanPop = col_double(),
    ##   Rape = col_double()
    ## )

``` r
crime_wealth <- read_csv('https://raw.githubusercontent.com/idc9/stor390/master/data/joins/crime_wealth.csv')
```

    ## Parsed with column specification:
    ## cols(
    ##   Rank = col_double(),
    ##   State = col_character(),
    ##   `2014` = col_double(),
    ##   `2010` = col_double(),
    ##   `2009` = col_double(),
    ##   `2007` = col_double()
    ## )

``` r
## for 4.5
titanic_outcomes <- read_csv('https://raw.githubusercontent.com/idc9/stor390/master/data/joins/titanic_outcomes.csv')
```

    ## Parsed with column specification:
    ## cols(
    ##   PID = col_double(),
    ##   Survived = col_double()
    ## )

``` r
titanic_person_features <- read_csv('https://raw.githubusercontent.com/idc9/stor390/master/data/joins/titanic_person_features.csv')
```

    ## Parsed with column specification:
    ## cols(
    ##   PID = col_double(),
    ##   Name = col_character(),
    ##   PClass = col_character(),
    ##   Age = col_double(),
    ##   Sex = col_character()
    ## )

**1.1 Join the `toy` datasets. Only keep rows that have matches in the
other dataset. Show the resulting dataset using `kable()`.**

``` r
toy1 %>% 
  left_join(toy2, c("key" = "label")) %>% 
  na.omit() %>% 
  kable()
```

| key | value | animal   |
| :-- | :---- | :------- |
| aaa | this  | cat      |
| aaa | this  | tiger    |
| bbb | that  | dog      |
| bbb | that  | hampster |
| ddd | thing | horse    |
| ddd | one   | horse    |

\*\*1.2. Join the `play` datasets by `key` and `label`. Keep all rows
from both datasets. Show the resulting dataset using `kable()`.

``` r
play1 %>% 
  left_join(play2, by = c("key","label")) %>% 
kable()
```

| key | label | value | othervalue |
| :-- | :---- | ----: | ---------: |
| aaa | rrr   |     1 |        111 |
| aaa | rrr   |     1 |        444 |
| rrr | aaa   |     2 |         NA |
| ttt | xxx   |     3 |        222 |
| vvv | uuu   |     4 |        333 |
| vvv | uuu   |     4 |        555 |
| rrr | aaa   |     6 |         NA |
| ttt | xxx   |     7 |        222 |
| vvv | uuu   |     8 |        333 |
| vvv | uuu   |     8 |        555 |

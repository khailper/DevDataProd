---
title       : Savings Recommendation App
subtitle    : 
author      : khailper
job         : student
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Introduction

- Based on Helaine Olen and Harold Pollack's finincial advice index card
(http://www.washingtonpost.com/blogs/wonkblog/wp/2013/09/16/this-4x6-index-card-has-all-the-financial-advice-youll-ever-need)
- Main recommendations are to save 20% of you income and max out your 401(k) or equivalent.
- In their book they've changed this to 10-20%.
- The purpose of the app is to give people a recommended savings level based on that advise given their weekly income.

---

## Methodolgy

- Take users weekly income and whether or nor their has some sort of savings match to provide a recommended savings so that total savings (savings + match) is within the 10-20% guideline


```r
##lower end of the range
lowersave <- function(income, match){
        ifelse(match == "No",income * .1, income * .05)
}

##upper end of the range
uppersave <- function(income, match){
        ifelse(match == "No",income * .2, income * .1)
}

##function to return the advice
advice <- function(income, match){
        paste("$", lowersave(income, match), " to $", uppersave(income, match), collapse = "")
}
```

---

## Example

For example, if someone made $1000/week but didn't have access to a 40(k):

```r
advice(1000, "No")
```

```
## [1] "$ 100  to $ 200"
```

But if their employer did offer one:

```r
advice(1000, "Yes")
```

```
## [1] "$ 50  to $ 100"
```

---

## Assumptions/Limitations

- US-centric (savings assumptions based on Social Security/Medicare as amount of social insurance)
- Doesn't have a way to account for an employer- provided defined-benefit
- Assumes that main focus of savings is retirement; already taken have a rainy fund, don't need to save for kid's college
- Assumes match doesn't cap out before 10% of income
- Assumes that advisee made reasonable savings choices in the past and doesn't need to make up for low savings
- Assumes that person can afford to adjust there budget around that savings level

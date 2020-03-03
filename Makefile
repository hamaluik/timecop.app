# from https://tech.davis-hansson.com/p/make/
SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

ifeq ($(origin .RECIPEPREFIX), undefined)
  $(error This Make does not support .RECIPEPREFIX. Please use GNU Make 4.0 or later)
endif
.RECIPEPREFIX = >

HTMLS = public/en/index.html public/en/terms.html public/en/privacy.html
HTMLS += public/fr/index.html public/fr/terms.html public/fr/privacy.html
HTMLS += public/de/index.html public/de/terms.html public/de/privacy.html
HTMLS += public/es/index.html public/es/terms.html public/es/privacy.html
HTMLS += public/hi/index.html public/hi/terms.html public/hi/privacy.html
HTMLS += public/id/index.html public/id/terms.html public/id/privacy.html
HTMLS += public/ja/index.html public/ja/terms.html public/ja/privacy.html
HTMLS += public/ko/index.html public/ko/terms.html public/ko/privacy.html
HTMLS += public/pt/index.html public/pt/terms.html public/pt/privacy.html
HTMLS += public/ru/index.html public/ru/terms.html public/ru/privacy.html
HTMLS += public/ar/index.html public/ar/terms.html public/ar/privacy.html
HTMLS += public/zh-CN/index.html public/zh-CN/terms.html public/zh-CN/privacy.html
HTMLS += public/zh-TW/index.html public/zh-TW/terms.html public/zh-TW/privacy.html

build: public/style.css $(HTMLS)
.PHONY: build

clean:
> rm -f public/style.css
> rm -rf public/en
> rm -rf public/fr
> rm -rf public/de
> rm -rf public/es
> rm -rf public/hi
> rm -rf public/id
> rm -rf public/ja
> rm -rf public/ko
> rm -rf public/pt
> rm -rf public/ru
> rm -rf public/ar
> rm -rf public/zh-CN
> rm -rf public/zh-TW
.PHONY: clean

public/style.css: $(shell find style -type f)
> sass --style=compressed --no-source-map style/style.scss public/style.css

# first English (a straight copy)
public/en/index.html: public/index.html
> mkdir -p public/en public/en/images
> cp public/index.html public/en/index.html
> cp public/images/badge_google_play.png public/images/badge_app_store.svg public/images/timecop-screenshot-iphone-x.png public/images/timecop-screenshot-iphone-x-dark.png public/en/images/

public/en/terms.html: public/terms.html
> mkdir -p public/en public/en/images
> cp public/terms.html public/en/terms.html

public/en/privacy.html: public/privacy.html
> mkdir -p public/en public/en/images
> cp public/privacy.html public/en/privacy.html

# TODO: automate this garbage

# fr
public/fr/index.html: public/index.html
> ./translate.sh index.html fr

public/fr/terms.html: public/terms.html
> ./translate.sh terms.html fr

public/fr/privacy.html: public/privacy.html
> ./translate.sh privacy.html fr

# de
public/de/index.html: public/index.html
> ./translate.sh index.html de

public/de/terms.html: public/terms.html
> ./translate.sh terms.html de

public/de/privacy.html: public/privacy.html
> ./translate.sh privacy.html de

# es
public/es/index.html: public/index.html
> ./translate.sh index.html es

public/es/terms.html: public/terms.html
> ./translate.sh terms.html es

public/es/privacy.html: public/privacy.html
> ./translate.sh privacy.html es

# hi
public/hi/index.html: public/index.html
> ./translate.sh index.html hi

public/hi/terms.html: public/terms.html
> ./translate.sh terms.html hi

public/hi/privacy.html: public/privacy.html
> ./translate.sh privacy.html hi

# id
public/id/index.html: public/index.html
> ./translate.sh index.html id

public/id/terms.html: public/terms.html
> ./translate.sh terms.html id

public/id/privacy.html: public/privacy.html
> ./translate.sh privacy.html id

# ja
public/ja/index.html: public/index.html
> ./translate.sh index.html ja

public/ja/terms.html: public/terms.html
> ./translate.sh terms.html ja

public/ja/privacy.html: public/privacy.html
> ./translate.sh privacy.html ja

# ko
public/ko/index.html: public/index.html
> ./translate.sh index.html ko

public/ko/terms.html: public/terms.html
> ./translate.sh terms.html ko

public/ko/privacy.html: public/privacy.html
> ./translate.sh privacy.html ko

# pt
public/pt/index.html: public/index.html
> ./translate.sh index.html pt

public/pt/terms.html: public/terms.html
> ./translate.sh terms.html pt

public/pt/privacy.html: public/privacy.html
> ./translate.sh privacy.html pt

# ru
public/ru/index.html: public/index.html
> ./translate.sh index.html ru

public/ru/terms.html: public/terms.html
> ./translate.sh terms.html ru

public/ru/privacy.html: public/privacy.html
> ./translate.sh privacy.html ru

# ar
public/ar/index.html: public/index.html
> ./translate.sh index.html ar

public/ar/terms.html: public/terms.html
> ./translate.sh terms.html ar

public/ar/privacy.html: public/privacy.html
> ./translate.sh privacy.html ar

# zh-CN
public/zh-CN/index.html: public/index.html
> ./translate.sh index.html zh-CN

public/zh-CN/terms.html: public/terms.html
> ./translate.sh terms.html zh-CN

public/zh-CN/privacy.html: public/privacy.html
> ./translate.sh privacy.html zh-CN

# zh-TW
public/zh-TW/index.html: public/index.html
> ./translate.sh index.html zh-TW

public/zh-TW/terms.html: public/terms.html
> ./translate.sh terms.html zh-TW

public/zh-TW/privacy.html: public/privacy.html
> ./translate.sh privacy.html zh-TW

[![MELPA](https://melpa.org/packages/trinary-badge.svg)](https://melpa.org/#/trinary)
[![MELPA Stable](https://stable.melpa.org/packages/trinary-badge.svg)](https://stable.melpa.org/#/trinary)
[![CI](https://github.com/emacs-elsa/trinary-logic/actions/workflows/test.yml/badge.svg)](https://github.com/emacs-elsa/trinary-logic/actions/workflows/test.yml)

# trinary = Three-valued logic for Emacs

See [Three-valued logic](https://en.wikipedia.org/wiki/Three-valued_logic).

# Motivation

Some problems are very awkwardly expressed in two-valued logic, mostly
when we are dealing with uncertainty.

A typical example is flow analysis.  Consider this piece of elisp
code:

``` emacs-lisp
(let (a)
  (if x
      (setq a "a was set")
    (message "we do nothing"))
  a) ;; what is a?
```

If we now ask a question "is `a` a string?" the answer is not
"definitely yes" nor "definitely no" but "maybe" because without
knowing what `x` is we can't tell.

This and many more use-cases can be found in
[Elsa](https://github.com/emacs-elsa/Elsa), the Emacs Lisp Static
Analyzer.

# API

## Constructors

* `trinary-true`
* `trinary-maybe`
* `trinary-false`

## Predicates

* `trinary-true-p` = true
* `trinary-maybe-p` = maybe
* `trinary-false-p` = false
* `trinary-possible-p` = true or maybe
* `trinary-necessary-p` = true

## Operators

See [Kleene logic](https://en.wikipedia.org/wiki/Three-valued_logic#Kleene_and_Priest_logics).

* `trinary-not`
* `trinary-and`
* `trinary-or`
* `trinary-happened`
* `trinary-add-maybe` = X or maybe

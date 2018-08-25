# trinary = Three-valued logic for Emacs

See [Three-valued logic](https://en.wikipedia.org/wiki/Three-valued_logic).

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
* `trinary-add-maybe` = X or maybe

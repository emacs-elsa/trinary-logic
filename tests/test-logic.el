;; -*- lexical-binding: t -*-

;; Copyright (C) 2018-2023  Free Software Foundation, Inc.

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;;; Code:

(require 'trinary)
(require 'buttercup)

(describe "Trinary"

  (describe "predicates"

    (describe "trinary-true-p"

      (it "should return t for true₃"
        (expect (trinary-true-p (trinary-true)) :to-be t))

      (it "should return nil for maybe₃"
        (expect (trinary-true-p (trinary-maybe)) :to-be nil))

      (it "should return nil for false₃"
        (expect (trinary-true-p (trinary-false)) :to-be nil)))

    (describe "trinary-maybe-p"

      (it "should return nil for true₃"
        (expect (trinary-maybe-p (trinary-true)) :to-be nil))

      (it "should return t for maybe₃"
        (expect (trinary-maybe-p (trinary-maybe)) :to-be t))

      (it "should return nil for false₃"
        (expect (trinary-maybe-p (trinary-false)) :to-be nil)))

    (describe "trinary-false-p"

      (it "should return nil for true₃"
        (expect (trinary-false-p (trinary-true)) :to-be nil))

      (it "should return nil for maybe₃"
        (expect (trinary-false-p (trinary-maybe)) :to-be nil))

      (it "should return t for false₃"
        (expect (trinary-false-p (trinary-false)) :to-be t)))

    (describe "trinary-possible-p"

      (it "should return t for true₃"
        (expect (trinary-possible-p (trinary-true)) :to-be t))

      (it "should return t for maybe₃"
        (expect (trinary-possible-p (trinary-maybe)) :to-be t))

      (it "should return nil for false₃"
        (expect (trinary-possible-p (trinary-false)) :to-be nil)))

    (describe "trinary-necessary-p"

      (it "should return t for true₃"
        (expect (trinary-necessary-p (trinary-true)) :to-be t))

      (it "should return nil for maybe₃"
        (expect (trinary-necessary-p (trinary-maybe)) :to-be nil))

      (it "should return nil for false₃"
        (expect (trinary-necessary-p (trinary-false)) :to-be nil))))

  (describe "operators"

    (describe "trinary-not"

      (it "should return true₃ for false₃"
        (expect (trinary-not (trinary-true)) :to-equal (trinary-false)))

      (it "should return maybe₃ for maybe₃"
        (expect (trinary-not (trinary-maybe)) :to-equal (trinary-maybe)))

      (it "should return true₃ for false₃"
        (expect (trinary-not (trinary-false)) :to-equal (trinary-true))))

    (describe "trinary-add-maybe"

      (it "should return true₃ for true₃"
        (expect (trinary-add-maybe (trinary-true)) :to-equal (trinary-true)))

      (it "should return maybe₃ for maybe₃"
        (expect (trinary-add-maybe (trinary-maybe)) :to-equal (trinary-maybe)))

      (it "should return maybe₃ for false₃"
        (expect (trinary-add-maybe (trinary-false)) :to-equal (trinary-maybe))))

    (describe "trinary-and"

      (it "should return true₃ for true₃ and true₃"
        (expect (trinary-and (trinary-true) (trinary-true)) :to-equal (trinary-true)))

      (it "should return maybe₃ for true₃ and maybe₃"
        (expect (trinary-and (trinary-true) (trinary-maybe)) :to-equal (trinary-maybe)))

      (it "should return false₃ for true₃ and false₃"
        (expect (trinary-and (trinary-true) (trinary-false)) :to-equal (trinary-false)))

      (it "should return maybe₃ for maybe₃ and true₃"
        (expect (trinary-and (trinary-maybe) (trinary-true)) :to-equal (trinary-maybe)))

      (it "should return maybe₃ for maybe₃ and maybe₃"
        (expect (trinary-and (trinary-maybe) (trinary-maybe)) :to-equal (trinary-maybe)))

      (it "should return false₃ for maybe₃ and false₃"
        (expect (trinary-and (trinary-maybe) (trinary-false)) :to-equal (trinary-false)))

      (it "should return false₃ for false₃ and true₃"
        (expect (trinary-and (trinary-false) (trinary-true)) :to-equal (trinary-false)))

      (it "should return false₃ for false₃ and maybe₃"
        (expect (trinary-and (trinary-false) (trinary-maybe)) :to-equal (trinary-false)))

      (it "should return false₃ for false₃ and false₃"
        (expect (trinary-and (trinary-false) (trinary-false)) :to-equal (trinary-false))))

    (describe "trinary-or"

      (it "should return true₃ for true₃ or true₃"
        (expect (trinary-or (trinary-true) (trinary-true)) :to-equal (trinary-true)))

      (it "should return true₃ for true₃ or maybe₃"
        (expect (trinary-or (trinary-true) (trinary-maybe)) :to-equal (trinary-true)))

      (it "should return true₃ for true₃ or false₃"
        (expect (trinary-or (trinary-true) (trinary-false)) :to-equal (trinary-true)))

      (it "should return true₃ for maybe₃ or true₃"
        (expect (trinary-or (trinary-maybe) (trinary-true)) :to-equal (trinary-true)))

      (it "should return maybe₃ for maybe₃ or maybe₃"
        (expect (trinary-or (trinary-maybe) (trinary-maybe)) :to-equal (trinary-maybe)))

      (it "should return maybe₃ for maybe₃ or false₃"
        (expect (trinary-or (trinary-maybe) (trinary-false)) :to-equal (trinary-maybe)))

      (it "should return true₃ for false₃ or true₃"
        (expect (trinary-or (trinary-false) (trinary-true)) :to-equal (trinary-true)))

      (it "should return maybe₃ for false₃ or maybe₃"
        (expect (trinary-or (trinary-false) (trinary-maybe)) :to-equal (trinary-maybe)))

      (it "should return false₃ for false₃ or false₃"
        (expect (trinary-or (trinary-false) (trinary-false)) :to-equal (trinary-false))))

    (describe "trinary-happened"

      (it "should return true₃ for true₃ or true₃"
        (expect (trinary-happened (trinary-true) (trinary-true)) :to-equal (trinary-true)))

      (it "should return maybe₃ for true₃ or maybe₃"
        (expect (trinary-happened (trinary-true) (trinary-maybe)) :to-equal (trinary-maybe)))

      (it "should return maybe₃ for true₃ or false₃"
        (expect (trinary-happened (trinary-true) (trinary-false)) :to-equal (trinary-maybe)))

      (it "should return maybe₃ for maybe₃ or true₃"
        (expect (trinary-happened (trinary-maybe) (trinary-true)) :to-equal (trinary-maybe)))

      (it "should return maybe₃ for maybe₃ or maybe₃"
        (expect (trinary-happened (trinary-maybe) (trinary-maybe)) :to-equal (trinary-maybe)))

      (it "should return maybe₃ for maybe₃ or false₃"
        (expect (trinary-happened (trinary-maybe) (trinary-false)) :to-equal (trinary-maybe)))

      (it "should return maybe₃ for false₃ or true₃"
        (expect (trinary-happened (trinary-false) (trinary-true)) :to-equal (trinary-maybe)))

      (it "should return maybe₃ for false₃ or maybe₃"
        (expect (trinary-happened (trinary-false) (trinary-maybe)) :to-equal (trinary-maybe)))

      (it "should return false₃ for false₃ or false₃"
        (expect (trinary-happened (trinary-false) (trinary-false)) :to-equal (trinary-false))))))

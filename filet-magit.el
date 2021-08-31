;;; filet-magit.el --- A fictitious Emacs package for Magit demonstrations  -*- lexical-binding: t; -*-

;; Copyright (C) 2021 David Wilson

;; Author: David Wilson <david@systemcrafters.net>
;; Maintainer:  David Wilson <david@systemcrafters.net>
;; Created: 31 Aug 2021

;; Keywords: fake
;; URL: https://github.com/SystemCrafters/filet-magit

;; This file is not part of GNU Emacs.

;; This file is free software; you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.
;;
;; This file is distributed in the hope that it will be useful, but WITHOUT
;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
;; or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
;; License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this file.  If not, see http://www.gnu.org/licenses.
;; along with this file.  If not, see <https://www.gnu.org/licenses/>.

(defvar filet-recipe-list '(((name . "Mashed Taters")
                             (ingredients . ("2 taters", "Salt", "Green Pepper", "Milk"))
                             (instructions . "Peel, boil, mash; add butter, salt, pepper, and milk")))
  "An alist containing the entire recipe database.")

(defun filet--recipe-name (recipe)
  (alist-get 'name recipe))

(defun filet-new-recipe (name ingredients instructions)
  (message "DEBUG: Making recipe %s" name)
  `((name . ,name)
    (ingredients . ,ingredients)
    (instructions . ,instructions)))

(defun filet-show-recipe ()
  "Select a recipe to be displayed."
  (interactive)
  (message "Recipe: %s"
           (completing-read "Select a recipe:"
                            (mapcar 'filet--recipe-name filet-recipe-list))))

(defun filet-add-recipe (name ingredients instructions)
  "Add a recipe to the list."
  (interactive "sName: \nsIngredients: \nsInstructions: ")
  (setq filet-recipe-list (cons
                           (filet-new-recipe name ingredients instructions)
                           filet-recipe-list))
  (message "Added recipe \"%s\"" name))

;;; filet-magit ends here

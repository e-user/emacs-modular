;;; modular-ensime.el --- Modular Ensime module  -*- lexical-binding: t; -*-

;; Copyright © 2015-2016  Alexander Kahl

;; Author: Alexander Kahl <ak@sodosopa.io>
;; Keywords: convenience

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Load Ensime

;;; Code:
;;;###autoload
(add-to-list 'modular-features 'modular-ensime)

(install 'ensime)

(require 'ensime)

(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(setq ensime-auto-generate-config t
      ensime-sbt-command "sbt")

(provide 'modular-ensime)
;;; modular-ensime.el ends here

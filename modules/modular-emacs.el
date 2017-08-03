;;; modular-guru.el --- Modular Emacs settings          -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Alexander Kahl

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

;; Load Emacs settings

;;; Code:
;;;###autoload
(add-to-list 'modular-features 'modular-emacs)

(set-language-environment "utf-8")
(prefer-coding-system 'utf-8-unix)
(show-paren-mode)
(transient-mark-mode)
(setq make-backup-files nil)
(size-indication-mode)
(menu-bar-mode 0)
(tool-bar-mode 0)
(column-number-mode)

(set-frame-font "Inconsolata-9")
(setq default-frame-alist '((font . "Inconsolata-9")))

(calendar-set-date-style 'iso)
(setq calendar-week-start-day 1)

(setq revert-without-query '(".*"))
(global-set-key "\C-cr" 'revert-buffer)

(setq-default indent-tabs-mode nil)

(defun open-as-root ()
  "Open the current buffer as root"
  (interactive)
  (let ((file (buffer-file-name))
        (buffer (current-buffer))
        (line (count-lines 1 (point)))
        (column (current-column)))
    (kill-buffer buffer)
    (find-file (concat "/sudo:root@localhost:" file))
    (goto-line line)
    (move-to-column column)))

(setq-default fill-column 80)

; Tramp
(setq tramp-use-ssh-controlmaster-options t)

(provide 'modular-emacs)
;;; modular-emacs.el ends here

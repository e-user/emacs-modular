;;; modular-smartparens.el --- Modular Smartparens module  -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Alexander Kahl

;; Author: Alexander Kahl <e-user@fsfe.org>
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

;; Load Smartparens

;;; Code:
;;;###autoload
(add-to-list 'modular-features 'modular-smartparens)

;;;###autoload
(pin "melpa-stable" 'smartparens)

(install 'smartparens)
(require 'smartparens-config)

(show-smartparens-global-mode +1)
(setq sp-base-key-bindings 'paredit
      sp-autoskip-closing-pair 'always
      sp-hybrid-kill-entire-symbol nil)

(sp-use-paredit-bindings)

(defun wrap-with (s)
  "Create a wrapper function for smartparens using S."
  `(lambda (&optional arg)
     (interactive "P")
     (sp-wrap-with-pair ,s)))

(define-key lisp-mode-shared-map (kbd "M-(") (wrap-with "("))
(define-key lisp-mode-shared-map (kbd "M-\"") (wrap-with "\""))
(define-key prog-mode-map (kbd "M-(") (wrap-with "("))
(define-key prog-mode-map (kbd "M-\"") (wrap-with "\""))

(add-hook 'emacs-lisp-mode-hook #'smartparens-strict-mode)

(eval-after-load 'cider
  '(progn
     (add-hook 'cider-repl-mode-hook #'smartparens-strict-mode)
     (add-hook 'cider-interaction-mode-hook #'smartparens-strict-mode)
     (define-key cider-repl-mode-map (kbd "M-(") (wrap-with "("))
     (define-key cider-repl-mode-map (kbd "M-\"") (wrap-with "\""))))

(provide 'modular-smartparens)
;;; modular-smartparens.el ends here

;;; modular-javascript.el --- Modular JavaScript module  -*- lexical-binding: t; -*-

;; Copyright (C) 2015-2018  Alexander Dorn

;; Author: Alexander Dorn <ad@sodosopa.io>
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

;; Load js2

;;; Code:
;;;###autoload
(add-to-list 'modular-features 'modular-javascript)

;;;###autoload
(pin "melpa-stable" 'js2-mode 'mocha 'indium 'tern 'company-tern 'vue-mode)

(require 'modular-company)
(require 'modular-flycheck)

(install 'js2-mode 'mocha 'indium 'tern 'company-tern 'vue-mode)
(require 'js2-mode)
(require 'indium)
(require 'vue-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook #'indium-interaction-mode)
(add-hook 'js2-mode-hook #'(lambda () (tern-mode t)))
(add-to-list 'company-backends 'company-tern)

(setq-default js2-skip-preprocessor-directives t
              js2-auto-indent-p t
              js2-basic-offset 2
              js2-bounce-indent-p nil
              js2-cleanup-whitespace t
              js2-enter-indents-newline t
              js2-indent-on-enter-key nil
              js2-mirror-mode t
              js2-strict-missing-semi-warning nil)

;; https://github.com/AdamNiederer/vue-mode/issues/74
;; https://github.com/AdamNiederer/vue-mode/issues/100
(setq mmm-js-mode-enter-hook #'(lambda () (setq syntax-ppss-table nil)))

(setq tern-command `("toolbox" "run" "--container" "nodejs-12" ,(expand-file-name "~/node_modules/.bin/tern"))
      mocha-command `("toolbox" "run" "--container" "nodejs-12" ,(expand-file-name "~/node_modules/.bin/mocha")))

(provide 'modular-javascript)
;;; modular-javascript.el ends here

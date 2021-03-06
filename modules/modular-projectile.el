;;; modular-projectile.el --- Projectile init

;; Copyright © 2014  Alexander Dorn

;; Author: Alexander Dorn <ad@sodosopa.io>
;; Keywords: projectile

;;; Code:
;;;###autoload
(add-to-list 'modular-features 'modular-projectile)

;;;###autoload
(pin "melpa-stable" 'projectile 'ag 'projectile-ripgrep)

(require 'modular-ripgrep)

(install 'projectile 'ag 'projectile-ripgrep)
(require 'projectile)

(projectile-global-mode)
(setq projectile-enable-caching nil)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(add-to-list 'load-path (expand-file-name "~/Projects/private/emacs/projectile-terminal"))
(require 'projectile-terminal)

(setq projectile-terminal-multi-term-register t)
(add-to-list 'projectile-globally-ignored-directories "node_modules")

(provide 'modular-projectile)
;;; modular-projectile.el ends here

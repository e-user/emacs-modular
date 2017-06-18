;;; modular-theme.el --- theme init

;; Copyright © 2014  Alexander Kahl

;; Author: Alexander Kahl <ak@sodosopa.io>
;; Keywords: emacs, color, theme

;;; Code:
;;;###autoload
(add-to-list 'modular-features 'modular-theme)

(install 'cyberpunk-theme)
(load-theme 'cyberpunk t)

(provide 'modular-theme)
;;; modular-theme.el ends here

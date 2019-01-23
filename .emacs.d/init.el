;;; init.el --- Initialization file for Emacs
;;; Commentary:

;; Jeremy Feltracco's Emacs configuration

;;; Code:
;; load package manager, add the Melpa package registry
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)


;; bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(use-package centered-window :ensure t)

;; load helm
(use-package helm
  :ensure t
  :config
  (helm-mode 1)
  (setq helm-autoresize-mode t)
  (global-set-key (kbd "M-x") #'helm-M-x)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-x b") 'helm-buffers-list)
  (global-set-key (kbd "C-x C-b") 'helm-buffers-list)
  (define-key helm-map (kbd "S-SPC") 'helm-toggle-visible-mark))

;; load evil
(use-package evil
  :ensure t
  :init ;; tweak evil's configuration before loading it
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  (setq evil-search-module 'evil-search)
  ;; (setq evil-ex-complete-emacs-commands nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (setq evil-shift-round nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-keybinding nil)
  :config ;; tweak evil after loading it
  (evil-mode 1)

  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode))

  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode))

  (use-package evil-indent-textobject
    :ensure t)

  ;; example how to map a command in normal mode (called 'normal state' in evil)
  (define-key evil-normal-state-map (kbd ", w") 'evil-window-vsplit))

;; load projectile
(use-package projectile
  :ensure t
  :defer t
  :config
  (projectile-global-mode))

; Connect up helm and projectile
(use-package helm-projectile
  :bind (("C-S-P" . helm-projectile-switch-project)
         :map evil-normal-state-map
         ("C-p" . helm-projectile))
  :ensure t
  :config
  (evil-leader/set-key
    "ps" 'helm-projectile
    "pa" 'helm-projectile-find-file-in-known-projects
    "pp" 'helm-projectile-switch-project
    "a" 'helm-projectile-ag
  ))

(require 'helm-projectile)


(use-package org
  :ensure t)

(use-package zenburn-theme
  :ensure t
  :config
  (load-theme 'zenburn t))

;; (use-package evil-tabs
;;   :ensure evil-tabs
;;   :config
;;   (global-evil-tabs-mode t))

(use-package cmake-mode
  :ensure t)

(use-package magit
  :ensure t)

(use-package evil-magit
  :ensure t)

(use-package flycheck
 :ensure t
 :config
 (progn
  (global-flycheck-mode)))

(setq flycheck-disabled-checkers '(emacs-lisp-checkdoc))

;; (use-package rtags
;;   :ensure t)

(use-package company
  :ensure t
  :config
  (progn
    (add-hook 'after-init-hook 'global-company-mode)
    (global-set-key (kbd "M-/") 'company-complete-common-or-cycle)
    (setq company-idle-delay 0)))

;; (use-package company-rtags
;;   :ensure t
;;   :config
;;   (progn
;;     (setq rtags-autostart-diagnostics t)
;;     (rtags-diagnostics)
;;     (setq rtags-completions-enabled t)
;;     (push 'company-rtags company-backends)
;;   ))

;; ;; Live code checking.
;; (use-package flycheck-rtags
;;   :ensure t
;;   :config
;;   (progn
;;     ;; ensure that we use only rtags checking
;;     ;; https://github.com/Andersbakken/rtags#optional-1
;;     (defun setup-flycheck-rtags ()
;;       (flycheck-select-checker 'rtags)
;;       (setq-local flycheck-highlighting-mode nil) ;; RTags creates more accurate overlays.
;;       (setq-local flycheck-check-syntax-automatically nil)
;;       (rtags-set-periodic-reparse-timeout 2.0)  ;; Run flycheck 2 seconds after being idle.
;;       )
;;     (add-hook 'c-mode-hook #'setup-flycheck-rtags)
;;     (add-hook 'c++-mode-hook #'setup-flycheck-rtags)
;;     ))

;; (use-package cmake-ide
;;   :ensure t)

;; (require 'rtags)
;; (cmake-ide-setup)

(evil-leader/set-key
    "rt" 'rtags-find-symbol-at-point
    "rd" 'rtags-display-summary
    "rr" 'rtags-find-references
    ;; "b" 'helm-buffers-list
)

(use-package evil-collection
  :after (evil helm helm-projectile)
  :init
  (setq evil-collection-setup-minibuffer t)
  :ensure t
  :config
  (evil-collection-init))

(use-package lsp-mode
  :ensure t
  :commands lsp)
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)
(use-package company-lsp
  :ensure t
  :commands company-lsp)

(setq ccls-executable "/usr/local/bin/ccls")
(use-package ccls
  :ensure t
  :hook ((c-mode c++-mode objc-mode) .
         (lambda () (require 'ccls) (lsp))))



;; Full screen by Default
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; Evil Changes
(evil-leader/set-leader "<SPC>")
(setq evil-leader/in-all-states t)

;; UI Changes
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Fonts
(set-face-attribute 'default nil
                    :family "Hack"
                    :height 120)
                    ;; :weight 'normal
                    ;; :width 'normal)

;; File Type Definitions
(add-to-list 'auto-mode-alist '("\\.launch\\'" . xml-mode)) ; ROS launch files are xml
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode)) ; Assume headers are c++


;; 4 spaces by default and don't indent within namespaces
(defconst my-cc-style
  '("linux"
    (c-basic-offset . 4)))
(c-add-style "my-cc-mode" my-cc-style)
(setq c-default-style "my-cc-mode")
(c-set-offset 'innamespace 0)

;; Show matching parens
(show-paren-mode 1)

;; Don't litter directories with temporary save files
(setq backup-directory-alist '(("." ."~/.emacs.d/saves/")))

;; Open up my user configuration
(defun er-find-user-init-file ()
  "Edit the `user-init-file', in another window."
  (interactive)
  (find-file user-init-file))

(evil-leader/set-key
  "fc" 'er-find-user-init-file
  "fo" 'projectile-find-other-file
  "mc" 'projectile-compile-project
  "mr" 'recompile
  "bb" 'helm-buffers-list
  "bd" 'kill-buffer
  "wh" 'evil-window-left
  "wl" 'evil-window-right
  "wk" 'evil-window-top
  "wj" 'evil-window-bottom
  "ww" 'delete-other-windows
  )

;; Modify whole word when it has underscores in it
(with-eval-after-load 'evil
    (defalias #'forward-evil-word #'forward-evil-symbol))

;; Assume build directory is build/
;; ((nil . ((cmake-ide-dir . "build"))))

;; Apparently this can be faster if stuck with zsh only?
;; (setq shell-file-name "/bin/bash")
;; Caching helps a ton with fuzzy finding files
(setq projectile-enable-caching t)

;; Don't write out customizations to this file, throw them into another
(setq custom-file "~/.emacs.d/custom.el")

(add-to-list 'exec-path "/usr/local/bin/")

(provide 'init)
;;; init.el ends here

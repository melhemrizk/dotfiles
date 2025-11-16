;; ######## ##     ##    ###     ######   ######
;; ##       ###   ###   ## ##   ##    ## ##    ##
;; ##       #### ####  ##   ##  ##       ##
;; ######   ## ### ## ##     ## ##        ######
;; ##       ##     ## ######### ##             ##
;; ##       ##     ## ##     ## ##    ## ##    ##
;; ######## ##     ## ##     ##  ######   ######


;;; package --- summary
;; Emacs configuration
;;; Commentary:


;;; Code:

;; Custom file
(setq custom-file "~/.emacs.d/gnu-emacs-custom")
(load custom-file t)

;; Initialize package sources
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; Install use-package if not already installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; UI tweaks
(use-package catppuccin-theme
  :config
  (setq catppuccin-flavor 'mocha)
  (load-theme 'catppuccin t))

(tool-bar-mode -1)                    ;; Disable the tool bar.
(menu-bar-mode -1)                    ;; Disable the menu bar.
(scroll-bar-mode 1)                   ;; Keep the scroll bar. To disable change the value to 0 or -1.
(column-number-mode 1)                ;; Show column number. The cloumn number is shown in the mode line.
(global-display-line-numbers-mode 1)  ;; Show line numbers.
(electric-pair-mode 1)                ;; Auto close brakets, braces, quotes and parentheses.
(show-paren-mode 1)                   ;; Highlight the pairs of parentheses.

;; Font
(add-to-list 'default-frame-alist '(font . "Source Code Pro Light-20"))

;; Auto-save and backup settings
(setq auto-save-visited-mode t
      backup-by-copying t
      backup-directory-alist '(("." . "~/.emacs.d/.backup"))
      delete-old-versions t
      kept-new-versions 3
      kept-old-versions 2
      version-control t
      initial-scratch-message "")

;; Ido mode
(ido-mode 1)
(ido-everywhere 1)

;; Multiple cursors
(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)
         ("C-\"" . mc/skip-to-next-like-this)
         ("C-:" . mc/skip-to-previous-like-this)))

;; Duplicate line function
(defun duplicate-line ()
  "Duplicate current line."
  (interactive)
  (let ((column (- (point) (line-beginning-position)))
        (line (buffer-substring (line-beginning-position) (line-end-position))))
    (move-end-of-line 1)
    (newline)
    (insert line)
    (move-beginning-of-line 1)
    (forward-char column)))
(global-set-key (kbd "C-,") 'duplicate-line)

;; LSP mode setup
(use-package lsp-mode
  :ensure t
  :hook ((go-mode . lsp-deferred))
  :commands lsp lsp-deferred
  :config
  (setq lsp-gopls-server-path "gopls")  ;; Ensure this path is correct.
  (setq lsp-go-link-target "godoc")
  (setq lsp-go-use-placeholders t)
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\vendor\\'")
  (setq lsp-gopls-staticcheck t
	lsp-eldoc-render-all t
	lsp-gopls-complete-unimported t)
  (lsp-register-custom-settings
   '(("gopls.completeUnimported" t t)
     ("gopls.staticcheck" t t)))
  (setq lsp-auto-guess-root t))         ;; This helps with project root detection.

;; Function to run Go files
(defun go-run-file ()
  "Run the current Go file using 'go run <filename>'."
  (interactive)
  (let ((compile-command (concat "go run " buffer-file-name)))
    (compile compile-command)))

;; Go mode setup
(use-package go-mode
  :ensure t
  :mode ("\\.go\\'" . go-mode)
  :hook ((go-mode . lsp-deferred)
         (go-mode . company-mode))
  :config
  (require 'lsp-go)
  :bind (:map go-mode-map
         ("C-c C-j" . lsp-find-definition)
         ("C-c C-d" . lsp-describe-thing-at-point)
         ("C-c C-r" . go-run-file)))


 (setq gc-cons-threshold 10000000)
 (setq read-process-output-max (* 128 1024))
 (defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t)
  (add-hook 'go-mode-hook #'lsp-go-install-save-hooks))

;; Company setup
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0
        company-minimum-prefix-length 1))

;; LSP UI customization
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-enable t
        lsp-ui-peek-enable t
        lsp-ui-sideline-enable t
        lsp-ui-imenu-enable t
        lsp-ui-flycheck-enable t))

(use-package colorful-mode
  :ensure t
  :config
  (global-colorful-mode 1)
  (setq colorful-allow-mouse-clicks t))

(provide '.emacs)
;;; .emacs ends here


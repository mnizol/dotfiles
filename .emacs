;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Org-mode options
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode)) ; Associate .org files with org-mode
(global-font-lock-mode 1)    ; turn on syntax highlighting for all buffers
(setq org-separator-lines 1) ; single blank line can separate headings

(setq org-insert-heading-respect-content t)
(setq org-M-RET-may-split-line nil)

;(setq org-startup-indented t)

; Mimic cleanview
(setq org-odd-levels-only t)
(setq org-hide-leading-stars t)

; Line spacing
(setq-default line-spacing 4)

; Subtree movement
(define-key org-mode-map [(meta up)]    'org-move-subtree-up)
(define-key org-mode-map [(meta down)]  'org-move-subtree-down)
(define-key org-mode-map [(meta left)]  'org-promote-subtree)
(define-key org-mode-map [(meta right)] 'org-demote-subtree)

; Hoist (Move subtree to indirect buffer in new window)
(setq org-indirect-buffer-display 'new-frame)
(global-set-key "\M-h" 'org-tree-to-indirect-buffer)

; Quit Frame (kill buffer and close frame)
(define-key org-mode-map "\C-q" (lambda () (interactive) (kill-buffer) (delete-frame)))

(add-hook 'org-mode-hook 'visual-line-mode)

(setq org-link-abbrev-alist
  '(("wiki"  . "./%s.org"))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LaTex
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
;(setq TeX-save-query nil)
(setq TeX-PDF-mode t)

; Latex previewer
(load "auctex.el" nil t t)
(require 'tex-mik)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'LaTex-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Backup Options
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq backup-by-copying t)      ; don't clobber symlinks
(setq delete-old-versions t)
(setq kept-new-versions 5)
(setq kept-old-versions 0)
(setq version-control t)       ; use versioned backups

; Place all backups in one directory
(setq backup-directory-alist `(("." . ,"~/.emacs-backups ")))  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Diary / Calendar Options
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq calendar-mark-diary-entries-flag t) ; mark dates in calendar that have diary entries
;(add-hook 'emacs-startup-hook 'calendar)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Miscellaneous Options
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq inhibit-startup-screen t)
(setq truncate-lines t) ; don't do line-wrapping
(global-set-key "\C-z"  'undo) ; Windows-like undo

; Markdown mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

; JSON mode
(add-to-list 'auto-mode-alist '("\\.json\\'" . js-mode))

(setq frame-title-format "%b - emacs")
(setq-default ispell-program-name "aspell")


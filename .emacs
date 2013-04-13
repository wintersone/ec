;; elpa package settings

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(add-to-list 'load-path "~/.emacs.d/elpa")
(add-to-list 'load-path "~/.emacs.d/elpa/color-theme-solarized-20130307.1350")
(add-to-list 'load-path "~/.emacs.d/elpa/session-20120511.0")
(add-to-list 'load-path "~/.emacs.d/elpa/browse-kill-ring-20130123.2228")
(add-to-list 'load-path "~/.emacs.d/elpa/swbuff")



(require 'solarized-dark-theme)
(set-frame-font "Menlo-16")
(setenv "PATH" (concat "/usr/texbin:/usr/local/bin:" (getenv "PATH")))
(setq exec-path (append '("/usr/texbin" "/usr/local/bin") exec-path))

;=========Simple Configuration==========
(setq visible-bell t)
(setq inhibit-startup-message t)
(setq column-number-mode t) 
(setq mouse-yank-at-point t)
(setq kill-ring-max 200)
(setq default-fill- 60)
(setq enable-recursive-minibuffers t)
(setq scroll-margin 3
      scroll-conservatively 10000)
(setq default-major-mode 'text-mode)
(show-paren-mode t)
(setq show-paren-style 'parentheses)
(mouse-avoidance-mode 'animate)
(setq frame-title-format "emacs@%b")
(auto-image-file-mode)
(global-font-lock-mode t)

(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)

(setq version-control t)
(setq kept-new-versions 3)
(setq delete-old-versions t)
(setq kept-old-versions 2)
(setq dired-kept-versions 1)


(mapcar
 (function (lambda (setting)
	     (setq auto-mode-alist
		   (cons setting auto-mode-alist))))
 '(("\\.xml$".  sgml-mode)
   ("\\\.bash" . sh-mode)
   ("\\.rdf$".  sgml-mode)
   ("\\.session" . emacs-lisp-mode)
   ("\\.l$" . c-mode)
   ("\\.css$" . css-mode)
   ("\\.cfm$" . html-mode)
   ("gnus" . emacs-lisp-mode)
   ("\\.idl$" . idl-mode)))

(setq user-full-name "Huang Huan")
(setq user-mail-address "wintersone@gmail.com")

(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)
;=======================================

;===============for mac================
;(setq mac-command-modifier 'meta)
;(setq mac-option-modifier 'control)
;======================================
;=============Prevent Tab indent========
;(setq-default indent-tabs-mode nil)
;(setq default-tab-width 8)
;(setq tab-stop-list ())
;(loop for x downfrom 40 to 1 do
;      (setq tab-stop-list (cons (* x 4) tab-stop-list)))

;==========识别中文标点=================
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)
;=====================================

;=======Save Global Variables========
(require 'session)
  (add-hook 'after-init-hook 'session-initialize)
;====================================


;=============desktop===============
(load "desktop") 
(desktop-load-default) 
(desktop-read)
(setq server-socket-dir (format "/tmp/emacs%d" (user-uid)))
;===================================

;===============browse kill ring====
(require 'browse-kill-ring)
(global-set-key [(control c)(k)] 'browse-kill-ring)
(browse-kill-ring-default-keybindings)
;==================================

;=============ido mode=============
(require 'ido)
(ido-mode t)

;=================================

(require 'swbuff)
(global-set-key (kbd "") 'swbuff-switch-to-previous-buffer)
(global-set-key (kbd "") 'swbuff-switch-to-next-buffer)
(setq swbuff-exclude-buffer-regexps 
     '("^ " "\\*.*\\*"))

(setq swbuff-status-window-layout 'scroll)
(setq swbuff-clear-delay 1)
(setq swbuff-separator "|")
(setq swbuff-window-min-text-height 1)

;================copy from wy=====================
(defun wy-go-to-char (n char)
  "Move forward to Nth occurence of CHAR.
Typing `wy-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (search-forward (string char) nil nil n)
  (while (char-equal (read-char)
		          char)
    (search-forward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))

;(define-key global-map "\M-ca" 'wy-go-to-char)
;================================================


;================括号匹配========================
(global-set-key "%" 'match-paren)
          
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))
;=============================================

;========fullscreen toggle=========
(global-set-key [f11] 'ns-toggle-fullscreen)
;=================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes (quote ("54d1bcf3fcf758af4812f98eb53b5d767f897442753e1aa468cfeb221f8734f9" "485737acc3bedc0318a567f1c0f5e7ed2dfde3fb" default)))
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;=======outline
(setq outline-minor-mode-prefix [(control o)])

;======org-mode=====
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-agenda-files (list "~/work.org"))
;;
;; Standard key bindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(add-hook 'message-mode-hook 'orgstruct++-mode 'append)
(add-hook 'message-mode-hook 'turn-on-auto-fill 'append)
(add-hook 'message-mode-hook 'bbdb-define-all-aliases 'append)
(add-hook 'message-mode-hook 'orgtbl-mode 'append)
(add-hook 'message-mode-hook 'turn-on-flyspell 'append)
(add-hook 'message-mode-hook
          '(lambda () (setq fill-column 72))
          'append)
(add-hook 'message-mode-hook
          '(lambda () (local-set-key (kbd "C-c M-o") 'org-mime-htmlize))
          'append)

;; flyspell mode for spell checking everywhere
(add-hook 'org-mode-hook 'turn-on-flyspell 'append)

;; Disable C-c [ and C-c ] in org-mode
(add-hook 'org-mode-hook
          (lambda ()
            ;; Undefine C-c [ and C-c ] since this breaks my
            ;; org-agenda files when directories are include It
            ;; expands the files in the directories individually
            (org-defkey org-mode-map "\C-c["    'undefined)
            (org-defkey org-mode-map "\C-c]"    'undefined))
          'append)

(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c M-o") 'bh/mail-subtree))
          'append)

(defun bh/mail-subtree ()
  (interactive)
  (org-mark-subtree)
  (org-mime-subtree))

;; Enable abbrev-mode
(add-hook 'org-mode-hook (lambda () (abbrev-mode 1)))
;===============ido config=============
;;{{{ ido: fast switch buffers

(add-hook 'ido-define-mode-map-hook 'ido-my-keys)

(defun ido-my-keys ()
  "Set up the keymap for `ido'."

  ;; common keys
  (define-key ido-mode-map "\C-e" 'ido-edit-input)   
  (define-key ido-mode-map "\t" 'ido-complete) ;; complete partial
  (define-key ido-mode-map "\C-j" 'ido-select-text)
  (define-key ido-mode-map "\C-m" 'ido-exit-minibuffer)
  (define-key ido-mode-map "?" 'ido-completion-help) ;; list completions
  (define-key ido-mode-map [(control ? )] 'ido-restrict-to-matches)
  (define-key ido-mode-map [(control ?@)] 'ido-restrict-to-matches)

  ;; cycle through matches
  (define-key ido-mode-map "\C-r" 'ido-prev-match)
  (define-key ido-mode-map "\C-s" 'ido-next-match)
  (define-key ido-mode-map [right] 'ido-next-match)
  (define-key ido-mode-map [left] 'ido-prev-match)

  ;; toggles
  (define-key ido-mode-map "\C-t" 'ido-toggle-regexp) ;; same as in isearch
  (define-key ido-mode-map "\C-p" 'ido-toggle-prefix)
  (define-key ido-mode-map "\C-c" 'ido-toggle-case)
  (define-key ido-mode-map "\C-a" 'ido-toggle-ignore)

  ;; keys used in file and dir environment
  (when (memq ido-cur-item '(file dir))
    (define-key ido-mode-map "\C-b" 'ido-enter-switch-buffer)
    (define-key ido-mode-map "\C-d" 'ido-enter-dired)
    (define-key ido-mode-map "\C-f" 'ido-fallback-command)

    ;; cycle among directories
    ;; use [left] and [right] for matching files
    (define-key ido-mode-map [down] 'ido-next-match-dir)
    (define-key ido-mode-map [up]   'ido-prev-match-dir)

    ;; backspace functions
    (define-key ido-mode-map [backspace] 'ido-delete-backward-updir)
    (define-key ido-mode-map "\d"        'ido-delete-backward-updir)
    (define-key ido-mode-map [(meta backspace)] 'ido-delete-backward-word-updir)
    (define-key ido-mode-map [(control backspace)] 'ido-up-directory)

    ;; I can't understand this
    (define-key ido-mode-map [(meta ?d)] 'ido-wide-find-dir)
    (define-key ido-mode-map [(meta ?f)] 'ido-wide-find-file)
    (define-key ido-mode-map [(meta ?k)] 'ido-forget-work-directory)
    (define-key ido-mode-map [(meta ?m)] 'ido-make-directory)

    (define-key ido-mode-map [(meta down)] 'ido-next-work-directory)
    (define-key ido-mode-map [(meta up)] 'ido-prev-work-directory)
    (define-key ido-mode-map [(meta left)] 'ido-prev-work-file)
    (define-key ido-mode-map [(meta right)] 'ido-next-work-file)

    ;; search in the directories
    ;; use C-_ to undo this
    (define-key ido-mode-map [(meta ?s)] 'ido-merge-work-directories)
    (define-key ido-mode-map [(control ?\_)] 'ido-undo-merge-work-directory)
    )

  (when (eq ido-cur-item 'file)
    (define-key ido-mode-map "\C-k" 'ido-delete-file-at-head)
    (define-key ido-mode-map "\C-l" 'ido-toggle-literal)
    (define-key ido-mode-map "\C-o" 'ido-copy-current-word)
    (define-key ido-mode-map "\C-v" 'ido-toggle-vc)
    (define-key ido-mode-map "\C-w" 'ido-copy-current-file-name)
    )

  (when (eq ido-cur-item 'buffer)
    (define-key ido-mode-map "\C-b" 'ido-fallback-command)
    (define-key ido-mode-map "\C-f" 'ido-enter-find-file)
    (define-key ido-mode-map "\C-k" 'ido-kill-buffer-at-head)
    ))

(ido-mode t)

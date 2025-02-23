;; use-package is available from 29+ otherwise (package-install 'use-package)
(require 'package) ;; this always get the latest version (elpaca builds from git and helps with versioning)
  (package-initialize)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; move the changed provided from customize to a separate file from init.el
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file :no-error-if-file-is-missing)

;; Modified from Prot: https://protesilaos.com/codelog/2025-01-16-emacs-org-todo-agenda-basics/
;; These are the defaults we want to change.  We do so in the
;; following `use-package' declaration.
;; (setq org-M-RET-may-split-line '((default . t)))
;; (setq org-insert-heading-respect-content nil)
;; (setq org-log-done nil)
;; (setq org-log-into-drawer nil)


(use-package org
  :ensure nil ; do not try to install it as it is built-in
  :config
  (setq org-M-RET-may-split-line '((default . nil)))
  (setq org-insert-heading-respect-content t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)

  ;; permit the use or #+ATTR_ORG: :width
  (setq org-image-actual-width nil)
  ;; show images always
  (setq org-startup-with-inline-images t)

  (setq org-directory "~/org/agenda")
  (setq org-agenda-files (directory-files-recursively org-directory "\\.org$"))

  ;; Learn about the ! and more by reading the relevant section of the
  ;; Org manual.  Evaluate: (info "(org) Tracking TODO state changes")
  (setq org-todo-keywords
        '((sequence "TODO(t)" "WAIT(w!)" "|" "CANCEL(c!)" "DONE(d!)"))))

;; A few more useful configurations...
(use-package emacs
  :custom
  ;; Support opening new minibuffers from inside existing minibuffers.
  (enable-recursive-minibuffers t)
  ;; Hide commands in M-x which do not work in the current mode.  Vertico
  ;; commands are hidden in normal buffers. This setting is useful beyond
  ;; Vertico.
  (read-extended-command-predicate #'command-completion-default-include-p)

  :init
  ;; set a larger fringe
  (fringe-mode 12)
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode))

;; set theme colors
;; (use-package spacemacs-theme
;;   :ensure t
;;   :config (load-theme 'spacemacs-dark t))

(use-package modus-themes
    :ensure nil
    :config (load-theme 'modus-vivendi-tinted t))

;; give a bit of space from the sides to make things more readable
(use-package spacious-padding
  :ensure t
  :if (display-graphic-p)
  :config
  (spacious-padding-mode 1))

(let ((mono-spaced-font "Monospace")
      (proportionately-spaced-font "Sans"))
  (set-face-attribute 'default nil :family mono-spaced-font :height 150)
  (set-face-attribute 'fixed-pitch nil :family mono-spaced-font :height 1.0)
  (set-face-attribute 'variable-pitch nil :family proportionately-spaced-font :height 1.0))

(use-package dired
  :ensure nil
  :commands (dired)
  :hook
  ((dired-mode . dired-hide-details-mode)
   (dired-mode . hl-line-mode))
  :config
  (setq dired-recursive-copies 'always)
  (setq dired-recursive-deletes 'always)
  (setq delete-by-moving-to-trash t)
  (setq dired-dwim-target t))

(use-package dired-subtree
  :ensure t
  :after dired
  :bind
  ( :map dired-mode-map
    ("<tab>" . dired-subtree-toggle)
    ("TAB" . dired-subtree-toggle)
    ("<backtab>" . dired-subtree-remove)
    ("S-TAB" . dired-subtree-remove))
  :config
  (setq dired-subtree-use-backgrounds nil))

;; Get spellchecking everywhere
(use-package flyspell
  :ensure nil
  :hook ((text-mode . flyspell-mode)
         (prog-mode . flyspell-prog-mode)))

;; enable helper for keybindings
(use-package which-key
    :ensure nil
    :config
    (which-key-mode))  ;; Enable which-key mode

(use-package rainbow-delimiters 
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

;; show numberlines everywhere
(global-display-line-numbers-mode t)

;; (use-package delsel
;;   :ensure nil ; no need to install it as it is built-in
;;   :hook (after-init . delete-selection-mode))

(defun prot/keyboard-quit-dwim ()
  "Do-What-I-Mean behaviour for a general `keyboard-quit'.

The generic `keyboard-quit' does not do the expected thing when
the minibuffer is open.  Whereas we want it to close the
minibuffer, even without explicitly focusing it.

The DWIM behaviour of this command is as follows:

- When the region is active, disable it.
- When a minibuffer is open, but not focused, close the minibuffer.
- When the Completions buffer is selected, close it.
- In every other case use the regular `keyboard-quit'."
  (interactive)
  (cond
   ((region-active-p)
    (keyboard-quit))
   ((derived-mode-p 'completion-list-mode)
    (delete-completion-window))
   ((> (minibuffer-depth) 0)
    (abort-recursive-edit))
   (t
    (keyboard-quit))))

(define-key global-map (kbd "C-g") #'prot/keyboard-quit-dwim)

(use-package savehist
  :ensure nil ; it is built-in
  :hook (after-init . savehist-mode))

(use-package nerd-icons
  :ensure t)

(use-package nerd-icons-completion
  :ensure t
  :after marginalia
  :config
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))

(use-package nerd-icons-corfu
  :ensure t
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package nerd-icons-dired
  :ensure t
  :hook
  (dired-mode . nerd-icons-dired-mode))

;; Display a counter showing the number of the current and the other
;; matches.  Place it before the prompt, though it can be after it.
(setq isearch-lazy-count t)
(setq lazy-count-prefix-format "(%s/%s) ")
(setq lazy-count-suffix-format nil)

;; Make regular Isearch interpret the empty space as a regular
;; expression that matches any character between the words you give
;; it.
(setq search-whitespace-regexp ".*?")

(use-package vertico
  :ensure t
  :custom
     ;; (vertico-scroll-margin 0) ;; Different scroll margin
     ;; (vertico-count 20) ;; Show more candidates
     ;; (vertico-resize t) ;; Grow and shrink the Vertico minibuffer
  (vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
  :config (vertico-mode 1)) ;; it is a minor-mode and it enabled with 1

(use-package marginalia
  :ensure t
  :config (marginalia-mode 1)) ;; it is a minor mode

(use-package consult
  :ensure t
  :bind
  ( :map global-map
    ("M-g M-g" . consult-goto-line)))

(use-package orderless
    :ensure t
    :config
    ;;(setq orderless-matching-styles '(orderless-prefixes orderless-regexp orderless-flex))
    (setq completion-styles '(orderless basic))
    (setq completion-category-overrides '((file (styles basic partial-completion))))
    (setq completion-category-default nil))

;; From Prot will need to understand
    ;;; Corfu (in-buffer completion popup)

(use-package corfu
  :ensure t
  :hook (after-init . global-corfu-mode)
  :bind (:map corfu-map ("<tab>" . corfu-complete))
  :config
  (setq tab-always-indent 'complete)
  (setq corfu-preview-current nil)
  (setq corfu-min-width 20)

  (setq corfu-popupinfo-delay '(1.25 . 0.5))
  (corfu-popupinfo-mode 1) ; shows documentation after `corfu-popupinfo-delay'

  ;; Sort by input history (no need to modify `corfu-sort-function').
  (with-eval-after-load 'savehist
    (corfu-history-mode 1)
    (add-to-list 'savehist-additional-variables 'corfu-history)))

;; use-package with package.el:
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  :custom
  (dashboard-startup-banner 'logo)
  (dashboard-banner-logo-title nil)
  (dashboard-center-content t)
  (dashboard-icon-type 'nerd-icons)
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons t)
  (dashboard-set-footer nil)
  (dashboard-projects-backend 'project-el)
  (dashboard-display-icons-p t)
  (dashboard-items '(
                     (recents . 10)
                     (agenda . 10)
                     (projects . 5)
                     (bookmarks . 10)
                     (registers . 5)
                     )))

;; Emacs Multimedia System
(use-package emms
  :ensure t
  :config
  (require 'emms-setup)
  (require 'emms-mpris)
  (emms-all)
  (emms-default-players)
  (emms-mpris-enable)
  (setq emms-player-list '(emms-player-vlc emms-player-mpv))
  :custom
  (emms-browser-covers #'emms-browser-cache-thumbnail-async)
  :bind
  (("C-c w m b" . emms-browser)
   ("C-c w m e" . emms)
   ("C-c w m p" . emms-play-playlist )
   ("<XF86AudioPrev>" . emms-previous)
   ("<XF86AudioNext>" . emms-next)
   ("<XF86AudioPlay>" . emms-pause)))

;; https://www.reddit.com/r/emacs/comments/qg2d0k/emms_modeline_shows_full_path_to_the_songs_i_only/
;; EMMS puts too much garbage about the song in the modeline, this reduces it
(defun track-title-from-file-name (file)
  "For using with EMMS description functions. Extracts the track
title from the file name FILE, which just means a) taking only
the file component at the end of the path, and b) removing any
file extension."
  (with-temp-buffer
    (save-excursion (insert (file-name-nondirectory (directory-file-name file))))
    (ignore-error 'search-failed
      (search-forward-regexp (rx "." (+ alnum) eol))
      (delete-region (match-beginning 0) (match-end 0)))
    (buffer-string)))

(defun my-emms-track-description (track)
  "Return a description of TRACK, for EMMS, but try to cut just
the track name from the file name, and just use the file name too
rather than the whole path."
  (let ((artist (emms-track-get track 'info-artist))
        (title (emms-track-get track 'info-title)))
    (cond ((and artist title)
           ;; Converting the artist/title to a string works around a bug in `emms-info-exiftool'
           ;; where, if your track name is a number, e.g. "1999" by Jeroen Tel, then it will be an
           ;; integer type here, confusing everything.
           ;;
           ;; I would fix the bug properly and submit a patch but I just cannot be bothered to
           ;; figure out how to do that.
           (concat (format "%s" artist) " - " (format "%s" title)))
          (title title)
          ((eq (emms-track-type track) 'file)
           (track-title-from-file-name (emms-track-name track)))
          (t (emms-track-simple-description track)))))

(setq emms-track-description-function 'my-emms-track-description)

;; Install pyenv and set the path to the venv python when activated
(use-package pyvenv
  :ensure t
  :hook (python-mode . pyvenv-mode)
  :config
  (setq pyvenv-post-activate-hooks
        (list (lambda ()
                (setq python-shell-interpreter
                      (concat pyvenv-virtual-env "bin/python"))))))


;; trash from chatgpt
(defvar pyenv-mode-line-string "" "String to display pyenv version in the mode-line.")

(defun update-pyenv-mode-line ()
  "Update the pyenv version displayed in the mode-line."
  (setq pyenv-mode-line-string
        (format " [pyenv: %s] " (or (getenv "PYENV_VERSION") "system")))
  (force-mode-line-update))

(define-minor-mode pyenv-mode
  "Minor mode to show pyenv version in the mode-line."
  :global t
  :lighter (:eval pyenv-mode-line-string))

;; Enable the minor mode
(pyenv-mode -1)

;; Automatically update when pyenv is changed (e.g., in shell buffers)
(add-hook 'post-command-hook #'update-pyenv-mode-line)

;; add ruff calls: requires pip install ruff
(use-package lazy-ruff
  :ensure t
  :bind (("C-c f" . lazy-ruff-lint-format-dwim)) ;; keybinding
  :config
  (lazy-ruff-global-mode t)) ;; Enable the lazy-ruff minor mode globally

(fringe-mode 12)
(use-package flymake
  :ensure nil
  :bind (:map flymake-mode-map
          ("M-n" . flymake-goto-next-error)
          ("M-p" . flymake-goto-prev-error)))

(use-package yaml-mode
:ensure t)

(use-package eglot
  :ensure nil
  :hook
  (python-base-mode-hook . eglot-ensure))

;; I have to test if this is really necessary, but i was getting errors
;;(setq xref-backend-functions '(eglot-xref-backend))

(setq modus-vivendi-tinted-palette-overrides
        '((bg-main          "#444444") ;; main background
          (fg-main          "#cccccc") ;; main font
          (bg-dim           "#333333") ;; used in code section of orgmode
          (fg-dim           "#888888") ;; subtle font like orgmode title
          (fg-alt           yellow-intense)
          (bg-active        "#c9b9b0")
          (bg-inactive      "#dfd5cf")
          (border           "#9f9690")

          (keyword blue-intense)
          (cursor magenta-intense)
          (builtin magenta-warmer)
          (comment fg-dim)
          (constant blue-cooler)
          (docstring green-faint)
          (fnname magenta)
          (string blue)
          (fg-active-value yellow)
          (Type yellow)
          (accent-2 yellow)
          (fg-prompt yellow)
          (fg-prose-code yellow)

          (fg-heading-0 magenta-intense) ;; orgmode title
          (fg-heading-1 "#EE7700") ;; orgmode headings
          (fg-heading-2 "#FFA500")
          (fg-heading-3 "#FFDD33")
          (fg-heading-4 "#FFCC55")
          (fg-heading-5 "#FFEE66")
          (fg-heading-6 "#FFFF88")
          (fg-heading-7 "#FFFFAA")
          (fg-heading-8 "#FFFFCC")

          ;; mode line colors
          (fg-mode-line-active fg-main)
          (bg-mode-line-active bg-main)
          (fg-mode-line-inactive fg-dim)
          (bg-mode-line-inactive bg-main)

          ;; line-number colors
          (fg-line-number-active fg-main)
          (bg-line-number-active bg-main)

          ;; (fg-heading-1 "#9B0066") ;; dark intense magenta
          ;; (fg-heading-2 "#D100B7") ;; dark magenta
          ;; (fg-heading-3 "#E600D9") ;; vibrant magenta
          ;; (fg-heading-4 "#F200E6") ;; bright magenta
          ;; (fg-heading-5 "#F733F2") ;; light magenta
          ;; (fg-heading-6 "#F985F6") ;; pale magenta
          ;; (fg-heading-7 "#F6A8F6") ;; very pale magenta
          ;; (fg-heading-8 "#FAD0FA") ;; extremely light magenta

          (info yellow)
          ))
(use-package modus-themes
     :ensure t
     :config (load-theme 'modus-vivendi-tinted t))

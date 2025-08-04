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
(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))


(use-package org
  :ensure nil ; do not try to install it as it is built-in
  :config
  (setq org-M-RET-may-split-line '((default . nil)))
  (setq org-insert-heading-respect-content t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)
  (setq org-ellipsis " ") ; a downward triangle


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

  ;; keep all ~ and #_# files in one location
  (backup-directory-alist `(("." . ,(expand-file-name "~/.emacs-backups"))))
  (auto-save-file-name-transforms
    `((".*" ,(expand-file-name "~/.emacs-backups") t)))
  :init
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
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; add the line numbers for programming only
  (add-hook 'prog-mode-hook #'display-line-numbers-mode))

;; set theme colors
(use-package modus-themes
  :ensure t
  :config
  ;; configure the theme color and behavior

  ;; set fonts constructs
  (setq modus-themes-italic-constructs t
        modus-themes-bold-constructs t
        modus-themes-mixed-fonts t
        modus-themes-variable-pitch-ui t
        modus-themes-custom-auto-reload t
        modus-themes-disable-other-themes t)

  ;; configure sizing of orgmode headings
  (setq modus-themes-headings
        '((1 . (variable-pitch 1.4))
          (2 . (1.3))
          (3 . (1.2))
          (4 . (1.1))
          (agenda-date . (1.3))
          (agenda-structure . (variable-pitch light 1.3))
          (t . (1.1))))
  
  (setq modus-vivendi-tinted-palette-overrides
        '(
      ;;; These base if for dark themes - changing to light it will need mapping changes
      ;;; especially because of the grays 

      ;;; Basic values

      	  ;; Red Tones
      	  (red                        "#FF5A6A")
      	  (red-warmer                 "#F95353")
      	  (red-cooler                 "#FF7C7C")
      	  (red-faint                  "#FF8F98")
      	  (red-intense                "#F04656")
      	  (bg-red                     "#7A3F3C") 
      	  (bg-red-intense             "#B73C48")
      	  (bg-red-subtle              "#D78177")
      	  (bg-red-nuanced             "#D16E6A")
      	  (bg-red-faint               "#8F2D38") 
      	  (bg-red-refine              "#9C5F5C") 

      	  
      	  ;; Green Tones
      	  (green                      "#6BBF7E") 
      	  (green-warmer               "#87C7A2") 
      	  (green-cooler               "#4DAF6F") 
      	  (green-faint                "#75C9A6") 
      	  (green-intense              "#58C07F") 
      	  (bg-green                   "#3A5A47") 
      	  (bg-green-intense           "#6C9B60") 
      	  (bg-green-subtle            "#68C09D") 
      	  (bg-green-nuanced           "#6AB890") 
      	  (bg-green-faint             "#4F7A47") 
      	  (bg-green-refine            "#4E7B74") 


      	  ;; Yellow Tones             
      	  (yellow                     "#F1A92D")
      	  (yellow-warmer              "#F7A323")
      	  (yellow-cooler              "#F7A94D")
      	  (yellow-faint               "#F1B97A")
      	  (yellow-intense             "#FFBC40")
      	  (bg-yellow                  "#7A4E1F")
      	  (bg-yellow-intense          "#9F5E13")
      	  (bg-yellow-subtle           "#B67B3F")
      	  (bg-yellow-nuanced          "#B06D1C")
      	  (bg-yellow-faint            "#7A450F")
      	  (bg-yellow-refine           "#7C6032")



      	  ;; Blue Tones               
      	  (blue                       "#7DA0C4")
      	  (blue-warmer                "#6188B3")
      	  (blue-cooler                "#6DB5C2")
      	  (blue-faint                 "#A4C4D3")
      	  (blue-intense               "#577DA3")
    	          (bg-blue-intense            "#2A3F59")
    	          (bg-blue-subtle             "#5C7B85")
    	          (bg-blue-nuanced            "#4F6B88")

      	  ;; Magenta Tones            
      	  (magenta                    "#F18BB5")
      	  (magenta-warmer             "#F27BC2")
      	  (magenta-cooler             "#F06FBB")
      	  (magenta-faint              "#F0A2C4")
      	  (magenta-intense            "#D45A8F")
  	          (bg-magenta-intense         "#B24F59")
  	          (bg-magenta-subtle          "#B46A7A")
  	          (bg-magenta-nuanced         "#A75C70")

      	  ;; Cyan Tones               
      	  (cyan                       "#66A3C4")
      	  (cyan-warmer                "#5D97B1")
      	  (cyan-cooler                "#57A4A9")
      	  (cyan-faint                 "#91D3E5")
      	  (cyan-intense               "#4F8D99")
	        (bg-cyan-intense            "#1F3C46")
	        (bg-cyan-subtle             "#3E6F82")
	        (bg-cyan-nuanced            "#4C5F63")

        ;;; Uncommon Accent Foregrounds

      	  ;; Special Accent Tones
      	  (rust                       "#F27D5D")
      	  (gold                       "#F7C56A")
      	  (olive                      "#A7C89F")
      	  (slate                      "#B38DAA")
      	  (indigo                     "#9C7DB9")
      	  (maroon                     "#F2A7B4")
      	  (pink                       "#F5A9D8")


      ;;; Davide's addons

      ;;; Davide's grays map
      	  (gray-00                    "#000000")
      	  (gray-11                    "#111111")
      	  (gray-22                    "#222222")
      	  (gray-33                    "#333333")
      	  (gray-44                    "#444444")
      	  (gray-55                    "#555555")
      	  (gray-66                    "#666666")
      	  (gray-77                    "#777777")
      	  (gray-88                    "#888888")
      	  (gray-99                    "#999999")
      	  (gray-AA                    "#AAAAAA")
      	  (gray-BB                    "#BBBBBB")
      	  (gray-CC                    "#CCCCCC")
      	  (gray-DD                    "#DDDDDD")
      	  (gray-EE                    "#EEEEEE")
      	  (gray-FF                    "#FFFFFF")

      ;;; Common accent backgrounds

      	  ;; Accent Backgrounds



      ;;; Uncommon accent background and foreground pairs
      	  ;; Updated background and foreground pairs
      	  (bg-clay                    "#C67A6F")
      	  (fg-clay                    "#F5D1C7")

      	  (bg-ochre                   "#D57B2C")
      	  (fg-ochre                   "#F4D7A1")

      	  (bg-lavender                "#B87BB6")
      	  (fg-lavender                "#D6A1D2")

      	  (bg-sage                    "#6F8C85")
      	  (fg-sage                    "#C0E4D6")

       ;;; themcol is the selector color, changing this will change all selectors
       ;;; these sets the main higlight and hues that are used everywhere else
      	  (themcol                     red)  
      	  (themcol-warmer              red-warmer)  
      	  (themcol-cooler              reg-cooler)  
      	  (themcol-faint               red-faint)  
      	  (themcol-intense             red-intense)

      	  (fg-themcol-main             "#F1D8F2")  ;; Text
      	  (fg-themcol-dim              "#C3A3B9")  ;; Text
      	  (fg-themcol-alt              "#FF9F9F")  ;; Text
      	  (bg-themcol-main             "#3A2D3A")
      	  (bg-themcol-dim              "#2C232C")
      	  (bg-themcol-active           "#5F455F")
      	  (bg-themcol-inactive         "#3F2D3F")
      	  (border-themcol              "#4E3D4E")
      	  (bg-themcol-intense          "#D13E4C")  ;; this is a darker themcol for bg
      	  (bg-themcol-subtle           "#F9B3B3")
      	  (bg-themcol-nuanced          "#F9F2F2")

      	  (bg-themcol-intense      "#D13E4C") ;; this is a darker themcol
      	  (themcol-1               "#F24B56") ;; used for orgmode headings colors
      	  (themcol-2               "#F3656C")
      	  (themcol-3               "#F57F82")
      	  (themcol-4               "#F79999")
      	  (themcol-5               "#F9B3B3")
      	  (themcol-6               "#F9CCCC")
      	  (themcol-7               "#F9E6E6")
      	  (themcol-8               "#F9F2F2")

      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Mappings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

      ;;;; General mappings

      ;;;  Basic backgrounds and foregrounds: should be based on the themcol
      	  (bg-main          bg-themcol-main)     ;; main back color
      	  (bg-dim           bg-themcol-dim)      ;; back color dimmed
      	  (fg-main          fg-themcol-main)     ;; main text color
      	  (fg-dim           fg-themcol-dim)      ;; text dimmed
      	  (fg-alt           fg-themcol-alt)      
      	  (bg-active        bg-themcol-active)   
      	  (bg-inactive      bg-themcol-inactive) 
      	  (border           border-themcol)      

      ;;; Special purpose

      	  (bg-completion              themcol)    ;; this is all the bg highlights like in minibuffer vertico or corfu
      	  (bg-hover                   themcol)    ;; Hover background
      	  (bg-hover-secondary         themcol)    ;; Secondary hover background
      	  (bg-hl-line                 themcol)    ;; Highlight Line
      	  (bg-region                  bg-active)  ;; Region background on mark and select
      	  (fg-region                  gray-DD)    ;; Region foreground

      	  (bg-char-0                  "#F3A5C4")  ;; Char 1 background
      	  (bg-char-1                  "#F5A9D9")  ;; Char 2 background
      	  (bg-char-2                  "#F7A0C7")  ;; Char 3 background


      	  (bg-mode-line-active        bg-main)
      	  (fg-mode-line-active        fg-main)
      	  (border-mode-line-active    bg-main)
      	  (bg-mode-line-inactive      bg-main)
      	  (fg-mode-line-inactive      fg-dim)
      	  (border-mode-line-inactive  bg-dim)

      	  (modeline-err               red-intense)
      	  (modeline-warning           yellow-intense)
      	  (modeline-info              cyan-cooler)

      	  (bg-tab-bar                 "#e0d4ce")
      	  (bg-tab-current             "#fbf7f0")
      	  (bg-tab-other               "#c8b8b2")

      	  ;; Below this line it should mostly use the basic back and forground + previous color definitions

      	  (fringe bg-dim)
      	  (cursor themcol)

      	  (keybind                  red)
      	  (name                     magenta)
      	  (identifier               yellow-cooler)

      	  (err                      red-intense)
      	  (warning                  yellow-intense)
      	  (info                     cyan-intense)

      	  (underline-err            red-intense)
      	  (underline-warning        yellow-intense)
      	  (underline-note           cyan-intense)

      	  (bg-prominent-err         bg-red-intense)
      	  (fg-prominent-err         fg-main)
      	  (bg-prominent-warning     bg-yellow-intense)
      	  (fg-prominent-warning     fg-main)
      	  (bg-prominent-note        bg-cyan-intense)
      	  (fg-prominent-note        fg-main)

      	  (bg-active-argument       bg-yellow-nuanced)
      	  (fg-active-argument       yellow-warmer)
      	  (bg-active-value          bg-cyan-nuanced)
      	  (fg-active-value          cyan-warmer)

      ;;;; Code mappings

      	  (bracket                 fg-main)
      	  (builtin                 magenta-warmer)
      	  (comment                 fg-dim)
      	  (constant                blue-cooler)
      	  (delimiter               fg-main)
      	  (docmarkup               magenta-faint)
      	  (docstring               green-faint)
      	  (fnname                  magenta)
      	  (keyword                 magenta-cooler)
      	  (number                  fg-main)
      	  (operator                fg-main)
      	  (preprocessor            red-cooler)
      	  (punctuation             fg-main)
      	  (rx-backslash            magenta)
      	  (rx-construct            green-cooler)
      	  (string                  green-faint)
      	  (type                    cyan-coller)
      	  (variable                cyan)

      ;;;; Accent mappings

      	  (accent-0               blue)
      	  (accent-1               magenta-warmer)
      	  (accent-2               cyan)
      	  (accent-3               red)

      ;;;; Button mappings

      	  (fg-button-active      fg-main)
      	  (fg-button-inactive    fg-dim)
      	  (bg-button-active      bg-active)
      	  (bg-button-inactive    bg-dim)

      ;;;; Completion mappings

      	  (fg-completion-match-0 themcol)
      	  (fg-completion-match-1 themcol)
      	  (fg-completion-match-2 themcol)
      	  (fg-completion-match-3 themcol)
      	  (bg-completion-match-0 bg-dim)
      	  (bg-completion-match-1 bg-dim)
      	  (bg-completion-match-2 bg-dim)
      	  (bg-completion-match-3 bg-dim)


      ;;; Graphs

      	  (bg-graph-red-0        red)
      	  (bg-graph-red-1        red-warmer)
      	  (bg-graph-green-0      green)
      	  (bg-graph-green-1      green-warmer)
      	  (bg-graph-yellow-0     yellow)
      	  (bg-graph-yellow-1     yellow-warmer)
      	  (bg-graph-blue-0       blue)
      	  (bg-graph-blue-1       blue-warmer)
      	  (bg-graph-magenta-0    magenta)
      	  (bg-graph-magenta-1    magenta-warmer)
      	  (bg-graph-cyan-0       cyan)
      	  (bg-graph-cyan-1       cyan-warmer)


      ;;; Diffs

      	  (bg-added               bg-green)
      	  (bg-added-faint         bg-green-faint)
      	  (bg-added-refine        bg-green-refine)
      	  (bg-added-fringe        bg-green-intense)
      	  (fg-added               green)
      	  (fg-added-intense       green-intense)
      	  
      	  (bg-changed             bg-yellow)
      	  (bg-changed-faint       bg-yellow-faint)
      	  (bg-changed-refine      bg-yellow-refine)
      	  (bg-changed-fringe      bg-yellow-intense)
      	  (fg-changed             yellow)
      	  (fg-changed-intense     yellow-intense)
      	  
      	  (bg-removed             bg-red)
      	  (bg-removed-faint       bg-red-faint)
      	  (bg-removed-refine      bg-red-refine)
      	  (bg-removed-fringe      bg-red-intense)
      	  (fg-removed             red)
      	  (fg-removed-intense     red-intense) ;; intense red text
      	  
      	  (bg-diff-context       bg-dim)

      ;;; Paren match

      	  (bg-paren-match        themcol-5)
      	  (fg-paren-match        bg-dim)
      	  (bg-paren-expression   themcol-8)
      	  (underline-paren-match unspecified)



      ;;;; Date mappings

      	  (date-common           cyan)
      	  (date-deadline         red-cooler)
      	  (date-deadline-subtle  red-faint)
      	  (date-event            fg-alt)
      	  (date-holiday          red)
      	  (date-holiday-other    blue)
      	  (date-now              fg-main)
      	  (date-range            fg-alt)
      	  (date-scheduled        yellow)
      	  (date-scheduled-subtle yellow-faint)
      	  (date-weekday          cyan)
      	  (date-weekend          magenta)

      ;;;; Line number mappings

      	  (fg-line-number-inactive fg-dim)
      	  (fg-line-number-active fg-main)
      	  (bg-line-number-inactive bg-main)
      	  (bg-line-number-active themcol)

      ;;;; Link mappings

      	  (fg-link blue-warmer)
      	  (bg-link unspecified)
      	  (underline-link blue-warmer)

      	  (fg-link-symbolic cyan)
      	  (bg-link-symbolic unspecified)
      	  (underline-link-symbolic cyan)

      	  (fg-link-visited magenta)
      	  (bg-link-visited unspecified)
      	  (underline-link-visited magenta)

      ;;;; Mail mappings

      	  (mail-cite-0 blue-faint)
      	  (mail-cite-1 yellow-warmer)
      	  (mail-cite-2 cyan-cooler)
      	  (mail-cite-3 red-cooler)
      	  (mail-part cyan)
      	  (mail-recipient magenta-cooler)
      	  (mail-subject magenta-warmer)
      	  (mail-other magenta-faint)

      ;;;; Mark mappings

      	  (bg-mark-delete bg-red-subtle)
      	  (fg-mark-delete red)
      	  (bg-mark-select bg-cyan-subtle)
      	  (fg-mark-select cyan)
      	  (bg-mark-other bg-yellow-subtle)
      	  (fg-mark-other yellow)

      ;;;; Prompt mappings

      	  (fg-prompt themcol) ;; minibuffer prompt
      	  (bg-prompt unspecified)

      ;;;; Prose mappings

      	  (bg-prose-block-delimiter bg-dim)
      	  (fg-prose-block-delimiter fg-dim)
      	  (bg-prose-block-contents bg-dim)

      	  (bg-prose-code bg-main)
      	  (fg-prose-code cyan-intense)

      	  (bg-prose-macro bg-dim)
      	  (fg-prose-macro magenta-cooler)

      	  (bg-prose-verbatim bg-main)
      	  (fg-prose-verbatim magenta-warmer)

      	  (prose-done fg-dim)
      	  (prose-todo yellow-intense)

      	  (prose-metadata fg-dim)
      	  (prose-metadata-value fg-alt)

      	  (prose-table fg-alt)
      	  (prose-table-formula magenta-warmer)

      	  (prose-tag magenta-faint)

      ;;;; Rainbow mappings

      	  (rainbow-0 fg-main)
      	  (rainbow-1 magenta-intense)
      	  (rainbow-2 cyan-intense)
      	  (rainbow-3 red-warmer)
      	  (rainbow-4 yellow-intense)
      	  (rainbow-5 magenta-cooler)
      	  (rainbow-6 green-intense)
      	  (rainbow-7 blue-warmer)
      	  (rainbow-8 magenta-warmer)

      ;;;; Search mappings

      	  (bg-search-current themcol)
      	  (bg-search-lazy    themcol-faint)
      	  (bg-search-replace bg-red-intense)

      	  (bg-search-rx-group-0 bg-blue-intense)
      	  (bg-search-rx-group-1 bg-green-intense)
      	  (bg-search-rx-group-2 bg-red-subtle)
      	  (bg-search-rx-group-3 bg-magenta-subtle)

      ;;;; Space mappings

      	  (bg-space unspecified)
      	  (fg-space border)
      	  (bg-space-err bg-red-intense)

      ;;;; Terminal mappings

      	  (bg-term-black           gray-00)
      	  (fg-term-black           gray-00)
      	  (bg-term-black-bright    gray-66)
      	  (fg-term-black-bright    gray-66)

      	  (bg-term-red             red)
      	  (fg-term-red             red)
      	  (bg-term-red-bright      red-warmer)
      	  (fg-term-red-bright      red-warmer)

      	  (bg-term-green           green)
      	  (fg-term-green           green)
      	  (bg-term-green-bright    green-cooler)
      	  (fg-term-green-bright    green-cooler)

      	  (bg-term-yellow          yellow)
      	  (fg-term-yellow          yellow)
      	  (bg-term-yellow-bright   yellow-warmer)
      	  (fg-term-yellow-bright   yellow-warmer)

      	  (bg-term-blue            blue)
      	  (fg-term-blue            blue)
      	  (bg-term-blue-bright     blue-warmer)
      	  (fg-term-blue-bright     blue-warmer)

      	  (bg-term-magenta         magenta)
      	  (fg-term-magenta         magenta)
      	  (bg-term-magenta-bright  magenta-cooler)
      	  (fg-term-magenta-bright  magenta-cooler)

      	  (bg-term-cyan            cyan)
      	  (fg-term-cyan            cyan)
      	  (bg-term-cyan-bright     cyan-cooler)
      	  (fg-term-cyan-bright     cyan-cooler)

      	  (bg-term-white           gray-AA)
      	  (fg-term-white           gray-AA)
      	  (bg-term-white-bright    gray-FF)
      	  (fg-term-white-bright    gray-FF)

      ;;;; Heading mappings

      	  (fg-heading-0 themcol) ;; orgmode title
      	  (fg-heading-1 themcol-1)
      	  (fg-heading-2 themcol-2)
      	  (fg-heading-3 themcol-3)
      	  (fg-heading-4 themcol-4)
      	  (fg-heading-5 themcol-5)
      	  (fg-heading-6 themcol-6)
      	  (fg-heading-7 themcol-7)
      	  (fg-heading-8 themcol-8)

      	  (bg-heading-0 unspecified)
      	  (bg-heading-1 unspecified)
      	  (bg-heading-2 unspecified)
      	  (bg-heading-3 unspecified)
      	  (bg-heading-4 unspecified)
      	  (bg-heading-5 unspecified)
      	  (bg-heading-6 unspecified)
      	  (bg-heading-7 unspecified)
      	  (bg-heading-8 unspecified)

      	  (overline-heading-0 unspecified)
      	  (overline-heading-1 unspecified)
      	  (overline-heading-2 unspecified)
      	  (overline-heading-3 unspecified)
      	  (overline-heading-4 unspecified)
      	  (overline-heading-5 unspecified)
      	  (overline-heading-6 unspecified)
      	  (overline-heading-7 unspecified)
      	  (overline-heading-8 unspecified)
          ))
  
  ;; load the theme after setting the colors
  (load-theme 'modus-vivendi-tinted t))

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

;; configure dired and put some keys for easy navigation
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

;; intall ace and 
(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "M-o") 'ace-window)
  )

;; hadcode colors because I am a lazy cat
(custom-set-faces
 '(aw-leading-char-face
   ((t (:foreground "#444444" :background "#EE7700" :weight bold :height 3.5)))))

;; adds indentation lines when programming, to help with python
(use-package indent-guide
  :ensure t
  :config
  ;; Enable indent-guide only in programming modes
  (add-hook 'prog-mode-hook 'indent-guide-mode))

;; this is to add emojis quickly
;;(use-package emoji-insert
;;  :ensure nil
;;  )

;; don't truncate lines, go to the next line
(setq-default truncate-lines nil)

(use-package vertico
  :ensure t
  :custom
  ;; (vertico-scroll-margin 0) ;; Different scroll margin
  ;; (vertico-count 20) ;; Show more candidates
  ;; (vertico-resize t) ;; Grow and shrink the Vertico minibuffer
  (vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
  :init (vertico-mode)
  :bind
  ( :map vertico-map
  ("<left>" . vertico-directory-delete-word)
  ("<right>" . vertico-insert) ;; same as <TAB>
  ("M-DEL" . vertico-directory-delete-word)
  ("M-," . vertico-quick-insert)
  ("M-." . vertico-quick-exit))
  ) ;; it is a minor-mode and it enabled with 1

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
  (custom-set-faces
   '(dashboard-heading ((t (:foreground "#338fff" :weight bold))))
   ;;'(dashboard-banner-logo-title ((t (:foreground "gold" :weight bold))))
   ;;'(dashboard-footer ((t (:foreground "gray" :italic t))))
   ;;'(dashboard-footer-icon ((t (:foreground "orange"))))
   ;;'(dashboard-navigator ((t (:foreground "light blue"))))
   ;;'(dashboard-items-face ((t (:foreground "white"))))
   )


  
  (dashboard-setup-startup-hook)
  :custom
  (dashboard-startup-banner "~/Pictures/logo.png")
  (dashboard-banner-logo-title nil)
  (dashboard-center-content t)
  (dashboard-icon-type 'nerd-icons)
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons t)
  (dashboard-set-footer nil)
  (dashboard-projects-backend 'project-el)
  (dashboard-display-icons-p t)
  (dashboard-week-agenda t)
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
  (emms-playing-time-mode -1)
  (emms-mode-line-mode -1)
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
  (setq pyvenv-workon-home "~/.virtualenv/")
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

;; Disable the minor mode - don't need pyenv on all buffers
(pyenv-mode -1)

;; Automatically update when pyenv is changed (e.g., in shell buffers)
(add-hook 'post-command-hook #'update-pyenv-mode-line)

;; add ruff calls: requires pip install ruff
(use-package lazy-ruff
  :ensure t
  :bind (("C-c f" . lazy-ruff-lint-format-dwim)) ;; keybinding
  :config
  (lazy-ruff-global-mode t)) ;; Enable the lazy-ruff minor mode globally

;; flymake configs - to notice that you need to have ruff installed
(fringe-mode 12)
(use-package flymake
  :ensure nil
  :bind (:map flymake-mode-map
              ("M-n" . flymake-goto-next-error)
              ("M-p" . flymake-goto-prev-error))
  :custom
  (python-flymake-command `("ruff" "--quiet" "check"
			    "--preview" ; enables beta checks
			    "--line-length=120"
			    ,@(flatten-list (mapcar (lambda (code) (list "--select" code))
						    '("E" "W"))) ;codes to select
			    "--output-format=pylint"
			    "--stdin-filename=stdin" "-"))
  )

(use-package yaml-mode
:ensure t)

(use-package eglot
  :ensure nil
  :hook
  (python-base-mode-hook . eglot-ensure))

;; adds icons to certain modes
(defun my-mode-icon ()
      "Return a Nerd Font icon based on `major-mode`."
      (let ((icon (alist-get major-mode
                             '((org-mode . "")       ;; Unicorn for Org mode
                               (Info-mode . "")    ;; Info icon
                               (dashboard-mode . "")    ;; Dashboard icon
                               (vterm-mode . " ")    ;; Terminal icon
                               (rust-mode . "")      ;; Rust icon
                               (python-mode . ""))   ;; Python icon 
                             nil nil 'string=)))
        (if icon (concat " " icon " ") ""))) ;; Add spacing around icon

    (setq-default mode-line-modes
                  (append '((:eval (my-mode-icon))) mode-line-modes))

(use-package vterm
  :ensure t)

;; Make native compilation silent and prune its cache.
(when (native-comp-available-p)
  (setq native-comp-async-report-warnings-errors 'silent)
  (setq native-compile-prune-cache t))

(use-package denote
:ensure t
:hook
( ;; If you use Markdown or plain text files, then you want to make
 ;; the Denote links clickable (Org renders links as buttons right
 ;; away)
 (text-mode . denote-fontify-links-mode-maybe)
 ;; Apply colours to Denote names in Dired.  This applies to all
 ;; directories.  Check `denote-dired-directories' for the specific
 ;; directories you may prefer instead.  Then, instead of
 ;; `denote-dired-mode', use `denote-dired-mode-in-directories'.
 (dired-mode . denote-dired-mode))
:bind
;; Denote DOES NOT define any key bindings.  This is for the user to
;; decide.  For example:
( :map global-map
  ("C-c n n" . denote)
  ("C-c n d" . denote-dired)
  ("C-c n g" . denote-grep)
  ;; If you intend to use Denote with a variety of file types, it is
  ;; easier to bind the link-related commands to the `global-map', as
  ;; shown here.  Otherwise follow the same pattern for `org-mode-map',
  ;; `markdown-mode-map', and/or `text-mode-map'.
  ("C-c n l" . denote-link)
  ("C-c n L" . denote-add-links)
  ("C-c n b" . denote-backlinks)
  ("C-c n q c" . denote-query-contents-link) ; create link that triggers a grep
  ("C-c n q f" . denote-query-filenames-link) ; create link that triggers a dired
  ;; Note that `denote-rename-file' can work from any context, not just
  ;; Dired bufffers.  That is why we bind it here to the `global-map'.
  ("C-c n r" . denote-rename-file)
  ("C-c n R" . denote-rename-file-using-front-matter)

  ;; Key bindings specifically for Dired.
  :map dired-mode-map
  ("C-c C-d C-i" . denote-dired-link-marked-notes)
  ("C-c C-d C-r" . denote-dired-rename-files)
  ("C-c C-d C-k" . denote-dired-rename-marked-files-with-keywords)
  ("C-c C-d C-R" . denote-dired-rename-marked-files-using-front-matter))

:config
;; Remember to check the doc string of each of those variables.
(setq denote-directory (expand-file-name "~/Documents/notes/"))
(setq denote-save-buffers nil)
(setq denote-known-keywords '("emacs" "philosophy" "politics" "economics"))
(setq denote-infer-keywords t)
(setq denote-sort-keywords t)
(setq denote-prompts '(title keywords))
(setq denote-excluded-directories-regexp nil)
(setq denote-excluded-keywords-regexp nil)
(setq denote-rename-confirmations '(rewrite-front-matter modify-file-name))

;; Pick dates, where relevant, with Org's advanced interface:
(setq denote-date-prompt-use-org-read-date t)

;; Automatically rename Denote buffers using the `denote-rename-buffer-format'.
(denote-rename-buffer-mode 1))

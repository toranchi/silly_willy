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
      (bg-yellow                  "#9E6E26")
      (bg-yellow-intense          "#C77C17")
      (bg-yellow-subtle           "#E1A156")
      (bg-yellow-nuanced          "#D88E2E")
      (bg-yellow-faint            "#9E5C12")
      (bg-yellow-refine           "#A7783F")



;; Blue Tones               
      (blue                       "#7DA0C4")
      (blue-warmer                "#6188B3")
      (blue-cooler                "#6DB5C2")
      (blue-faint                 "#A4C4D3")
      (blue-intense               "#577DA3")
      (bg-blue-intense            "#3A6180")
      (bg-blue-subtle             "#7BA9B7")
      (bg-blue-nuanced            "#648AA8")

;; Magenta Tones            
      (magenta                    "#F18BB5")
      (magenta-warmer             "#F27BC2")
      (magenta-cooler             "#F06FBB")
      (magenta-faint              "#F0A2C4")
      (magenta-intense            "#D45A8F")
      (bg-magenta-intense         "#D76D7A")
      (bg-magenta-subtle          "#D87C9E")
      (bg-magenta-nuanced         "#D06E8F")

;; Cyan Tones               
      (cyan                       "#66A3C4")
      (cyan-warmer                "#5D97B1")
      (cyan-cooler                "#57A4A9")
      (cyan-faint                 "#91D3E5")
      (cyan-intense               "#4F8D99")
      (bg-cyan-intense            "#2E5B69")
      (bg-cyan-subtle             "#5B9AB3")
      (bg-cyan-nuanced            "#5A7C87")

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

;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Andy Zhang"
      user-mail-address "fengmzhang@paypal.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Fantasque Sans Mono" :size 14)
      doom-variable-pitch-font (font-spec :family "PingFang SC" :size 14 :weight 'light))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme (if (display-graphic-p) 'kaolin-light 'kaolin-galaxy))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


(after! evil-snipe
  (setq evil-snipe-scope 'whole-buffer
        evil-snipe-repeat-scope 'whole-buffer))
(after! pyim
  (setq pyim-default-scheme 'xiaohe-shuangpin
        pyim-page-tooltip 'posframe))
(after! evil
  (setq evil-split-window-below t
        evil-vsplit-window-right t))
(setq scroll-margin 5)
(add-to-list 'default-frame-alist '(height . 75))
(add-to-list 'default-frame-alist '(width . 130))

(setq doom-localleader-key ",")

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(map! :leader
      :n "sc" 'evil-ex-nohighlight
      :n "jj" 'avy-goto-line-below
      :n "jk" 'avy-goto-line-above)

(map! "<mouse-4>" #'evil-scroll-line-up
      "<mouse-5>" #'evil-scroll-line-down)

(map! :m "<C-i>" 'better-jumper-jump-forward)

(global-hungry-delete-mode)

;; TODO move these to autoload
(defun +ivy-find-file-other-window-action (x)
  "Opens the current candidate in another window."
  (select-window
   (with-ivy-window
     (find-file-other-window (expand-file-name x))
     (selected-window))))
(defun +ivy/find-file-other-window-action ()
  "Open the current counsel-{ag,rg,git-grep} candidate in other-window."
  (interactive)
  (ivy-set-action #'+ivy-find-file-other-window-action)
  (setq ivy-exit 'done)
  (exit-minibuffer))

(map! :map ivy-minibuffer-map
      "C-RET" #'+ivy/find-file-other-window-action
      "<C-return>" #'+ivy/find-file-other-window-action)

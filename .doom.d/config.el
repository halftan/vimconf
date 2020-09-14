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

;; Disable menu-bar-mode in terminal
(menu-bar-mode (if (display-graphic-p) 1 -1))

(setq scroll-margin 5)
(add-to-list 'default-frame-alist '(height . 75))
(add-to-list 'default-frame-alist '(width . 130))

(after! evil-snipe
  (setq evil-snipe-scope 'whole-buffer
        evil-snipe-repeat-scope 'whole-buffer))

(after! pyim
  (setq pyim-default-scheme 'xiaohe-shuangpin
        pyim-page-tooltip 'posframe))

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

(after! evil
  (setq evil-split-window-below t
        evil-vsplit-window-right t)
  (map! :leader
        :n "sc" #'evil-ex-nohighlight
        :g "SPC" nil)
  (map! :leader
        :v "=" #'er/expand-region
        :v "-" #'er/contract-region)
  (map! :m "<up>" #'evil-window-up
        :m "<down>" #'evil-window-down
        :m "<left>" #'evil-window-left
        :m "<right>" #'evil-window-right
        :m "<H-left>" #'+evil/window-move-left
        :m "<H-right>" #'+evil/window-move-right
        :m "<H-up>" #'+evil/window-move-up
        :m "<H-down>" #'+evil/window-move-down
        :m "<M-left>" #'+evil/window-move-left
        :m "<M-right>" #'+evil/window-move-right
        :m "<M-up>" #'+evil/window-move-up
        :m "<M-down>" #'+evil/window-move-down
        :m "ESC <left>" #'+evil/window-move-left
        :m "ESC <right>" #'+evil/window-move-right
        :m "ESC <up>" #'+evil/window-move-up
        :m "ESC <down>" #'+evil/window-move-down
        :m "<mouse-4>" #'evil-scroll-line-up
        :m "<mouse-5>" #'evil-scroll-line-down
        :m "gs=" #'evilem-motion-next-line-first-non-blank
        :i "<backtab>" #'evil-shift-left-line)

  (map! :prefix "g"
        :m "s=" #'evilem-motion-next-line-first-non-blank))

(map! :leader
      :prefix "SPC"
      :m "j" #'avy-goto-line-below
      :m "k" #'avy-goto-line-above
      :m "w" #'avy-goto-char-2)
(map! :m "<C-i>" 'better-jumper-jump-forward)

(global-subword-mode 1)

(after! ivy
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
        "C-t" #'+ivy/find-file-other-window-action
        "<C-return>" #'+ivy/find-file-other-window-action)
  (after! ivy-hydra

    (defhydra+ hydra-ivy (:hint nil :color pink)
      "
 Move     ^^^^^^^^^^ | Call         ^^^^ | Cancel^^ | Options^^ | Action _w_/_s_/_a_: %s(ivy-action-name)
----------^^^^^^^^^^-+--------------^^^^-+-------^^-+--------^^-+---------------------------------
 _g_ ^ ^ _k_ ^ ^ _u_ | _f_orward _o_ccur | _i_nsert | _c_alling: %-7s(if ivy-calling \"on\" \"off\") _C_ase-fold: %-10`ivy-case-fold-search
 ^↨^ _h_ ^+^ _l_ ^↕^ | _RET_ done     ^^ | _q_uit   | _m_atcher: %-7s(ivy--matcher-desc) _t_runcate: %-11`truncate-lines
 _G_ ^ ^ _j_ ^ ^ _d_ | _TAB_ alt-done ^^ | ^ ^      | _<_/_>_: shrink/grow
"
      ;; arrows
      ("l" ivy-alt-done)
      ("h" ivy-backward-delete-char)
      ("g" ivy-beginning-of-buffer)
      ("G" ivy-end-of-buffer)
      ("d" ivy-scroll-up-command)
      ("u" ivy-scroll-down-command)
      ("e" ivy-scroll-down-command)
      ;; actions
      ("q" keyboard-escape-quit :exit t)
      ("<escape>" keyboard-escape-quit :exit t)
      ("TAB" ivy-alt-done :exit nil)
      ("RET" ivy-done :exit t)
      ("C-SPC" ivy-call-and-recenter :exit nil)
      ("f" ivy-call)
      ("c" ivy-toggle-calling)
      ("m" ivy-toggle-fuzzy)
      ("t" (setq truncate-lines (not truncate-lines)))
      ("o" ivy-occur :exit t))))

(map! :map magit-status-mode-map
      :prefix "g"
      "j" nil
      "k" nil)
(map! :map magit-status-mode-map
      :prefix "g"
      "j" #'magit-section-forward
      "k" #'magit-section-backward)

(defun doom-modeline-conditional-buffer-encoding ()
  "We expect the encoding to be LF UTF-8, so only show the modeline when this is not the case"
  (setq-local doom-modeline-buffer-encoding
              (unless (or (eq buffer-file-coding-system 'utf-8-unix)
                          (eq buffer-file-coding-system 'utf-8)))))
(add-hook 'find-file-hook #'doom-modeline-conditional-buffer-encoding)

;; (map! :map ivy-minibuffer-map
;;       "M-o" nil)

;; (map! :map ivy-minibuffer-map
;;       "M-o" #'my-hydra-ivy/body)

;; SSH config
;; (add-to-list 'auto-mode-alist '("/\\.ssh/config\\'"     . ssh-config-mode))
;; (add-to-list 'auto-mode-alist '("/sshd?_config\\'"      . ssh-config-mode))
;; (add-to-list 'auto-mode-alist '("/knownhosts\\'"        . ssh-known-hosts-mode))
;; (add-to-list 'auto-mode-alist '("/authorized_keys2?\\'" . ssh-authorized-keys-mode))
;; (add-hook 'ssh-config-mode-hook 'turn-on-font-lock)

(setq tab-always-indent t)

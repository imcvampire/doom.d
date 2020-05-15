;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(defun +doom-dashboard|make-frame (frame)
  "Reload the dashboard after a brief pause. This is necessary for new frames,
whose dimensions may not be fully initialized by the time this is run."
  (run-with-timer 0.1 nil #'+doom-dashboard/open frame))
(defun +doom-dashboard|server-visit (&rest _)
  "Inhibit dashboard refresh when opening files via emacsclient."
  (setq +doom-dashboard-inhibit-refresh t))

(setq doom-theme 'doom-spacegrey
      doom-themes-treemacs-theme "doom-colors"
      doom-font (font-spec :family "Fira Code Retina" :size 15)
      doom-big-font (font-spec :family "Fira Code Retina" :size 17)
      show-trailing-whitespace t
      smartparens-strict-mode t)

(doom-themes-visual-bell-config)
(doom-themes-treemacs-config)
; (doom-themes-org-config)

(setq-hook! 'minibuffer-setup-hook show-trailing-whitespace nil)

(add-hook 'after-make-frame-functions #'+doom-dashboard|make-frame)
(add-hook 'server-visit-hook #'+doom-dashboard|server-visit)
(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'gofmt-before-save)))

;; Keybindings
(map!
 (:after treemacs-evil
   (:map evil-treemacs-state-map
     "C-h" #'evil-window-left
     "C-l" #'evil-window-right)))

(auto-save-visited-mode +1)

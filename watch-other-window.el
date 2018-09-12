;;; watch-other-window.el --- Scroll other window and keep current window's position.

;; Filename: watch-other-window.el
;; Description: Watch other window and keep focus on current window.
;; Author: Andy Stewart <lazycat.manatee@gmail.com>
;; Maintainer: Andy Stewart <lazycat.manatee@gmail.com>
;; Copyright (C) 2018, Andy Stewart, all rights reserved.
;; Created: 2018-09-12 15:44:24
;; Version: 0.1
;; Last-Updated: 2018-09-12 15:44:24
;;           By: Andy Stewart
;; URL: http://www.emacswiki.org/emacs/download/watch-other-window.el
;; Keywords:
;; Compatibility: GNU Emacs 27.0.50
;;
;; Features that might be required by this library:
;;
;;
;;

;;; This file is NOT part of GNU Emacs

;;; License
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.

;;; Commentary:
;;
;; Scroll other window and keep current window's position.
;;
;; Emacs' `scroll-other-window' is very nice on most situation.
;; But when you view same buffer with two window,
;; you will lost position of current window
;; when you do `scroll-other-window' with same buffer.
;;
;; So `watch-other-window' will fix this problem.
;;

;;; Installation:
;;
;; Put watch-other-window.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;;
;; (require 'watch-other-window)
;;
;; Binding key with below commands:
;;
;; `watch-other-window-up'
;; `watch-other-window-down'
;; `watch-other-window-up-line'
;; `watch-other-window-down-line'
;;

;;; Customize:
;;
;;
;;
;; All of the above can customize by:
;;      M-x customize-group RET watch-other-window RET
;;

;;; Change log:
;;
;; 2018/09/12
;;      * First released.
;;

;;; Acknowledgements:
;;
;;
;;

;;; TODO
;;
;;
;;

;;; Require


;;; Code:

(defun watch-other-window-up ()
  (interactive)
  (watch-other-window-internal "up"))

(defun watch-other-window-down ()
  (interactive)
  (watch-other-window-internal "down"))

(defun watch-other-window-up-line ()
  (interactive)
  (watch-other-window-internal "up" 1))

(defun watch-other-window-down-line ()
  (interactive)
  (watch-other-window-internal "down" 1))

(defun watch-other-window-internal (direction &optional line)
  (save-excursion
    ;; Switch to other window.
    (other-window 1)
    ;; Do scroll operation.
    (ignore-errors
      (if (string-equal direction "up")
          (if line
              (scroll-up line)
            (scroll-up))
        (if line
            (scroll-down line)
          (scroll-down))))
    ;; Switch back to current window.
    (other-window -1)
    ))

(provide 'watch-other-window)

;;; watch-other-window.el ends here

# What is this?

Scroll other window and keep current window's position.

## Why not use scroll-other-window ?

Emacs' `scroll-other-window' is very nice on most situation.

But when you view same buffer with two window,
you will lost position of current window
when you do `scroll-other-window' with same buffer.

So `watch-other-window' fix this problem that always keep your current position when you scroll other window.

## Installation

Put `watch-other-window'.el` to your load-path.
The load-path is usually ~/elisp/.
It's set in your ~/.emacs like this:

```Elisp
(add-to-list 'load-path (expand-file-name "~/elisp"))
(require 'watch-other-window)
```

## Usage
Bind your favorite key to functions:

```Elisp
watch-other-window-up
watch-other-window-down
watch-other-window-up-line
watch-other-window-down-line
```

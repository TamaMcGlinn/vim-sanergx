Tired of `gx` not working correctly (see [issue #4738](https://github.com/vim/vim/issues/4738)) I
decided to take all that is useful from vim's ancient netrw, and the result is ten lines of code.

This works much better than netrw.

Also, when on a plugin line inside a vim config file, this opens the plugin, e.g.

```
" Fix gx see https://github.com/vim/vim/issues/4738   <- gx here just opens that issue
Plug 'TamaMcGlinn/vim-sanergx'                        <- gx here opens this plugin's main page
```

To install use any vim plugin manager:

    % git clone https://github.com/felipec/vim-sanegx.git ~/.vim/pack/plugins/start/sanegx

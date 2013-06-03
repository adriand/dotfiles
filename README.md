nilved does dotfiles
====================

install
-------

```sh
git clone https://github.com/devlinzed/dotfiles ~/.dotfiles
cd ~/.dotfiles
./bootstrap
```

this will check out the git submodules; symlink the appropriate files in
`.dotfiles` to your home directory; install the required system-wide ruby gems;
and install the vim plugins.  sudo may be required if your `gem` needs it.

the bootstrap script is idempotent and you can run it again to update symlinks
and vim plugins.

if you check out to somewhere other than `~/.dotfiles`, you'll need to edit
some files that hard-code that path in because they can't accept environment
variables.  try `ag dotfiles`.

what i use
----------

* **color scheme**: [base16](https://github.com/chriskempson/base16)
* **display manager**: [slim](http://slim.berlios.de/)
* **email**: [mutt](http://mutt.org/)
* **feed reader**: [newsbeuter](http://newsbeuter.org/)
* **font**: [dejavu sans mono for powerline](https://github.com/Lokaltog/powerline-fonts)
* **music player**: [ncmpcpp](http://ncmpcpp.rybczak.net/)
* **operating system**: [xubuntu](http://xubuntu.org/)
* **password manager**: [pass](http://zx2c4.com/projects/password-store/)
* **shell**: [zsh](http://zsh.org/)
* **terminal emulator**: [xterm](https://en.wikipedia.org/wiki/Xterm)
* **text editor**: [vim](http://vim.org)
* **web browser**: [luakit](https://github.com/mason-larobina/luakit)
* **window manager**: [awesome](http://awesome.naquadah.org/)

### recommended & required tools

these are _not_ installed by the bootstrap script!  you'll need to install them
yourself, preferably before running it.  the default location is fine unless
noted.

* [beets](http://beets.radbox.org) for managing my music library
* [exuberant ctags](http://ctags.sourceforge.net/) for indexing my code
* [git](http://git-scm.org) for version control
* [isync](http://isync.sourceforge.net/) for receiving email
* [keychain](http://www.funtoo.org/wiki/Keychain) for managing your ssh and gpg
  agents & passphrases
* [matcher](https://github.com/burke/matcher) for fuzzy finding paths
* [mpd](http://mpd.wikia.com/wiki/Music_Player_Daemon_Wiki) for serving music
  to ncmpcpp
* [msmpt](http://msmtp.sourceforge.net) for sending email
* [notmuch](http://notmuchmail.org/) for indexing and searching email
* [the silver searcher](https://github.com/ggreer/the_silver_searcher) for
  replacing grep
* [vimperator](http://vimperator.org) for keyboard-centric navigation in
  firefox
* [wkhtmltopdf](http://code.google.com/p/wkhtmltopdf/) for rendering markdown
  for printing

### vim plugins

see `vim/vim.symlink/config/vundle.vim`

folder structure
----------------

- **bin/**: anything in `bin/` will get added to your `$PATH` and be made
  available everywhere

- **functions/**: these are lazy loaded as ZSH functions

- **topic/\*.zsh**: any files ending in `.zsh` get loaded into your environment

- **topic/\*.symlink**: any files ending in `*.symlink` get symlinked into your
  `$HOME`

- **topic/\*.completion.zsh**: any files ending in `completion.zsh` get loaded
  last so that they get loaded after we set up zsh autocomplete functions


license
-------

see `UNLICENSE.md`

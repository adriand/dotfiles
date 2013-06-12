nilved does dotfiles
====================

install
-------

```sh
git clone https://github.com/devlinzed/dotfiles ~/.dotfiles
cd ~/.dotfiles
./bootstrap
```

this will:

1. check out the git submodules (vim, zsh, luakit plugins)
2. create symlinks (see "folder structure" below)
3. install the required system-wide ruby gems
4. install the proper font for powerline
5. update luakit's adblock subscriptions
6. compile anything we set up beforehand

the bootstrap script is idempotent and you can run it again to update symlinks
and vim plugins.  you may need to run it as root.

if you check out to somewhere other than `~/.dotfiles`, you'll need to edit
some files that hard-code that path in because they can't accept environment
variables.  try `git grep dotfiles | grep -v '^README\.md'`.

what i use
----------

this is a very opinionated repository and it configures and utilizes the
following programs.  these should be installed before you run the bootstrap
script.

* **color scheme**: [base16](https://github.com/chriskempson/base16)
* **display manager**: [slim](http://slim.berlios.de/)
* **email**: [mutt](http://mutt.org/)
* **feed reader**: [newsbeuter](http://newsbeuter.org/)
* **font**: [dejavu sans mono for powerline](https://github.com/Lokaltog/powerline-fonts)
* **music player**: [ncmpcpp](http://ncmpcpp.rybczak.net/)
* **operating system**: [ubuntu](http://ubuntu.com)
* **password manager**: [pass](http://zx2c4.com/projects/password-store/)
* **shell**: [zsh](http://zsh.org/)
* **terminal emulator**: [xterm](https://en.wikipedia.org/wiki/Xterm)
* **text editor**: [vim](http://vim.org)
* **web browser**: [luakit](http://luakit.org)
* **window manager**: [awesome](http://awesome.naquadah.org/)

### recommended & required tools

it's recommended that these secondary tools be installed beforehand as well.

* [beets](http://beets.radbox.org) for managing my music library
* [exuberant ctags](http://ctags.sourceforge.net/) for indexing my code
* [git](http://git-scm.org) for version control
* [hub](https://github.com/defunkt/hub) for extending git
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
* [wkhtmltopdf](http://code.google.com/p/wkhtmltopdf/) for rendering markdown
  for printing

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

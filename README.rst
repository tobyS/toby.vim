======
README
======

This is my current VIM setup. It is not meant to be used by anyone else than
me. It is not meant to deal as a modular environment for anyone. The only thing
that it can deal for is as an example. Feel free to fork as basis for your
setup, while I recommend to just looking into it and get inspiration from it.

-------
Install
-------

1. Clone this Git repo
2. Run ``$ ./vundle_install.sh``
3. Link the following files::

        ~/.vim          -> <repo>/
        ~/.vimrc        -> <repo>/vimrc

4. Run the following command to install all bundles::

        vim +BundleInstall +qall

   Alternatively you can execute the following in VIM itself::

        :BundleInstall

5. If you want to use the powerline, you need to install it, too::

        pip install --user git+git://github.com/Lokaltog/powerline

--------------------------
Thanks for inspirations to
--------------------------

- Benjamin Eberlei (https://github.com/beberlei)
- Jakob Westhoff (https://github.com/jakobwesthoff)

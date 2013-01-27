=======
Install
=======

1. Clone this Git repo
2. Run ``$ ./vundle_install.sh``
3. Link the following files::

        ~/.vim          -> <repo>/
        ~/.vimrc        -> <repo>/vimrc

4. Run the following command to install all bundles::

        vim +BundleInstall +qall

   Alternatively you can execute the following in VIM itself::

        :BundleInstall

Thanks for inspirations to

- Benjamin Eberlei (https://github.com/beberlei)
- Jakob Westhoff (https://github.com/jakobwesthoff)

This is a copy of my original (~2010ish) iOS class slides. The code to regenerate the slides, `seed.rb` and `regen` is a bit out of date, so there may be some spelunking necessary before getting the slide generation to work correctly again.

Required to build slides:

* Pygments ( `easy_install pygments` )
    * This is going away in the future.
* Pandoc ( `brew install ghc`, `brew install haskell-platform`, `cabal install pandoc` )
* Menukeys ( `tlmgr install menukeys` )
* TeXLive
* pdflatex ( _likely included with a TeX distribution? I'm using http://tug.org/mactex/_ )
* Ruby
* Bundler

Instructions:

Install the above packages, then run `bundle install` to install any required Ruby gems.  You can rebuild all slides by executing `rebuild.sh`, or you can use `guard` to regenerate the slides as you make changes.




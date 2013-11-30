These are my iOS class slides, currently being redone to be a bit more modern. `labs` are XCode projects, `code` are snippets not necessarily suitable as full blown labs, `schedule.yml` is the actual slide content. Run `guard` to update while editing.

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

Server code has class instructions as well as test URLs for class code to hit. Push to heroku via `git subtree push --prefix server heroku master`


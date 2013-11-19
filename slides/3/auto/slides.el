(TeX-add-style-hook "slides"
 (lambda ()
    (LaTeX-add-bibliographies)
    (LaTeX-add-labels
     "listing:39"
     "listing:40"
     "listing:41"
     "listing:42")
    (TeX-add-symbols
     '("icon" 1))
    (TeX-run-style-hooks
     "minted"
     "cite"
     "url"
     "listing"
     "verbatim"
     "pgfshade"
     "pgfheaps"
     "pgfautomata"
     "pgfnodes"
     "pgfarrows"
     "pgf"
     "inputenc"
     "utf8"
     "ucs"
     "wasysym"
     "thumbpdf"
     "caption"
     "hyperref"
     "latex2e"
     "beamer10"
     "beamer"
     "10pt")))


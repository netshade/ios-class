(TeX-add-style-hook "slides"
 (lambda ()
    (LaTeX-add-bibliographies)
    (LaTeX-add-labels
     "listing:27"
     "listing:28"
     "listing:29"
     "listing:30"
     "listing:31"
     "listing:32"
     "listing:33"
     "listing:34"
     "listing:35"
     "listing:36"
     "listing:37"
     "listing:38")
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


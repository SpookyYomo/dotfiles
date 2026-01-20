function mytex
    set -l bname (basename $argv | cut -d . -f1)
    if not latexmk -pdf -pdflatex="pdflatex -interactive=nonstopmode" "$bname.tex"
        pdflatex $bname && biber $bname && pdflatex $bname && pdflatex $bname
    end
end

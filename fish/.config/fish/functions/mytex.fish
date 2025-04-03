function mytex
    set -l bname (basename $argv | cut -d . -f1)
    pdflatex $bname && biber $bname && pdflatex $bname && pdflatex $bname
end

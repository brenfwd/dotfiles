# epic functions for bash

# check if pandoc and xe-latex are installed
if command -v pandoc >/dev/null 2>&1 && command -v xelatex >/dev/null 2>&1 && command -v cargo >/dev/null 2>&1 && cargo watch --help >/dev/null 2>&1; then
  # convert markdown to pdf
  function md2pdf() {
    pandoc -f markdown+raw_tex --pdf-engine=xelatex -o $1.pdf $1.md
  }

  function md2pdfwatch() {
    cargo watch -C . -w "$1.md" -s "pandoc -f markdown+raw_tex --pdf-engine=xelatex -o \"$1.pdf\" \"$1.md\""
  }
fi

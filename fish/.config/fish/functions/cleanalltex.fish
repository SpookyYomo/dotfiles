function cleanalltex
    argparse n/dry-run -- $argv

    set -l orig_cwd (pwd)
    if [ ( count $argv ) -ge 1 ]
        # Try to cd
        cd $argv
        or return
    end

    # Check if Dry run
    if set -q _flag_dry_run
        fd --one-file-system -t file --no-ignore-parent --extension 'bbl'
        fd --one-file-system -t file --no-ignore-parent --extension 'bcf'
        fd --one-file-system -t file --no-ignore-parent --extension 'blg'
        fd --one-file-system -t file --no-ignore-parent --extension 'dvi'
        fd --one-file-system -t file --no-ignore-parent --extension 'nav'
        fd --one-file-system -t file --no-ignore-parent --extension 'snm'
        fd --one-file-system -t file --no-ignore-parent --extension 'toc'
        fd --one-file-system -t file --no-ignore-parent --extension 'vrb'
        fd --one-file-system -t file --no-ignore-parent --extension 'aux'
        fd --one-file-system -t file --no-ignore-parent --extension 'fdb_latexmk'
        fd --one-file-system -t file --no-ignore-parent --extension 'fls'
        fd --one-file-system -t file --no-ignore-parent --extension 'log'
        fd --one-file-system -t file --no-ignore-parent --extension 'out'
        fd --one-file-system -t file --no-ignore-parent --extension 'synctex.gz'
        cd $orig_cwd
        return 0
    end

    fd --one-file-system -t file --no-ignore-parent --extension 'bbl' -X rm -v
    fd --one-file-system -t file --no-ignore-parent --extension 'bcf' -X rm -v
    fd --one-file-system -t file --no-ignore-parent --extension 'blg' -X rm -v
    fd --one-file-system -t file --no-ignore-parent --extension 'dvi' -X rm -v
    fd --one-file-system -t file --no-ignore-parent --extension 'nav' -X rm -v
    fd --one-file-system -t file --no-ignore-parent --extension 'snm' -X rm -v
    fd --one-file-system -t file --no-ignore-parent --extension 'toc' -X rm -v
    fd --one-file-system -t file --no-ignore-parent --extension 'vrb' -X rm -v
    fd --one-file-system -t file --no-ignore-parent --extension 'aux' -X rm -v
    fd --one-file-system -t file --no-ignore-parent --extension 'fdb_latexmk' -X rm -v
    fd --one-file-system -t file --no-ignore-parent --extension 'fls' -X rm -v
    fd --one-file-system -t file --no-ignore-parent --extension 'log' -X rm -v
    fd --one-file-system -t file --no-ignore-parent --extension 'out' -X rm -v
    fd --one-file-system -t file --no-ignore-parent --extension 'synctex.gz' -X rm -v
    cd $orig_cwd
end

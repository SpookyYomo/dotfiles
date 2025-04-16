function gcn
  # Checkouts the next commit of the specified branch
  set -l out (git log --reverse --pretty=%H $argv[1] | grep -A 1 $(git rev-parse HEAD) | tail -n1)
  # Checks that the specified argv is valid by ensuring grep or git log has not failed
  for p in $pipestatus
    if test $p -ne 0
      echo "Invalid branch?"
      return 1
    end
  end
  git checkout $out
end

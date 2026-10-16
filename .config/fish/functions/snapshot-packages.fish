function snapshot-packages
    set -l dir "$HOME/Backups/packages/inventory"
    mkdir -p "$dir"
    
    pacman -Q  > "$dir/all-packages.txt"
    pacman -Qe > "$dir/explicit-packages.txt"
    pacman -Qn > "$dir/repo-packages.txt"
    pacman -Qm > "$dir/foreign-packages.txt"
    pacman -Qq > "$dir/package-names.txt"
    
    echo "Package inventory updated at $dir"
end

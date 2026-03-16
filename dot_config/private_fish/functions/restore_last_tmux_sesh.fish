function restore_last_tmux_sesh
    set -l resurrect_dir ~/.local/share/tmux/resurrect
    set -l latest (ls -1t $resurrect_dir/tmux_resurrect_*.txt 2>/dev/null | head -1)

    if test -z "$latest"
        echo "No tmux resurrect files found"
        return 1
    end

    rm -f $resurrect_dir/last
    ln -s $latest $resurrect_dir/last
end

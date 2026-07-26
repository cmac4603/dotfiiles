function vpn --description 'Connect to VPN destinations'
    set -l target $argv[1]
    switch "$target"
        case berlin
            nmcli con up Germany-Berlin_TCP
        case '*'
            echo "Usage: vpn [berlin]"
            return 1
    end
end

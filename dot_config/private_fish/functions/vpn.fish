function vpn --description 'Connect to VPN destinations'
    set -l target $argv[1]
    switch "$target"
        case berlin
            nmcli con up Germany-Berlin_TCP
        case check
            curl -s https://cryptostorm.is/test | tail -n 1
        case autoconnect
            set -l action $argv[2]
            if test (count $argv) -gt 2
                echo "Usage: vpn autoconnect [off]" >&2
                return 2
            end
            if test -n "$action"; and test "$action" != off
                echo "Usage: vpn autoconnect [off]" >&2
                return 2
            end

            set -l vpn_uuid (nmcli -g connection.uuid connection show Germany-Berlin_TCP)
            if test $status -ne 0; or test -z "$vpn_uuid"
                echo "Unable to find the Germany-Berlin_TCP VPN connection." >&2
                return 1
            end

            set -l profiles (nmcli -t -f UUID,TYPE connection show)
            if test $status -ne 0
                echo "Unable to list NetworkManager connection profiles." >&2
                return 1
            end

            set -l updated 0
            for profile in $profiles
                set -l fields (string split ':' -- "$profile")
                if test (count $fields) -ne 2; or test "$fields[2]" != 802-11-wireless
                    continue
                end

                set -l uuid $fields[1]
                set -l secondaries (nmcli -g connection.secondaries connection show "$uuid")
                if test $status -ne 0
                    echo "Unable to read secondary connections for Wi-Fi profile $uuid." >&2
                    return 1
                end

                if test "$action" = off
                    nmcli connection modify "$uuid" ipv6.never-default no
                    or return 1
                    if contains -- "$vpn_uuid" $secondaries
                        nmcli connection modify "$uuid" -connection.secondaries "$vpn_uuid"
                        or return 1
                    end
                else
                    nmcli connection modify "$uuid" ipv6.never-default yes
                    or return 1
                    if not contains -- "$vpn_uuid" $secondaries
                        nmcli connection modify "$uuid" +connection.secondaries "$vpn_uuid"
                        or return 1
                    end
                end
                set updated (math $updated + 1)
            end

            if test "$action" = off
                echo "Disabled VPN auto-connect and restored Wi-Fi IPv6 defaults on $updated profile(s)."
            else
                echo "Configured VPN auto-connect and blocked Wi-Fi IPv6 default routes on $updated profile(s)."
            end
        case '*'
            echo "Usage: vpn [berlin|check|autoconnect [off]]"
            return 1
    end
end

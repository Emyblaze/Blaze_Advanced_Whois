#!/data/data/com.termux/files/usr/bin/bash

# Credits:
# Developed by RebelliousOne with the assistance of ChatGPT.
# Blaze Advanced Whois Lookup Tool

# Clear the screen for a fresh start
clear

# ================== Dependency Installation ====================
install_dependencies() {
    for pkg in whois curl torsocks tor; do
        if ! command -v $pkg &> /dev/null; then
            echo "Installing missing package: $pkg"
            sudo apt-get install -y $pkg
        fi
    done
}

install_dependencies

# ================== Tor Service Management =====================
start_tor_service() {
    if ! pgrep -x "tor" > /dev/null; then
        echo "Starting Tor service..."
        sudo service tor start
    fi
}

# ================== Display Help Menu ==========================
display_help() {
    echo "================ Blaze Advanced Whois Lookup Tool ================"
    echo "Welcome to Blaze Whois Tool. Here are the available features:"
    echo "Type a call sign to execute the desired feature:"
    echo "lookup - Perform a basic Whois lookup"
    echo "validate - Validate a domain/IP"
    echo "detailed - Detailed Whois Lookup"
    echo "batch - Batch Whois Lookup"
    echo "history - View lookup history"
    echo "vpn - Test VPN/IP Geolocation"
    echo "extract - Extract specific Whois Data"
    echo "private - Whois Lookup on Private Registrars"
    echo "anonymous - Enable anonymous mode for lookups"
    echo "exit - Exit the tool"
    echo "==========================================================="
    echo -n "Please enter a call sign: "
    read option
    execute_option $option
}

# ================== Feature Selection ==========================
execute_option() {
    case $1 in
        lookup) lookup ;;
        validate) validate ;;
        detailed) detailed ;;
        batch) batch ;;
        history) history ;;
        vpn) vpn ;;
        extract) extract ;;
        private) private ;;
        anonymous) toggle_anonymous ;;
        exit) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid call sign. Please try again."; display_help ;;
    esac
}

# ================== Anonymous Mode Toggle ======================
anonymous_mode=false

toggle_anonymous() {
    if $anonymous_mode; then
        anonymous_mode=false
        echo "Anonymity mode disabled."
    else
        anonymous_mode=true
        start_tor_service
        echo "Anonymity mode enabled. All lookups will use randomized IP addresses."
    fi
    display_help
}

# ================== Command Wrapper for Anonymity ==============
run_command() {
    local command="$1"
    if $anonymous_mode; then
        torsocks $command
    else
        $command
    fi
}

# ================== Whois Lookup ===============================
lookup() {
    echo -n "Enter domain or IP to lookup: "
    read domain
    run_command "whois $domain"
    echo -n "Do you want to see more details? (y/n): "
    read answer
    if [[ $answer == "y" ]]; then
        run_command "whois $domain | grep -A 20 'Registrant'"
    fi
    echo "$domain" >> ~/.whois_history
    display_help
}

# ================== Domain/IP Validation =======================
validate() {
    echo -n "Enter domain or IP to validate: "
    read domain
    if [[ $domain =~ ^[a-zA-Z0-9.-]+$ ]]; then
        echo "Valid domain/IP format."
    else
        echo "Invalid format."
    fi
    echo "$domain (validated)" >> ~/.whois_history
    display_help
}

# ================== Detailed Whois Lookup ======================
detailed() {
    echo -n "Enter domain or IP for detailed lookup: "
    read domain
    run_command "whois $domain | grep -A 30 'Registrar'"
    echo "$domain (detailed)" >> ~/.whois_history
    display_help
}

# ================== Batch Whois Lookup =========================
batch() {
    echo -n "Enter domains or IPs (space-separated) for batch lookup: "
    read -a domains
    for domain in "${domains[@]}"; do
        echo "Looking up $domain..."
        run_command "whois $domain"
        echo "$domain" >> ~/.whois_history
    done
    display_help
}

# ================== View Lookup History ========================
history() {
    echo "Recent lookups:"
    cat ~/.whois_history 2>/dev/null || echo "No history found."
    display_help
}

# ================== VPN/IP Geolocation =========================
vpn() {
    echo -n "Enter IP to test VPN and geolocation: "
    read ip
    run_command "curl ipinfo.io/$ip"
    display_help
}

# ================== Extract Specific Whois Data ================
extract() {
    echo -n "Enter domain or IP for extraction: "
    read domain
    run_command "whois $domain | grep -iE 'Registrar|Status|Creation'"
    echo "$domain (extracted)" >> ~/.whois_history
    display_help
}

# ================== Private Registrar Lookup ===================
private() {
    echo -n "Enter domain to lookup on private registrars: "
    read domain
    run_command "whois $domain | grep -i 'Private'"
    echo "$domain (private)" >> ~/.whois_history
    display_help
}

# ================== Auto-load Help on Script Execution =========
display_help

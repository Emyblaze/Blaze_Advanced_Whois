# Blaze Advanced Whois

Blaze Advanced Whois is a simple and efficient command-line tool designed to perform WHOIS lookups for domain names. It helps users retrieve domain registration details, including the registrar, registration date, expiration date, and status of the domain.

## Features
- **Perform WHOIS lookups** for various domain extensions.
- **Display essential domain registration details** clearly.
- **Lightweight and easy to use** with minimal dependencies.
- **Written in Bash** for simplicity and cross-platform compatibility (Linux, macOS, Termux on Android).
- **Formatted Output**: Provides WHOIS information in a clean and readable format, focusing on key details.
- **Bulk WHOIS Lookup**: Supports bulk WHOIS lookups for multiple domains or IPs from a text file.
- **Cross-Platform Compatibility**: Works across different Unix-based systems, including Android (via Termux).
- **Automatic Update Check**: Notifies users of available updates to keep the tool current.
- **Error Handling**: Provides helpful error messages if issues arise during WHOIS lookups.
- **Option for IP Geolocation**: Includes geolocation information for IP addresses where applicable.
- **Privacy-Focused**: Does not store any user data or log sensitive information, ensuring user privacy.
- **User Help**: Built-in usage instructions and help accessible via the script.
- **Anonymous Lookups**: Option to hide your own IP address during the WHOIS query for added privacy and security.
- **Minimal Dependencies**: Only depends on the `whois` package, making it lightweight and efficient.

## Installation

To use Blaze Advanced Whois, follow these steps:

### Prerequisites
- A Unix-based shell environment (Linux, macOS, or Termux on Android).
- The `whois` package installed on your system.

You can install the `whois` package using:

```bash
# For Debian/Ubuntu-based systems
sudo apt update && sudo apt install whois

# For Termux (Android)
pkg update && pkg install whois

Clone the Repository

git clone https://github.com/Emyblaze/Blaze_Advanced_Whois.git
cd Blaze_Advanced_Whois
chmod +x blaze_advanced_whois.sh

Usage

Run the script with the following command:

./blaze_advanced_whois.sh <domain>

Replace <domain> with the domain name you want to query. For example:

./blaze_advanced_whois.sh example.com

This command will display the WHOIS information for the specified domain.

Bulk WHOIS Lookup

To perform a bulk WHOIS lookup from a text file with domain names or IPs, use:

./blaze_advanced_whois.sh -f filename.txt

For more options, run:

./blaze_advanced_whois.sh --help

Anonymous WHOIS Lookup

To hide your IP address during the WHOIS query and maintain privacy, use:

./blaze_advanced_whois.sh --anonymous <domain>

This will mask your IP when performing the lookup.

Differences from Other WHOIS Tools

While there are many WHOIS lookup tools available, Blaze Advanced Whois offers several unique benefits:

1. Simplicity and Portability:
Unlike many existing WHOIS tools that rely on heavy dependencies or require complex setups, Blaze Advanced Whois is written purely in Bash, making it lightweight and easy to use across different Unix-based systems, including Android (via Termux).


2. Customizable Output:
Blaze Advanced Whois provides essential domain information in a clean format, focusing on key details users need without overwhelming them with unnecessary data.


3. Cross-Platform Compatibility:
Many WHOIS tools are designed primarily for desktop environments. Blaze Advanced Whois is optimized to run smoothly in mobile environments (such as Termux on Android), making it a versatile choice for users who need WHOIS lookup capabilities on the go.


4. Open Source and Extensible:
Blaze Advanced Whois is open source and easily customizable. Users can modify the script to add new features or tailor it to their specific needs, unlike proprietary tools with limited flexibility.


5. Minimal Dependencies:
Some WHOIS tools require additional software packages or even GUI-based components. Blaze Advanced Whois only depends on the whois package, making it lightweight and efficient.


6. Anonymous WHOIS Lookups:
Blaze Advanced Whois allows users to perform WHOIS lookups while hiding their IP address, ensuring privacy and security when querying domain registration information.


7. Privacy-Focused:
The tool does not log any user data or store sensitive information, providing a secure way to perform domain lookups without compromising user privacy.



License

This project is licensed under the MIT License - see the LICENSE file for details.

Contributing

We welcome contributions! If you find a bug or have a feature request, please open an issue or submit a pull request.

Author

Blaze Advanced Whois is developed and maintained by Chukwuemeka Abali Jr. with contributions from AI assistance in the development of features and optimization.

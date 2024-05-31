<h1 align="center"> 
  NucleiScanner = Nuclei + Subfinder + Gau + Paramspider + httpx
  <br>
</h1>

`NucleiScanner` is an automation tool that combines `Nuclei`, `Subfinder`, `Gau`, `Paramspider` and `httpx` functionality to enhance web application security testing. It uses `Subfinder` to collect subdomains, `Gau` to collect URLs by filtering unwanted extensions `ParamSpider` to identify potential entry points and `Nuclei Scanning templates` to scan for vulnerabilities. `NucleiScanner` streamlines the process, making it easier for security professionals and web developers to detect and address security risks efficiently. Download `NucleiScanner` to protect your web applications from vulnerabilities and attacks.

**Note:** `Nuclei` + `Subfinder` + `Gau` + `Paramspider` + `httpx` = `NucleiScanner` (will be improving) <br><br>
**Important:** Make sure the tools `Nuclei`, `Subfinder`, `Gau`, `Paramspider` & `httpx` are installed on your machine and executing correctly to use the `NucleiScanner` without any issues.

### Tools included:
[Nuclei](https://github.com/projectdiscovery/nuclei) `git clone https://github.com/projectdiscovery/nuclei.git`<br><br>
[Subfinder](https://github.com/projectdiscovery/subfinder) `git clone https://github.com/projectdiscovery/subfinder.git`<br><br>
[Gau](https://github.com/lc/gau) `git clone https://github.com/lc/gau.git`<br><br>
[ParamSpider](https://github.com/0xKayala/ParamSpider) `git clone https://github.com/0xKayala/ParamSpider.git`<br><br>
[httpx](https://github.com/projectdiscovery/httpx) `git clone https://github.com/projectdiscovery/httpx.git`


### Templates:
[Nuclei Templates](https://github.com/projectdiscovery/nuclei-templates) `git clone https://github.com/projectdiscovery/nuclei-templates.git`

## Screenshot
![image](https://github.com/0xKayala/NucleiScanner/assets/16838353/a015b1f3-d8ef-4291-b7a5-7f6512904e83)


## Usage

```sh
ns -h
```

This will display help for the tool. Here are the options it supports.

```console
NucleiScanner is a Powerful Automation tool for detecting Unknown Vulnerabilities in Web Applications

Usage: /usr/bin/ns [options]

Options:
  -h, --help              Display help information
  -d, --domain <domain>   Domain to scan for Unknown Vulnerabilities
  -f, --file <filename>   File containing multiple domains/URLs to scan
```  

## Installation:

To install `NucleiScanner`, follow these steps:

```
git clone the file && cd NucleiScanner && sudo chmod +x install.sh && ./install.sh && ns -h && cd ..
```

## Examples:

Here are a few examples of how to use NucleiScanner:

- Run `NucleiScanner` on a single domain:

  ```sh
  ns -d example.com
  ```

- Run `NucleiScanner` on multiple domains from a file:

  ```sh
  ns -f file.txt
  ```

## Practical Demonstration:

For a Practical Demonstration of the NucleiScanner tool see the below video 👇 <br>

## Contributing

Contributions are welcome! If you'd like to contribute to `RingBoy`, please follow these steps:

1. Fork the repository.
2. Create a new branch.
3. Make your changes and commit them.
4. Submit a pull request.


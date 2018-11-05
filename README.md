<p align="center">
	<img src="https://maxximou5.com/images/compressor/compressor-logo.png" alt="compressor logo">
	<br>
	<a href="https://github.com/Maxximou5/compressor/">
		<img src="https://img.shields.io/badge/version-1.0.0-green.svg?style=flat-square" alt="Version">
	</a>
	<a href="https://github.com/Maxximou5/compressor/stargazers">
		<img src="https://img.shields.io/github/stars/Maxximou5/compressor.svg?style=flat-square" alt="Stars">
	</a>
	<a href="https://github.com/Maxximou5/compressor/network">
		<img src="https://img.shields.io/github/forks/Maxximou5/compressor.svg?style=flat-square" alt="Forks">
	</a>
	<a href="https://github.com/Maxximou5/compressor/releases">
		<img src="https://img.shields.io/github/downloads/Maxximou5/compressor/total.svg?style=flat-square" alt="Downloads">
	</a>
	<a href="https://github.com/Maxximou5/compressor/issues">
		<img src="https://img.shields.io/github/issues/Maxximou5/compressor.svg?style=flat-square" alt="Issues">
	</a>
</p>

<h2 align="center">Compressor</h2>

A simple shell script to compress all files into bz2 files recursively in the specified path.

### Main Features

Uses bz2 to compress all files recursively through path specified.

Initially made for servers that server bz2 packages to clients, such as fast download for games like CS:GO.

	Usage: ./compressor.sh [options] [path]

	-h           | Print this message.
	-k           | Keep the original files after compression.
	-r           | Remove the original files after compression.
	-o           | Overwrite existing output files.

	Example: ./compressor.sh -ko /var/www/fastdl

### Credit
Icon made by Freepik
module.exports = {
  brew: [
    // http://conqueringthecommandline.com/book/ack_ag
    'ack',
    'ag',
    // cmake is required to compile vim bundle YouCompleteMe
    'cmake',
    // Install GNU core utilities (those that come with OS X are outdated)
    // Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
    'coreutils',
    'dos2unix',
    // Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
    'findutils',
    //'fortune',
    'gawk',
    // http://www.lcdf.org/gifsicle/ (because I'm a gif junky)
    //'gifsicle',
    'git-flow',
    'gnupg',
    // Install GNU `sed`, overwriting the built-in `sed`
    // so we can do "sed -i 's/foo/bar/' file" instead of "sed -i '' 's/foo/bar/' file"
    'gnu-sed --default-names',
    'gnu-tar',
    // better, more recent grep
    'homebrew/dupes/grep',
    // https://github.com/jkbrzt/httpie
    'httpie',
    'imagemagick',
    //'imagesnap',
    'ipcalc',
    'jpegoptim',
    // jq is a sort of JSON grep
    'jq',
    'keychain',
    // Mac App Store CLI: https://github.com/mas-cli/mas
    'mas',
    // Install some other useful utilities like `sponge`
    'moreutils',
    'mycli',
    'netcat',
    'nmap',
    'openconnect',
    'p7zip',
    'pv',
    'pwgen',
    'python',
    'python3',
    'reattach-to-user-namespace',
    'rpl',
    // better/more recent version of screen
    'homebrew/dupes/screen',
    'tmux',
    'tree',
    //'ttyrec',
    // better, more recent vim
    'vim --override-system-vi',
    'watch',
    // Install wget with IRI support
    'wget --enable-iri'
  ],
  cask: [
    //'adium',
    'alfred',
    //'amazon-cloud-drive',
    'atom',
    //'box-sync',
    //'comicbooklover',
    //'diffmerge',
    //'dropbox',
    //'evernote',
    'firefox',
    'google-chrome',
    'gpgtools',
    //'ireadfast',
    'iterm2',
    //'little-snitch',
    //'micro-snitch',
    //'macvim',
    'sequel-pro',
    'sizeup',
    //'sketchup',
    'slack',
    'spotify',
    'the-unarchiver',
    //'torbrowser',
    //'transmission',
    'vagrant',
    'virtualbox',
    //'vlc',
    'xquartz'
  ],
  gem: [
    'git-up'
  ],
  npm: [
    //'antic',
    //'buzzphrase',
    //'eslint',
    'instant-markdown-d',
    'npm-check',
    //'yo',
    //'generator-dockerize',
    'gulp',
    'prettyjson',
    'trash',
    'vtop'
  ]
};

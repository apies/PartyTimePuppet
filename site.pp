Exec {
  path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
}

exec { "download-and-extract-sublimetext2-tar":
  command => 'wget http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.1%20x64.tar.bz2; tar xf Sublime\ Text\ 2.0.1\ x64.tar.bz2',

}

exec { "move-sublime-executable-to-path":
  command => 'mv Sublime\ Text\ 2 /opt/;ln -s /opt/Sublime\ Text\ 2/sublime_text /usr/bin/sublime',
  require => Exec["download-and-extract-sublimetext2-tar"],
}



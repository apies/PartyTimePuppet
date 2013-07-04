class sublime_text_2 {
	 exec { "download-and-extract-sublimetext2-tar":
	 	command => 'wget http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.1%20x64.tar.bz2; tar xf Sublime\ Text\ 2.0.1\ x64.tar.bz2',

	 }

	 exec { "move-sublime-executable-to-path":
	 	command => 'mv Sublime\ Text\ 2 /opt/;ln -s /opt/Sublime\ Text\ 2/sublime_text /usr/bin/sublime',
	 	require => Exec["download-and-extract-sublimetext2-tar"],
	 }

	 file { "/usr/share/applications/sublime.desktop":
	 	source => "puppet:///modules/sublime_text_2/sublime.desktop",
	 	require => Exec["move-sublime-executable-to-path"],
	 }



	 exec { "clean-up-tar":
	 	command => 'rm -rf Sublime\ Text\ 2.0.1\ x64.tar.bz2',
	 	require => Exec["move-sublime-executable-to-path"],

	 }

	exec { "download-monaco":
		command => "wget http://jorrel.googlepages.com/Monaco_Linux.ttf",
		#path => "/usr/bin:/usr/sbin:/bin:/usr/local/bin",
		#refreshonly => true,
	
	}

	exec { "install-monaco":
		command => "mkdir /usr/share/fonts/truetype/custom; mv ./Monaco_Linux.ttf /usr/share/fonts/truetype/custom/;fc-cache -f -v",
		require => Exec["download-monaco"],
		#path => "/usr/bin:/usr/sbin:/bin:/usr/local/bin",
		#refreshonly => true,
	}

}



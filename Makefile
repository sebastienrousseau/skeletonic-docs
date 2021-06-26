build-en:
	@echo "Building Skeletonic Stylus English documentation"
	sh './tools/en/skeletonic-setup-en.sh'

build-theme-en:
	@echo "Building Skeletonic Stylus English theme"
	sh './tools/en/skeletonic-themes-en.sh'

build-fr:
	@echo "Building Skeletonic Stylus French documentation"
	sh './tools/en/skeletonic-setup-fr.sh'	

build-theme-fr:
	@echo "Building Skeletonic Stylus French theme"
	sh './tools/en/skeletonic-themes-fr.sh'

serve:
	@echo "Starting Skeletonic Stylus Web Server"
	serve -p 8000 site/
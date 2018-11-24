function install_init {
	if [ ! -d /etc/init.d ]; then
		_error "/etc/init.d does not exist. Is init.d installed?" 8
	fi
	cp /tmp/electrumx/contrib/init.d/electrumx /etc/init.d/
    chmod 755 /etc/init.d/electrumx
	cp /tmp/electrumx/contrib/systemd/electrumx.conf /etc/
	if [ $USE_ROCKSDB == 1 ]; then
		echo -e "\nDB_ENGINE=rocksdb" >> /etc/electrumx.conf
	fi
    update-rc.d electrumx defaults
	_info "Use service electrumx start to start electrumx once it's configured"
}

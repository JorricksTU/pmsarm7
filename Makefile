all: armhf armel

clean:
	rm -rf armhf/ armel/ dist/
armhf:
	mkdir -p armhf dist
	tar -zxvf skeleton.tgz -C armhf --strip=1
	grep spk plexserver.url | xargs basename | xargs -I file tar -xOf file package.tgz | tar -xzf - -C armhf/usr/lib/plexmediaserver
	rm -r armhf/usr/lib/plexmediaserver/dsm_config
	find armhf/usr/lib/plexmediaserver -iname "*.so" -exec chmod 644 {} \;
	find armhf/usr/lib/plexmediaserver -iname "*.so.*" -exec chmod 644 {} \;
	grep spk plexserver.url | xargs basename | awk -F '-' '{print $$2"-"$$3}' > armhf.version
	sed -i "s/\[VERSION\]/$$(cat armhf.version)/" armhf/DEBIAN/control
	sed -i "s/\[ARCH\]/armhf/" armhf/DEBIAN/control
	fakeroot dpkg-deb --build armhf dist
armel:
	mkdir -p armel dist
	tar -zxvf skeleton.tgz -C armel --strip=1
	grep deb plexserver.url | xargs basename | xargs dpkg-deb --fsys-tarfile | tar -xf - -C armel/usr/lib/plexmediaserver --strip-components=4 ./apps/plexmediaserver-annapurna/Binaries
	rm -r armel/usr/lib/plexmediaserver/config.xml
	find armel/usr/lib/plexmediaserver -iname "*.so" -exec chmod 644 {} \;
	find armel/usr/lib/plexmediaserver -iname "*.so.*" -exec chmod 644 {} \;
	grep deb plexserver.url | xargs basename | awk -F '_' '{print $$2}' > armel.version
	sed -i "s/\[VERSION\]/$$(cat armel.version)/" armel/DEBIAN/control
	sed -i "s/\[ARCH\]/armel/" armel/DEBIAN/control
	fakeroot dpkg-deb --build armel dist

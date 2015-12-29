ARCH="x86 x86-64"
VERSION="vivid stretch"
for i in $ARCH; do
	for y in $VERSION; do
		sed -e "s/@ARCH@/${i}/" -e "s/@VERSION@/${y}/" toxic_pbuild.xml  > config.$i.$y.xml
		curl -X POST "https://user:pass@build.tox.chat/createItem?name=toxic_pkg_linux_deb_shared_{$y}_{$i}_nightly_release" --data-binary "@config.${i}.${y}.xml" -H "Content-Type: text/xml"
	done
done


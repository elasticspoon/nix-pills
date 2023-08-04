unset PATH
for p in $baseInputs $buildInputs; do
	export PATH=$p/bin${PATH:+:}$PATH
done

function genericBuild() {
	unpackPhase
	configurePhase
	buildPhase
	installPhase
	fixupPhase
}

unpackPhase() {
	tar -xf $src

	# loops over all items and breaks upon entering a
	# subdirectory
	for d in *; do
		if [ -d "$d" ]; then
			cd "$d"
			break
		fi
	done
}

configurePhase() {
	./configure --prefix=$out
}

buildPhase() {
	make
}

installPhase() {
	make install
}

fixupPhase() {
	find $out -type f -exec patchelf --shrink-rpath '{}' \; -exec strip '{}' \; 2>/dev/null
}

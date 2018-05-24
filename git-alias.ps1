function gs() {
	git status
}

function gitpull() {
	git pull
}

function push() {
	git push
}

function commit() {
	git commit -m $args[0]
}

function gd() {
	git diff
}

function ga() {
	git add .
}

function cob() {
	git checkout -b $args[0]
}

function co() {
	git checkout $args[0]
}

# Override default gp alias
Set-Alias gp gitpull -Option AllScope -Force

# shortcuts for navigating to courses

function c() {
  cd $(coursedir $@)
}

function cl() {
  courselist $@
}

function mkcourse() {
  mkdir -p $(coursedir $@)
}

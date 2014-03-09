function grails_application_property() {
  echo `[[ -f application.properties ]] \
    && cat application.properties | grep $1 | sed 's/.*=\(.*\)*$/\1/'`
}

function grails_app_version() {
  grails_application_property app.grails.version
}

alias gr='gvm use grails $(grails_app_version) && grails'


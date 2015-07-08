# zsh functions

# Needs VELO_EMAIL to be set, will submit the form which will send a mail with the
# current waiting list number. (Not really sure why it doesn't send back the actual
# number)
function velo_position() {
velo_email="lewisfidlers@gmail.com"
curl -sS -X POST -d "CustEmail=$velo_email&form_id=checkposition_form" "https://www.velo-antwerpen.be/nl/registreren/wachtlijst-positie"
echo "An email will be arriving soon for: " + $velo_email
}

function ghkey () {
  if (( $# < 1 ))
  then
    echo "usage: ghkey <username>"
    return 1
  fi
  curl -sL https://github.com/$1.keys | pbcopy
}

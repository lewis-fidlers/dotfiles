# zsh functions

# Needs VELO_EMAIL to be set, will submit the form which will send a mail with the
# current waiting list number. (Not really sure why it doesn't send back the actual
# number)
function velo_position() {
velo_email="lenny.donnez@gmail.com"
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

function github (){
  open 'http://github.com/10to1'
}

# Monitor the wifi
#
# tldr; Apple's wifi bars are a lie. http://openradar.appspot.com/radar?id=5032012842795008
#
# To better find out what's happening this prints out the signal strength (📶), the noise (📢)
# the delta between signal and noise (Δ) and the throughput (📈)
#
# How to read this:
#
# If signal is > -70: your wifi is fine
# If signal is > -85 and < -70, look at the Δ, the higher the better.
# If signal is < -85, your wifi is the opposite of fine.
#
# Called without arguments it will print it once, called with an argument it will keep polling.
function ai() {
  airport_bin="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
  ruby -e 'puts "%3s %3s %3s %3s" %  ["📶", "📢", "Δ", "📈"]'
  if [ $1 ] && times=99999 || times=1
    while true; do
      $airport_bin -I |
      grep -E "CtlRSSI|CtlNoise|lastTxRate" |
      ruby -ne 'name, value = $_.split(": "); r ||= Hash.new(0); r[name.strip.gsub("agrCtl", "")] = value.strip; r["SNR"] = (r["RSSI"].to_f - r["Noise"].to_f); values = [r["RSSI"], r["Noise"], r["SNR"], r["lastTxRate"]]; print "\r%3d %3d %3d %3d" % values if r.keys.length == 4'
      ((times--))
      if (( $times > 0)); then sleep .5; else break; fi
    done
}

function find_user() {
  echo "be rails console"
  echo "u = User.where(\"email like '%10to1%'\").first"
}

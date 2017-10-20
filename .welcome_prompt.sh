#-------------------------------------------------------------------------------
# Welcome Prompt
# prints stats on terminal load
#-------------------------------------------------------------------------------

# welcome and unwelcome functions to toggle welcome_prompt are in .bash_prompt
WELCOME_PROMPT=true

welcome_msg() {
  # For Assess, set node version to 4.8.4
  nvm use 4.8.4

  echo ${BG_RED}${WHITE} \
      GRAY ${RESET}${WHITE}${BG_BLACK} \
      YEARGIN ${RESET}${BG_YELLOW}${BLACK} \
      Brooklyn, NY ${RESET}
  echo "------------------------------------------"
  echo $(git --version)
  if which brew >/dev/null; then
    echo $(brew -v)
  fi
  echo $(ruby -v)
  echo $(rails -v)
  echo $(heroku --version)
  echo ${BG_YELLOW}${BLACK} \
      NODE $(node --version)${RESET}
  echo ${RESET}${WHITE}${BG_BLACK} \
      NPM $(npm --version)${RESET}
  echo "------------------------------------------"
  echo "type ${BOLD}unwelcome${RESET} to remove this message"
}

if [[ $WELCOME_PROMPT == true ]]; then welcome_msg; fi

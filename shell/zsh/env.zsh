# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$PATH:$HOME/bin"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$PATH:$HOME/.local/bin"
fi

# openAI api key
if [ -f "$HOME/privacy/openAI/api_key.txt" ];then
    export OPENAI_API_KEY=$(cat $HOME/privacy/openAI/api_key.txt)
fi
